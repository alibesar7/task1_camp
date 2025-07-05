import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_1_camp/UI/Screens/HomeScreen/details_product_screen.dart';
import 'package:task_1_camp/cubit/product_cubit/product_states.dart';
import 'package:task_1_camp/custom_widget/custom_item.dart';
import '../../../cubit/product_cubit/productCubit.dart';
import 'package:dio/dio.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  static const routescreen = "Homescreen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int page = _pageController.page!.round();
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/HomeAssest/٢٠٢٣١١١٣_٠٠٣٣٠٩ - Copy.jpg"),
                    radius: 24.r,
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Jonathan",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("Let's go shopping",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.search, size: 28.sp),
                  SizedBox(width: 10.w),
                  Stack(
                    children: [
                      Icon(Icons.notifications_outlined, size: 28.sp),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset("assets/images/HomeAssest/Slice 5.png"),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: _currentPage == index ? 10.w : 8.w,
                  height: _currentPage == index ? 10.w : 8.w,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.black
                        : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            SizedBox(height: 10.h),

           //**************** ***************

            Expanded(
              child: BlocProvider(
                create: (context) => ProductCubit(Dio())..getproduct(),
          child: BlocConsumer<ProductCubit, ProductStates>(
            listener: (context, state) {
              if(state is SuccessProdect){
                print("success");
              }
              else if (state is LoadingProdect){
                print("loaddd");
              }
              else if(state is ErrorProdect){
                print ("errrorrr");
              }
            },
            builder: (context, state) {
              if (state is LoadingProdect) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorProdect) {
                return Center(child: Text(state.message));
              } else if (state is SuccessProdect) {
                final products = state.products;
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4.5,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsProductScreen(product: product,)));
                      },
                      child: CustomItem(
                        url: product.urlImage,
                        title: product.title,
                        des: product.descrption,
                        price: product.price.toString(),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("there aren't any Products"));
              }
            },
          ),
              )
            )
          ],
        ),
      ),
    );
  }
}

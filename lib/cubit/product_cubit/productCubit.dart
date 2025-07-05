import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1_camp/cubit/product_cubit/product_states.dart';

import '../../Models/product_model.dart';

class ProductCubit extends Cubit <ProductStates>{
  ProductCubit(this.dio):super(InitialProdect());
  final Dio dio;
  List<ProductModel>products=[];
  getproduct()async{
    emit(LoadingProdect());
    try{
      Response response= await dio.get("https://dummyjson.com/products") ;
      if(response.statusCode==200){
        products=[];
        for(var prodct in response.data["products"]){
          products.add(ProductModel.fromjson(prodct));
        }
        emit(SuccessProdect(products: products));
      }else{
        emit(ErrorProdect(message: "Error in Status code"));
      }
    }catch(e){
      emit(ErrorProdect(message: e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'login_states.dart';
class LoginCubit extends Cubit<LoginStates>{
     LoginCubit(this.dio):super(InitinalState());
     final Dio dio  ;
     Future<void> login(String username ,String password) async{
       emit(LoadingState());
         try{
           Response response = await dio.post("https://dummyjson.com/auth/login",
               data: {
                 "username":username,
                 "password":password
               },
               options: Options(
                   headers: {
                     "Content-Type":"application/json"
                   }
               )
           );
           if(response.statusCode==200){
             emit(SuccessState());
           }else{
             emit(ErrorState(mes: "Error in Status code"));
           }
         }catch(e){
            emit(ErrorState(mes: e.toString()));
         }
     }
 }
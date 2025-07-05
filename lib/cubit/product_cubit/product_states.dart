
import '../../Models/product_model.dart';

abstract class ProductStates {}

class InitialProdect extends ProductStates{}
class LoadingProdect extends ProductStates{}
class ErrorProdect extends ProductStates{
  final String message;
  ErrorProdect({required this.message});
}
class SuccessProdect extends ProductStates{
  List<ProductModel>products=[];
  SuccessProdect({required this.products});
}
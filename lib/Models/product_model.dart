class ProductModel{
  final int id;
  final String title;
  final String descrption;
  final double price;
  final String urlImage;
  final double rate;
  ProductModel(  {required this.id,
    required this.title,
    required this.descrption,
    required this.price,
    required this.urlImage,
    required this.rate
  });
  factory ProductModel.fromjson(Map<String,dynamic>json){
     return ProductModel(
         id: json["id"],
         title: json["title"],
         descrption: json["description"],
         price:json["price"],
         urlImage: json["thumbnail"],
         rate: json["rating"]
     );
  }
}
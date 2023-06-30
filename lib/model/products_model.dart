import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductsModel {
  int? id;
  String? productName;
  String? productCategory;
  int? price;
  String? description;
  var productImage;

  ProductsModel({
    this.id,
    this.productName,
    this.productCategory,
    this.price,
    this.description,
    this.productImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'productCategory': productCategory,
      'price': price,
      'description': description,
      'productImage': productImage.toMap(),
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'],
      productName: map['productName'].toString(),
      productCategory: map['productCategory'].toString(),
      price: map['price'],
      description: map['description'].toString(),
      productImage: map['productImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, productName: $productName, productCategory: $productCategory, price: $price, description: $description, productImage: $productImage)';
  }
}

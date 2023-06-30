import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoriesModel {
  int? id;

  String? categorty;
  var categoryImage;

  CategoriesModel({
    this.id,
    this.categorty,
    this.categoryImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categorty': categorty,
      'categoryImage': categoryImage.toMap(),
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'],
      categorty: map['categorty'],
      categoryImage: map['categoryImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoriesModel(id: $id, categorty: $categorty, categoryImage: $categoryImage)';
}

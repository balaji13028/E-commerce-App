// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shopping_app/model/products_model.dart';

class FavoriteModel {
  int? id;
  ProductsModel? pordcuts;
  FavoriteModel({
    this.id,
    this.pordcuts,
  });

  FavoriteModel copyWith({
    int? id,
    ProductsModel? pordcuts,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      pordcuts: pordcuts ?? this.pordcuts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pordcuts': pordcuts?.toMap(),
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      pordcuts: map['pordcuts'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FavoriteModel(id: $id, pordcuts: $pordcuts)';
}

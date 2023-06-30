import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/categories_model.dart';

class CategoryController extends GetxController {
  var categoriesList = <CategoriesModel>[].obs;
  final controller = TextEditingController().obs;
  var searchCategoriesList = <CategoriesModel>[].obs;
  var onsearch = false.obs;

  @override
  void onInit() {
    fatchCategories();
    super.onInit();
  }

  searchCategories(String text) {
    searchCategoriesList.clear();
    if (text.isNotEmpty) {
      for (var value in categoriesList) {
        if (value.categorty!
            .toLowerCase()
            .contains(text.toLowerCase().trim())) {
          searchCategoriesList.add(value);
        }
      }
    }
  }

  fatchCategories() async {
    var categories = [
      CategoriesModel(
        id: 1,
        categorty: 'Mobiles',
      ),
      CategoriesModel(
        id: 2,
        categorty: 'Fashion',
      ),
      CategoriesModel(
        id: 3,
        categorty: 'Electronics',
      ),
      CategoriesModel(
        id: 4,
        categorty: 'Home',
      ),
      CategoriesModel(
        id: 5,
        categorty: 'Sports',
      ),
      CategoriesModel(
        id: 6,
        categorty: 'Personal Care',
      ),
      CategoriesModel(
        id: 7,
        categorty: 'Appliances',
      ),
      CategoriesModel(
        id: 8,
        categorty: 'Grocery',
      ),
      CategoriesModel(
        id: 9,
        categorty: 'Toys',
      ),
      CategoriesModel(
        id: 10,
        categorty: 'Furniture',
      )
    ];
    categoriesList.value = categories;
  }
}

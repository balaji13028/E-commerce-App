import 'package:get/get.dart';
import 'package:shopping_app/model/products_model.dart';

class FavoriteController extends GetxController {
  var favoriteItemsList = <ProductsModel>[].obs;

  addToFAv(item) async {
    favoriteItemsList.add(item);
  }
}

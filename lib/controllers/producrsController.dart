import 'package:get/get.dart';
import 'package:shopping_app/model/products_model.dart';

class ProductController extends GetxController {
  var productsList = <ProductsModel>[].obs;

  @override
  void onInit() {
    fatchProducts();
    super.onInit();
  }

  fatchProducts() async {
    var prodcuts = [
      ProductsModel(
        id: 1,
        productName: 'Product 1',
        description: 'Nice & good quality',
        price: 100,
      ),
      ProductsModel(
        id: 2,
        productName: 'Product 2',
        description: 'Nice & good quality',
        price: 140,
      ),
      ProductsModel(
        id: 3,
        productName: 'Product 3',
        description: 'Nice & good quality',
        price: 89,
      ),
      ProductsModel(
        id: 4,
        productName: 'Product 4',
        description: 'Nice & good quality',
        price: 98,
      ),
      ProductsModel(
        id: 5,
        productName: 'Product 5',
        description: 'Nice & good quality',
        price: 190,
      ),
      ProductsModel(
        id: 6,
        productName: 'Product 6',
        description: 'Nice & good quality',
        price: 469,
      ),
      ProductsModel(
        id: 7,
        productName: 'Product 7',
        description: 'Nice & good quality',
        price: 399,
      ),
      ProductsModel(
        id: 8,
        productName: 'Product 8',
        description: 'Nice & good quality',
        price: 119,
      ),
      ProductsModel(
        id: 9,
        productName: 'Product 9',
        description: 'Nice & good quality',
        price: 169,
      ),
    ];
    productsList.value = prodcuts;
  }
}

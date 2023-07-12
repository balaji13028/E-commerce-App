import 'package:e_commerce_cart/models/product_model.dart';
import 'package:e_commerce_cart/services/api_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isloading = false.obs;
  List<Product> productsList = <Product>[].obs;
  List<bool> onadded = <bool>[].obs;

  @override
  void onInit() {
    fatchProducts();
    super.onInit();
  }

  void fatchProducts() async {
    try {
      isloading(true);
      var products = await ApiServices().getProducts();
      if (products.isNotEmpty) {
        productsList = products;
      }
    } finally {
      isloading(false);
    }
  }
}

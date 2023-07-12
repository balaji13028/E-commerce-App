import 'package:e_commerce_cart/controllers/product_controller.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  List<Product> cartItems = <Product>[].obs;
  int get totalItems => cartItems.length;
  List<int> eachProductCount = <int>[].obs;
  RxDouble price = 0.0.obs;
  var tax = 0.0.obs;
  var totalPrice = 0.0.obs;
  List<bool> remove = <bool>[].obs;

  addtoCart(Product prodcut) async {
    cartItems.add(prodcut);
    eachProductCount.add(1);
    remove.add(false);
    price.value = cartItems.fold(0, (sum, item) => sum + item.price!);
    tax.value = ((18 / 100) * price.value).truncateToDouble();
    totalPrice.value = price.value + tax.value;
  }

  increaseCount(index, Product cartdetails) {
    eachProductCount[index]++;
    price + cartdetails.price!;
    tax.value = ((18 / 100) * price.value).truncateToDouble();
    totalPrice.value = price.value + tax.value;
  }

  decreaseCount(index, Product cartdetails) {
    eachProductCount[index]--;
    price - cartdetails.price!;
    tax.value = ((18 / 100) * price.value).truncateToDouble();
    totalPrice.value = price.value + tax.value;
  }

  removetoCart(Product cartDetails, index) async {
    //to remove the item from cart
    cartItems.remove(cartDetails);
    // to get the index of the productTtem form productsList.
    var position = Get.find<ProductController>()
        .productsList
        .indexWhere((e) => e == cartDetails);
    //To change the status of the added item in productList.
    Get.find<ProductController>().onadded[position] = false;
    eachProductCount.removeAt(index);
    remove.removeAt(index);

    price.value = price.value - cartDetails.price!;
    tax.value = ((18 / 100) * price.value).truncateToDouble();
    totalPrice.value = price.value + tax.value;
  }
}

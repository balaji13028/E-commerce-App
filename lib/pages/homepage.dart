import 'package:e_commerce_cart/controllers/cart_controller.dart';
import 'package:e_commerce_cart/helpers/color_pallete.dart';
import 'package:e_commerce_cart/models/product_model.dart';
import 'package:e_commerce_cart/pages/cartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.primaryColor,
        elevation: 0,
        title: const Text(
          'E-Commerce App',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.list_bullet,
                color: ColorPallete.iconColor,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                Get.to(CartPage(cartController: cartController, size: size));
              },
              icon: Stack(clipBehavior: Clip.none, children: [
                const Icon(
                  CupertinoIcons.cart_fill,
                  color: ColorPallete.iconColor,
                  size: 30,
                ),
                Positioned(
                    top: -3,
                    right: -2,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: ColorPallete.badgeColor,
                        child: Obx(() => Text(
                              cartController.totalItems.toString(),
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                      ),
                    ))
              ])),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Obx(() => productController.isloading.value
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      itemCount: productController.productsList.length,
                      itemBuilder: ((context, index) {
                        productController.onadded.add(false);
                        Product productdetails =
                            productController.productsList[index];
                        return Container(
                          height: size.height * 0.18,
                          width: size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              color: ColorPallete.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 1,
                                    color:
                                        ColorPallete.iconColor.withOpacity(0.2))
                              ]),
                          child: Row(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                width: size.width * 0.3,
                                height: size.height,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        productdetails.thumbnail!,
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            productdetails.title.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              productdetails.rating.toString(),
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 14,
                                              color: Colors.amber,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      productdetails.description.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      '₹ ${productdetails.price}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Obx(() => productController.onadded[index]
                                        ? Row(
                                            children: const [
                                              Icon(
                                                Icons.check,
                                                color: ColorPallete.badgeColor,
                                              ),
                                              Text(
                                                'Item added',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          )
                                        : ElevatedButton(
                                            onPressed: () async {
                                              cartController
                                                  .addtoCart(productdetails);
                                              productController.onadded[index] =
                                                  true;
                                            },
                                            child: const Text(
                                              'Add to cart',
                                              style: TextStyle(fontSize: 14),
                                            )))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

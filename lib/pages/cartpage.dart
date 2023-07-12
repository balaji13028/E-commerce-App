import 'package:e_commerce_cart/controllers/cart_controller.dart';
import 'package:e_commerce_cart/helpers/color_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class CartPage extends StatelessWidget {
  final Size size;
  final CartController cartController;
  const CartPage({super.key, required this.cartController, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPallete.primaryColor,
          title: Row(
            children: [
              const Text(
                'Cart',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 5),
              Obx(() => Text(
                    '(${cartController.totalItems})',
                    style: const TextStyle(color: Colors.black),
                  )),
            ],
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Text(
                '<',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Obx(
            () => cartController.cartItems.isNotEmpty
                ? SafeArea(
                    bottom: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: cartController.cartItems.length,
                            itemBuilder: ((context, index) {
                              Product cartDetails =
                                  cartController.cartItems[index];
                              return Container(
                                height: size.height * 0.18,
                                width: size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    color: ColorPallete.primaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 1,
                                          color: ColorPallete.iconColor
                                              .withOpacity(0.2))
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
                                              cartDetails.thumbnail!,
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  cartDetails.title.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    cartDetails.rating
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14),
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
                                            cartDetails.description.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            '₹ ${cartDetails.price}',
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Obx(() => Row(
                                                    children: [
                                                      GestureDetector(
                                                          onTap: cartController
                                                                          .eachProductCount[
                                                                      index] ==
                                                                  1
                                                              ? null
                                                              : () {
                                                                  cartController
                                                                      .decreaseCount(
                                                                          index,
                                                                          cartDetails);
                                                                },
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: 18,
                                                            color: cartController
                                                                            .eachProductCount[
                                                                        index] ==
                                                                    1
                                                                ? Colors.black26
                                                                : Colors.black,
                                                          )),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        cartController
                                                            .eachProductCount[
                                                                index]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      GestureDetector(
                                                          onTap: () {
                                                            cartController
                                                                .increaseCount(
                                                                    index,
                                                                    cartDetails);
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            size: 18,
                                                          ))
                                                    ],
                                                  )),
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController.removetoCart(
                                                        cartDetails, index);
                                                  },
                                                  child: const Icon(
                                                    CupertinoIcons.delete,
                                                    color: Colors.black,
                                                    size: 32,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Price Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Obx(() => Text(
                                  cartController.price.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'GST(18%)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              cartController.tax.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Amount',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              cartController.totalPrice.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
          ),
        ));
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:shopping_app/controllers/favoriteController.dart';
import 'package:shopping_app/controllers/producrsController.dart';
import 'package:shopping_app/helpers/color_palette.dart';
import 'package:shopping_app/model/categories_model.dart';
import 'package:shopping_app/pages/favourite_items.dart';

class ViewProducts extends StatefulWidget {
  const ViewProducts({super.key, required this.productCategory});
  final CategoriesModel productCategory;

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  List<bool> onadd = [];

  final ProductController productController = Get.put(ProductController());

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
        title: Text(
          widget.productCategory.categorty.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder:
                            ((context, animation, secondaryAnimation) =>
                                FavoritesItems())));
              },
              icon: const Icon(
                CupertinoIcons.heart,
                color: Colors.black,
                size: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.cart,
                color: Colors.black,
                size: 24,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => GridView.builder(
            itemCount: productController.productsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                mainAxisExtent: 235,
                crossAxisSpacing: 20),
            itemBuilder: ((context, index) {
              var product = productController.productsList[index];
              onadd.add(false);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: size.height * 0.18,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            product.description.toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            onadd[index] = !onadd[index];
                          });
                          if (onadd[index] == true) {
                            favoriteController.favoriteItemsList.add(product);
                          } else {
                            favoriteController.favoriteItemsList
                                .remove(product);
                          }
                        },
                        child: Icon(
                          onadd[index]
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: onadd[index]
                              ? ColorPalette.primaryColor
                              : Colors.black,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '₹${product.price}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

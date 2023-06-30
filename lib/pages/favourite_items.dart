import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/favoriteController.dart';
import 'package:shopping_app/helpers/color_palette.dart';
import 'package:shopping_app/pages/landing_page.dart';

class FavoritesItems extends StatelessWidget {
  FavoritesItems({super.key});

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Favorites',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: favoriteController.favoriteItemsList.isNotEmpty
              ? Obx(
                  () => GridView.builder(
                    itemCount: favoriteController.favoriteItemsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 235,
                            crossAxisSpacing: 20),
                    itemBuilder: ((context, index) {
                      var favItem = favoriteController.favoriteItemsList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            height: size.height * 0.18,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favItem.productName.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    favItem.description.toString(),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹${favItem.price}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      );
                    }),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Your favoriteItems are empty',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Get.offAll(const LandingPage());
                        },
                        child: const Text(
                          'Shop Now',
                          style: TextStyle(
                              color: ColorPalette.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )),
    );
  }
}

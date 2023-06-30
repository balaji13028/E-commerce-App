import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/categoryController.dart';
import 'package:shopping_app/pages/favourite_items.dart';
import 'package:shopping_app/pages/view_prodcuts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            title: categoryController.onsearch.value
                ? TextFormField(
                    autofocus: true,
                    autocorrect: false,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    controller: categoryController.controller.value,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          categoryController.onsearch.value = false;
                          categoryController.searchCategoriesList.clear();
                          categoryController.controller.value.clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Search here..',
                      hintStyle: const TextStyle(color: Colors.black45),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5)),
                    ),
                    onChanged: (value) {
                      categoryController.searchCategories(value);
                    },
                  )
                : const Text(
                    'Shopping App',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
            actions: categoryController.onsearch.value
                ? []
                : [
                    IconButton(
                        onPressed: () {
                          categoryController.onsearch.value = true;
                        },
                        icon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.black,
                          size: 24,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.bell,
                          color: Colors.black,
                          size: 24,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: ((context, animation,
                                          secondaryAnimation) =>
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'List of Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    itemCount:
                        categoryController.searchCategoriesList.isNotEmpty
                            ? categoryController.searchCategoriesList.length
                            : categoryController.categoriesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 160,
                            crossAxisSpacing: 20),
                    itemBuilder: ((context, index) {
                      var category =
                          categoryController.searchCategoriesList.isNotEmpty
                              ? categoryController.searchCategoriesList[index]
                              : categoryController.categoriesList[index];
                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: ((context, animation,
                                          secondaryAnimation) =>
                                      ViewProducts(
                                          productCategory: category))));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              height: size.height * 0.14,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                'Category Image\non here',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              category.categorty.toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/Provider/sign_up_provider.dart';
import 'package:e_commerce_app/view/Cart/cart.dart';
import 'package:e_commerce_app/view/Home/categories_view.dart';
import 'package:e_commerce_app/view/Home/offers_carousel.dart';
import 'package:e_commerce_app/view/Home/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Search Page/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: 0, viewportFraction: 1.0);
    int currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xffFC0293),
                )),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Consumer<SignUpProvider>(builder: (context, signUp, widget) {
            if (signUp.isBack == false) {
              return const Text(
                'Welcome to UR store',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            } else {
              return Text(
                'Hi ${signUp.dataApi.name}!',
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            }
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ProductProvider>(builder: (context, product, widget) {
              final products = product.getProducts;
              return SizedBox(
                height: 220,
                child: PageView.builder(
                  itemCount: 3,
                  controller: pageController,
                  onPageChanged: (int value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return OffersCarousel(
                      cardImage: product.image!,
                      id: product.id!,
                    );
                  },
                ),
              );
            }),
            // IndicatorWidget(currentIndex: currentIndex, length: 2),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const CategoriesView(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(
                                    categoryId: '',
                                    categoryName: '',
                                  )),
                        );
                      },
                      child: const Text(
                        'see all',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
            const ProductsGridView(),
          ],
        ),
      ),
    );
  }
}

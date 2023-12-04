import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/Provider/array_image_provider.dart';
import 'package:e_commerce_app/Provider/bottom_navigation_bar_provider.dart';
import 'package:e_commerce_app/Provider/cart_provider.dart';
import 'package:e_commerce_app/Provider/category_products_provider.dart';
import 'package:e_commerce_app/Provider/category_provider.dart';
import 'package:e_commerce_app/Provider/log_in_provider.dart';
import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/Provider/sign_up_provider.dart';
import 'package:e_commerce_app/view/Account%20Info/account_info.dart';
import 'package:e_commerce_app/view/Cart/cart.dart';
import 'package:e_commerce_app/view/Home/home.dart';
import 'package:e_commerce_app/view/LogIn%20page/login.dart';
import 'package:e_commerce_app/view/Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:e_commerce_app/view/Product%20Details/product_details.dart';
import 'package:e_commerce_app/view/Profile%20Page/profile_page.dart';
import 'package:e_commerce_app/view/Search%20Page/search_page.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/sign_up.dart';
import 'package:e_commerce_app/view/Verification%20page/verification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
    ChangeNotifierProvider(create: (_) => LogInProvider()),
    ChangeNotifierProvider(create: (_) => ImageArrayProvider()),
    ChangeNotifierProvider(create: (_) => CategoryProductsProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'متجر الكتروني',
        routes: {
          '/home': (context) => MainNavigationBar(),
          '/login': (context) => const LogInPage(),
          '/signup': (context) => const SignUpPage(),
          '/product': (context) => const ProductDetailsPage(productId: ''),
          '/homepage': (context) => const HomePage(),
          '/search': (context) => SearchPage(categoryId: '', categoryName: ''),
          '/profile': (context) => const ProfilePage(),
          '/account': (context) => const AccountInfo(),
          '/cart': (context) => const CartPage(),
          '/verification': (context) => const VerificationPage(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffFC0293),
            // ···
            //brightness: Brightness.dark,
          ),
        ),
        home: AnimatedSplashScreen(
          duration: 1000,
          nextScreen: MainNavigationBar(),
          splash: Image.asset(
            'assets/logo_ur.png',
          ),
          splashTransition: SplashTransition.sizeTransition,
        ));
  }
}

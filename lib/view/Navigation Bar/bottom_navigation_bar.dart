import 'package:e_commerce_app/Provider/bottom_navigation_bar_provider.dart';
import 'package:e_commerce_app/view/Profile%20Page/profile_page.dart';
import 'package:e_commerce_app/view/Search%20Page/search_page.dart';
import 'package:e_commerce_app/view/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigationBar extends StatelessWidget {
  MainNavigationBar({super.key});
  final currentTab = [
    const HomePage(),
    SearchPage(categoryId: '', categoryName: '',),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentTab],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(169, 129, 129, 129),
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
            currentIndex: provider.currentTab,
            onTap: (index) {
              provider.currentTab = index;
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_box_rounded,
                    size: 30,
                  ),
                  label: ''),
            ]),
      ),
    );
  }
}

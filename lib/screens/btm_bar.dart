import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_grocey_app/screens/cart.dart';
import 'package:my_grocey_app/screens/categories.dart';
import 'package:my_grocey_app/screens/home_screen.dart';
import 'package:my_grocey_app/screens/user.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<BottomBarScreen> {
  int cerrentindexBottom = 2;
  final List _pages = [
    const HomeScreen(),
    const CategoryiesScreen(),
    const CartScreen(),
    const UserScreen(),
  ];
  void _selectPage(int index) => setState(
        () => cerrentindexBottom = index,
      );
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: _pages[cerrentindexBottom],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: cerrentindexBottom,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  cerrentindexBottom == 0 ? Icons.home : Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(cerrentindexBottom == 1
                  ? Icons.category
                  : Icons.category_outlined),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(
                  cerrentindexBottom == 2 ? Icons.shop : Icons.shop_outlined),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(cerrentindexBottom == 3
                  ? Icons.person
                  : Icons.person_outlined),
              label: 'User'),
        ],
      ),
    );
  }
}

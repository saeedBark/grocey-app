import 'package:flutter/material.dart';
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
  int cerrentindexBottom = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'titel': 'Home Screen'},
    {'page': const CategoryiesScreen(), 'titel': 'Category Screen'},
    {'page': const CartScreen(), 'titel': 'Cart Screen'},
    {'page': const UserScreen(), 'titel': 'User Screen'}
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
        title: Text(_pages[cerrentindexBottom]['titel']),
      ),
      body: _pages[cerrentindexBottom]['page'],
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

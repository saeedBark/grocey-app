import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryiesScreen extends StatefulWidget {
  const CategoryiesScreen({Key? key}) : super(key: key);

  @override
  State<CategoryiesScreen> createState() => _CategoryiesScreenState();
}

class _CategoryiesScreenState extends State<CategoryiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('category')),
    );
  }
}

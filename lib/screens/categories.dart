import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_grocey_app/services/utils.dart';
import 'package:my_grocey_app/widgets/catergory_widget.dart';
import 'package:my_grocey_app/widgets/text_widget.dart';

class CategoryiesScreen extends StatefulWidget {
  const CategoryiesScreen({Key? key}) : super(key: key);

  @override
  State<CategoryiesScreen> createState() => _CategoryiesScreenState();
}

class _CategoryiesScreenState extends State<CategoryiesScreen> {
  List<Color> passedColors = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.pink
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath':
          'https://images.unsplash.com/photo-1569613562636-7492d9f77aed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHZlZ3RhYmxlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60',
      'title': 'Fruit',
    },
    {
      'imgPath':
          'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=601&q=80',
      'title': 'Vegetable',
    },
    {
      'imgPath':
          'https://images.unsplash.com/photo-1667644837613-f18447efe06e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'title': 'Tomato',
    },
    {
      'imgPath':
          'https://images.unsplash.com/photo-1569613562636-7492d9f77aed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1372&q=80',
      'title': 'Strawberries',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Categories',
          color: color,
          fontSize: 24,
          isTitle: true,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 240 / 250,
        children: List.generate(catInfo.length, (index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: CategoryWidget(
              title: catInfo[index]['title'],
              passedColor: passedColors[index],
              imgPath: catInfo[index]['imgPath'],
            ),
          );
        }),
      ),
    );
  }
}

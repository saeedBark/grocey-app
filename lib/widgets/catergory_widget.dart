import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_grocey_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CategoryWidget extends StatelessWidget {
  final String imgPath;
  final Color passedColor;
  final String title;
  const CategoryWidget(
      {Key? key,
      required this.imgPath,
      required this.passedColor,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenSize = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: passedColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: passedColor.withOpacity(0.7))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: _screenSize * 0.3,
            width: _screenSize * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgPath), fit: BoxFit.fill)),
          ),
          TextWidget(text: title, color: color, fontSize: 20)
        ],
      ),
    );
  }
}

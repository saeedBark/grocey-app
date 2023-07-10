import 'package:flutter/material.dart';
import 'package:my_grocey_app/provider/dark_theme_provider.dart';
import 'package:my_grocey_app/screens/btm_bar.dart';
import 'package:my_grocey_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';

void main() {
  runApp(const MyAppGrocey());
}

class MyAppGrocey extends StatefulWidget {
  const MyAppGrocey({Key? key}) : super(key: key);

  @override
  State<MyAppGrocey> createState() => _MyAppGroceyState();
}

class _MyAppGroceyState extends State<MyAppGrocey> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeChangeProvider,
        )
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen());
      }),
    );
  }
}

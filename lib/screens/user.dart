import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _ListTile(
              title: 'Address',
              color: color,
              subTitle: 'subtitle here',
              leading: Icons.person_2_outlined,
              trailing: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            _ListTile(
              title: 'Address',
              color: color,
              subTitle: 'subtitle here',
              leading: Icons.person_2_outlined,
              trailing: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            _ListTile(
              title: 'Address',
              color: color,
              subTitle: 'subtitle here',
              leading: Icons.person_2_outlined,
              trailing: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            _ListTile(
              title: 'Orders',
              color: color,
              leading: Icons.badge,
              trailing: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            _ListTile(
              title: 'WishList',
              color: color,
              leading: Icons.heart_broken,
              trailing: Icons.arrow_forward_ios,
              onTap: () {},
            ),
            SwitchListTile(
              title: const Text('Theme'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) => setState(() {
                themeState.setDarkTheme = value;
              }),
              value: themeState.getDarkTheme,
            ),
            _ListTile(
              title: 'Forget Password',
              color: color,
              leading: Icons.password_outlined,
              trailing: Icons.arrow_forward_ios,
              onTap: () {},
            ),
          ],
        ),
      ),
    ));
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final Color color;
  final String? subTitle;
  final IconData leading;
  final IconData trailing;
  final void Function() onTap;
  const _ListTile({
    Key? key,
    required this.title,
    this.subTitle,
    required this.leading,
    required this.trailing,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        fontSize: 22,
        isTitle: true,
      ),
      subtitle: (subTitle != null) ? Text(subTitle!) : null,
      leading: Icon(leading),
      trailing: Icon(trailing),
      onTap: onTap,
    );
  }
}

import 'package:flutter/gestures.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hi, ',
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'My Name',
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('My name is pressed');
                          }),
                  ],
                ),
              ),
              TextWidget(
                text: 'Email@email.com',
                color: color,
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              _ListTile(
                title: 'Address',
                color: color,
                subTitle: 'subtitle here',
                leading: Icons.person_2_outlined,
                trailing: Icons.arrow_forward_ios,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('adress'),
                      content: TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'write comment'),
                      ),
                      actions: [
                        IconButton(onPressed: () {}, icon: Text('Save'))
                      ],
                    );
                  },
                ),
              ),
              _ListTile(
                title: 'Others',
                color: color,
                leading: Icons.other_houses_outlined,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              _ListTile(
                title: 'Viewed',
                color: color,
                leading: Icons.view_agenda_outlined,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              _ListTile(
                title: 'WishList',
                color: color,
                leading: Icons.heart_broken_outlined,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'dark Theme' : 'light theme',
                  color: color,
                  fontSize: 22,
                ),
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
              _ListTile(
                title: 'Logout',
                color: color,
                leading: Icons.logout_outlined,
                trailing: Icons.arrow_forward_ios,
                onTap: () {},
              ),
            ],
          ),
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

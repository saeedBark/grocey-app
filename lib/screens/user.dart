import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ListTile(
          title: 'Address',
          subTitle: 'subtitle here',
          leading: Icons.person_2_outlined,
          trailing: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        _ListTile(
          title: 'Address',
          subTitle: 'subtitle here',
          leading: Icons.person_2_outlined,
          trailing: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        _ListTile(
          title: 'Address',
          subTitle: 'subtitle here',
          leading: Icons.person_2_outlined,
          trailing: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        _ListTile(
          title: 'Address',
          subTitle: 'subtitle here',
          leading: Icons.person_2_outlined,
          trailing: Icons.arrow_forward_ios,
          onTap: () {},
        ),
      ],
    ));
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData leading;
  final IconData trailing;
  final void Function() onTap;
  const _ListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(leading),
      trailing: Icon(trailing),
      onTap: onTap,
    );
  }
}

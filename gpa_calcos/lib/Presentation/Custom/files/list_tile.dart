import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.icon, this.trailling});
  final String title;
  final Widget icon;
  final Widget? trailling;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      trailing: trailling,
    );
  }
}

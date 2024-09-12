import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/colors.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.color5,
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(
              color: AppColors.color2,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )),
        title: Text(title),
        trailing: Switch(
          activeColor: AppColors.color2,
          focusColor: AppColors.color1,
          inactiveThumbColor: AppColors.color1,
          inactiveTrackColor: AppColors.color5,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class PasswordFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText; // Flag to control text visibility

  const PasswordFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = true,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _hideText = true; // State variable to control visibility

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 45.h, // Maintain consistent height
        width: 250.h,
        child: TextFormField(
          controller: widget.controller,
          obscureText: _hideText,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
            hintText: widget.labelText,
            hintStyle: TextStyle(
              color: MainColors.color3,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.h),
              borderSide: BorderSide(
                color: MainColors.color1, // Change border color based on error
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _hideText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _hideText = !_hideText;
                });
              },
            ),
          ),
          enabled: true,
        ),
      ),
    );
  }
}

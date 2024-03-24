import 'package:flutter/material.dart';

class MainGradient {
  BoxDecoration gradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF949798),
          Color(0xFF5E8D9B),
        ],
        begin: Alignment.topCenter,
        //  end: Alignment.bottomCenter,
      ),
    );
  }
}

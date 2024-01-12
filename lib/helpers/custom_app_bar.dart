import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.titelText});
  final String titelText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
      title: Text(
        titelText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';

class NotifIconBtn extends StatefulWidget {
  const NotifIconBtn({super.key});

  @override
  State<NotifIconBtn> createState() => _NotifIconBtnState();
}

class _NotifIconBtnState extends State<NotifIconBtn> {
  bool isActive = false;

  void toggleState() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        toggleState();
      },
      icon: Icon(
        Icons.check_circle_outline,
        color: isActive ? Coloors.iconNotActive : Coloors.iconActive,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_icon_btn.dart';

class CustomElevatedBtn extends StatefulWidget {
  const CustomElevatedBtn({
    super.key,
    required this.route,
    required this.text,
  });
  final Widget route;
  final String text;

  @override
  State<CustomElevatedBtn> createState() => _CustomElevatedBtnState();
}

class _CustomElevatedBtnState extends State<CustomElevatedBtn> {
  bool done = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Coloors.primaryColor)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget.route));
          },
          child: SizedBox(
            width: 200,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(fontSize: 20, color: Coloors.text),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        const NotifIconBtn()
      ],
    );
  }
}

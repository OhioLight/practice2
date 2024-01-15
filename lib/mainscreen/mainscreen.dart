import 'package:flutter/material.dart';
import 'package:practice2/home/bonus_page.dart';
import 'package:practice2/home/home_page.dart';
import 'package:practice2/widgets/custom_elevated_btn.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 50, top: 20),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomElevatedBtn(route: Home(), text: 'Standart Aufgaben'),
            SizedBox(
              height: 20,
            ),
            CustomElevatedBtn(route: BonusPage(), text: 'Bonus Aufgaben'),
          ],
        ),
      ),
    );
  }
}

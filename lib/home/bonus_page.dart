import 'package:flutter/material.dart';
import 'package:practice2/screens/bonus/anagram.dart';
import 'package:practice2/screens/bonus/fizzbuzz.dart';
import 'package:practice2/screens/bonus/klammern.dart';
import 'package:practice2/screens/bonus/multiplication_advanced.dart';
import 'package:practice2/screens/bonus/palindrom.dart';
import 'package:practice2/screens/bonus/prime_checker.dart';
import 'package:practice2/screens/bonus/quadratmuster.dart';
import 'package:practice2/screens/bonus/reverse_number.dart';
import 'package:practice2/screens/bonus/seconds_formatter.dart';
import 'package:practice2/screens/bonus/text_in_wort.dart';
import 'package:practice2/screens/bonus/textanalyse.dart';

import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_elevated_btn.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Coloors.icon,
          ),
        ),
        backgroundColor: Coloors.primaryColor,
        title: const Text(
          'Bonus Aufgaben',
          style: TextStyle(
              color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: TextAnalyse(), text: 'Textanalyse'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: FizzBuzz(), text: 'FizzBuzz'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: QuadratMuster(), text: 'Quadratmuster'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: Palindrom(), text: 'Palindrom'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: Klammern(), text: 'Klammern'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: PrimeChecker(), text: 'Prime Checker'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: ReverseNumber(), text: 'Reverse Number'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(
                  route: SecondsForm(), text: 'Seconds Formatter'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: Anagram(), text: 'Anagram'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: MultiAdvacend(), text: 'Advance Multi'),
              SizedBox(
                height: 20,
              ),
              CustomElevatedBtn(route: TextInWort(), text: 'Text zu Wort'),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

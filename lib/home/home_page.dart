import 'package:flutter/material.dart';
import 'package:practice2/screens/standart/aufteilung.dart';
import 'package:practice2/screens/standart/buchstabenzahl.dart';
import 'package:practice2/screens/standart/count_vowels.dart';
import 'package:practice2/screens/standart/durchschnitt.dart';
import 'package:practice2/screens/standart/einzigartige_elemente.dart';
import 'package:practice2/screens/standart/find_den_buchstaben.dart';
import 'package:practice2/screens/standart/haeufigkeit.dart';
import 'package:practice2/screens/standart/summe.dart';
import 'package:practice2/screens/standart/umrechnung_temp.dart';
import 'package:practice2/screens/standart/vorzeichen.dart';
import 'package:practice2/screens/standart/wortleange.dart';
import 'package:practice2/screens/standart/zeichen_kette.dart';

import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_elevated_btn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          'Standart Aufgaben',
          style: TextStyle(
              color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50, top: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedBtn(route: Summe(), text: 'Summe'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: Durchschnitt(), text: 'Durchschnitt'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: Haeufigkeit(), text: 'Häufigkeit'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: FindChar(), text: 'Buchstaben Suche'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: Vorzeichen(), text: 'Vorzeichen'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: Aufteilung(), text: 'Aufteilung'),
              SizedBox(height: 20),
              CustomElevatedBtn(
                  route: BuchstabenZahl(), text: 'Buchstaben Zahl'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: CountVowel(), text: 'Zähle Vokale'),
              SizedBox(height: 20),
              CustomElevatedBtn(
                  route: EinzigartigeElemente(), text: 'Einzigartig'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: Temp(), text: 'Temperatur'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: WortLeange(), text: 'Wort länge'),
              SizedBox(height: 20),
              CustomElevatedBtn(route: ZeichenKette(), text: 'Zeichenkette'),
            ],
          ),
        ),
      ),
    );
  }
}

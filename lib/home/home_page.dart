import 'package:flutter/material.dart';
import 'package:practice2/screens/aufteilung.dart';
import 'package:practice2/screens/buchstabenzahl.dart';
import 'package:practice2/screens/durchschnitt.dart';
import 'package:practice2/screens/find_den_buchstaben.dart';
import 'package:practice2/screens/haeufigkeit.dart';
import 'package:practice2/screens/summe.dart';
import 'package:practice2/screens/vorzeichen.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_elevated_btn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class PrimeChecker extends StatefulWidget {
  const PrimeChecker({super.key});

  @override
  State<PrimeChecker> createState() => _PrimeCheckerState();
}

class _PrimeCheckerState extends State<PrimeChecker> {
  final TextEditingController stringController = TextEditingController();
  int count = 0;
  bool isLoading = false;

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
          'Prime Checker',
          style: TextStyle(
              color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Aufgabe',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        '''Schreibe eine Funktion, die angibt, ob eine ganze Zahl eine Primzahl ist.
Hinweis: Weder 0 noch 1 sind Primzahlen.''',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Coloors.primaryColor,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                child: CustomStackTextField(
                  controller: stringController,
                  labelText: 'Text Eingeben',
                  hintFontSize: 10,
                  borderRadius: 25,
                  backgroundColor: Coloors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Coloors.primaryColor)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  String text = stringController.text;
                  List<String> targetLetters = ['a', 'e', 'i', 'u', 'o'];

                  int vowelCount(String text, List<String> targetLetters) {
                    for (int i = 0; i < text.length; i++) {
                      if (targetLetters.contains(text[i].toLowerCase())) {
                        count++;
                      }
                    }
                    return count;
                  }

                  await Future.delayed(const Duration(seconds: 3));
                  count = vowelCount(text, targetLetters);

                  setState(() {
                    isLoading = false;
                  });
                },
                child: const Text(
                  'Ergebnis',
                  style: TextStyle(fontSize: 20, color: Coloors.text),
                ),
              ),
              const SizedBox(height: 10),
              if (isLoading)
                const CircularProgressIndicator(
                  color: Coloors.primaryColor,
                )
              else
                (const SizedBox(
                  height: 36,
                )),
              const SizedBox(height: 10),
              const Text('Die Anzahl der Vokale'),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Coloors.lightBlue,
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: Coloors.primaryColor,
                      width: 3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$count',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

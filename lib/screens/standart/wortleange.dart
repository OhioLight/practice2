import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';

import 'package:practice2/widgets/custom_stack_textfield.dart';

class WortLeange extends StatefulWidget {
  const WortLeange({super.key});

  @override
  State<WortLeange> createState() => _WortLeangeState();
}

class _WortLeangeState extends State<WortLeange> {
  final TextEditingController numberController = TextEditingController();
  String result = '';
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
            color: Coloors.white,
          ),
        ),
        backgroundColor: Coloors.primaryColor,
        title: const Text(
          'Wort Länge',
          style: TextStyle(
              color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Aufgabe',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 300,
              child: Text(
                '''Schreibe eine Funktion, die für eine Liste aus Zeichenketten zurückgibt, 
                wie viele Buchstaben jedes der Wörter hat. Der Rückgabewert soll eine Map sein, 
                die aus den Wort-Wortlängen-Paaren besteht.''',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Coloors.primaryColor,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150,
              child: CustomStackTextField(
                textAlign: TextAlign.center,
                positionFromLeft: 10,
                controller: numberController,
                labelText: 'Zahl Eingeben',
                hintFontSize: 10,
                borderRadius: 25,
                backgroundColor: Coloors.white,
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
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Coloors.primaryColor)),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 3));
                checkNumber();

                setState(() {
                  isLoading = false;
                });
              },
              child: const Text(
                'Check',
                style: TextStyle(fontSize: 20, color: Coloors.text),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  void checkNumber() {
    setState(() {
      try {
        int number = int.parse(numberController.text);
        if (number > 0) {
          result = 'Positive';
        } else if (number < 0) {
          result = 'Negative';
        } else {
          result = 'Zero';
        }
      } catch (e) {
        result = 'Ungültige Eingabe';
      }
    });
  }
}

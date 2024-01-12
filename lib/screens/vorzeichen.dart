import 'package:flutter/material.dart';

import 'package:practice2/widgets/custom_stack_textfield.dart';

class Vorzeichen extends StatefulWidget {
  const Vorzeichen({super.key});

  @override
  State<Vorzeichen> createState() => _VorzeichenState();
}

class _VorzeichenState extends State<Vorzeichen> {
  final TextEditingController numberController = TextEditingController();
  String result = '';
  bool isLoading = false;
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
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Vorzeichen',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
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
                'Schreibe eine App, die prüft, ob eine Zahl negativ, positiv oder 0 ist. Überlege, wie die Rückgabe aussehen könnte und welche verschiedenen Möglichkeiten es gibt.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Colors.blue,
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
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            if (isLoading)
              const CircularProgressIndicator(
                color: Colors.blue,
              )
            else
              (const SizedBox(
                height: 36,
              )),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
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
                style: TextStyle(fontSize: 20, color: Colors.white),
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

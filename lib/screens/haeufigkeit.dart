import 'package:flutter/material.dart';
import 'package:practice2/functions/haeufigkeit.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class Haeufigkeit extends StatefulWidget {
  const Haeufigkeit({super.key});

  @override
  State<Haeufigkeit> createState() => _HaeufigkeitState();
}

class _HaeufigkeitState extends State<Haeufigkeit> {
  final TextEditingController stringController = TextEditingController();
  final TextEditingController charController = TextEditingController();
  int haeufigkeit = 0;
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
          'Häufigkeit',
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
                'Schreibe eine App, die zurückgibt, wie oft ein Buchstabe in einem String vorkommt.',
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
              width: 300,
              child: CustomStackTextField(
                controller: stringController,
                labelText: 'Text Eingeben',
                hintFontSize: 10,
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 60,
              child: CustomStackTextField(
                positionFromLeft: -125,
                controller: charController,
                labelText: 'Welcher Buchstabe soll gezählt werden',
                hintFontSize: 10,
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () async {
                String text = stringController.text;
                String targetLetter = charController.text;
                await Future.delayed(const Duration(seconds: 3));
                haeufigkeit = buchstabenZaehler(text, targetLetter);

                setState(() {
                  isLoading = false;
                });
              },
              child: const Text(
                'Ergebnis',
                style: TextStyle(fontSize: 20, color: Colors.white),
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
            const Text('Die Anzahl des Buchstabens'),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(
                    style: BorderStyle.solid, color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '$haeufigkeit',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

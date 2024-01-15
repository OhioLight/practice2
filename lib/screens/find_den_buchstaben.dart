import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class FindChar extends StatefulWidget {
  const FindChar({super.key});

  @override
  State<FindChar> createState() => _FindCharState();
}

class _FindCharState extends State<FindChar> {
  final TextEditingController stringController = TextEditingController();
  final TextEditingController charController = TextEditingController();
  bool isVorhanden = false;
  bool isLoading = false;

  bool buchstabenEnthalten(String text, String targetLetter) {
    bool isDa = false;
    for (int i = 0; i < text.length; i++) {
      if (text[i].toLowerCase() == targetLetter.toLowerCase()) {
        isDa = true;
      }
    }
    return isDa;
  }

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
          'Finde den Buchstaben',
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
                'Schreibe eine App, die zurückgibt, ob ein Buchstabe in einem String vorkommt. ',
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
            SizedBox(
              width: 60,
              child: CustomStackTextField(
                textAlign: TextAlign.center,
                positionFromLeft: -110,
                controller: charController,
                labelText: 'Welcher Buchstabe soll dabei sein',
                hintFontSize: 10,
                borderRadius: 25,
                backgroundColor: Coloors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Coloors.primaryColor)),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 3));
                isVorhanden = buchstabenEnthalten(
                    stringController.text, charController.text);
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
            if (isVorhanden)
              (const Text('ist Vorhanden'))
            else
              (const Text('ist nicht Vorhanden')),
          ],
        ),
      ),
    );
  }
}

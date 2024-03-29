import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class BuchstabenZahl extends StatefulWidget {
  const BuchstabenZahl({super.key});

  @override
  State<BuchstabenZahl> createState() => _BuchstabenZahlState();
}

class _BuchstabenZahlState extends State<BuchstabenZahl> {
  final TextEditingController textController = TextEditingController();

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
          'Buchstaben Zahl',
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
                'Schreibe eine App, die für eine Liste aus Zeichenketten zurückgibt, wie viele Zeichen jede der Zeichenketten hat. Der Rückgabewert soll jede Zeichenkette und die Anzahl der Zeichen darin enthalten. (Bsp: “David” -> 5, “Angi” -> 4 etc.)',
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
                controller: textController,
                labelText: 'Text Eingeben',
                borderRadius: 25,
                backgroundColor: Coloors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Coloors.primaryColor)),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                await Future.delayed(const Duration(seconds: 3));
                calculateStringLengths();
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text(
                'Ergebniss',
                style: TextStyle(fontSize: 20, color: Coloors.text),
              ),
            ),
            if (isLoading)
              const CircularProgressIndicator(
                color: Coloors.primaryColor,
              )
            else
              (const SizedBox(height: 36)),
            const SizedBox(
              height: 20,
            ),
            const Text('Länge der Einzelnen Texte:'),
            if (resultStrings.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children:
                      resultStrings.map((result) => Text(result)).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<String> resultStrings = [];
  void calculateStringLengths() {
    String inputText = textController.text;
    List<String> inputList = inputText.split(',');
    resultStrings = inputList.map((str) {
      String trimmedStr = str.trim().replaceAll(' ', '');
      return '$trimmedStr -> ${trimmedStr.length}';
    }).toList();
  }
}

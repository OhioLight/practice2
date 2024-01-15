import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class BuchstabenZahl extends StatefulWidget {
  const BuchstabenZahl({super.key});

  @override
  State<BuchstabenZahl> createState() => _BuchstabenZahlState();
}

class _BuchstabenZahlState extends State<BuchstabenZahl> {
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
            const SizedBox(
              width: 300,
              child: CustomStackTextField(
                labelText: 'Hier Eingabe text ändern',
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

                // hier bitte funktion einfügen

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
            const Text('hier trägst du ein was du ausgegeben bekommst'),
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  //hier die lösung eintragen
                  '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

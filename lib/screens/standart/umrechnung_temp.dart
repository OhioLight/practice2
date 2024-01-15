import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  final TextEditingController textController = TextEditingController();

  bool isLoading = false;
  List<String> chars = [];
  void splitString() {
    setState(() {
      String inputString = textController.text;
      chars = inputString.split('');
    });
  }

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
          'Temperatur Umwandel',
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
                '''Schreibe eine Funktion, die eine Temperatur von Celsius in Fahrenheit umrechnet (und umgekehrt). Die Funktion nimmt dabei den Temperaturwert, sowie einen Booleschen Wert entgegen, der angibt, ob in Celsius oder in Fahrenheit umgerechnet werden soll. Die Funktion soll das Ergebnis zurückgeben.
Hinweis: Grad Fahrenheit = Grad Celsius mal 1,8 plus 32''',
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
                splitString();

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
            const Text('Aufgeteilte Zeichen:'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(chars.join(', ')),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class Durchschnitt extends StatefulWidget {
  const Durchschnitt({super.key});

  @override
  State<Durchschnitt> createState() => _DurchschnittState();
}

class _DurchschnittState extends State<Durchschnitt> {
  final TextEditingController numbersController = TextEditingController();
  double average = 0.0;
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
          'Durchschnitt',
          style: TextStyle(color: Coloors.text),
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
                'Schreibe eine App, die den Durchschnitt einer Liste von Zahlen berechnet. Der Durchschnitt kann auch eine Kommazahl sein (Bsp.: [2, 3] -> 2.5). ',
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
                controller: numbersController,
                labelText: 'Zahlen Eingeben',
                hintText: 'Zahlen mit Kommatas trennen',
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
                setState(() {
                  isLoading = true;
                });

                await Future.delayed(const Duration(seconds: 3));
                calculateAverage();
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text(
                'Ergebniss',
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
            const Text('Der Durchschnitt ist:'),
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
                  average.toStringAsFixed(2),
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

  void calculateAverage() {
    final String numbersText = numbersController.text;
    final List<String> numbersStringList = numbersText.split(',');
    final List<double> numbersList = numbersStringList
        .map((numberString) => double.tryParse(numberString.trim()) ?? 0.0)
        .toList();

    double sum = numbersList.reduce((value, element) => value + element);
    average = sum / numbersList.length;
  }
}

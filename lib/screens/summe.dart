import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class Summe extends StatefulWidget {
  const Summe({super.key});

  @override
  State<Summe> createState() => _SummeState();
}

class _SummeState extends State<Summe> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  int result = 0;
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
          'Summe',
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
                'Schreibe eine App, die die Summe einer Liste von Zahlen anzeigt.',
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
              width: 100,
              child: CustomStackTextField(
                controller: firstNumberController,
                labelText: 'Erste Zahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: CustomStackTextField(
                controller: secondNumberController,
                labelText: 'Zweite Zahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                await Future.delayed(const Duration(seconds: 3));

                if (firstNumberController.text.isNotEmpty &&
                    secondNumberController.text.isNotEmpty) {
                  setState(
                    () {
                      result = int.parse(firstNumberController.text) +
                          int.parse(secondNumberController.text);
                    },
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: const Text(
                'Ergebniss',
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
            const Text('Das Ergebniss ist:'),
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
                  '$result',
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

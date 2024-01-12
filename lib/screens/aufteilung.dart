import 'package:flutter/material.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class Aufteilung extends StatefulWidget {
  const Aufteilung({super.key});

  @override
  State<Aufteilung> createState() => _AufteilungState();
}

class _AufteilungState extends State<Aufteilung> {
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
          'Aufteilung',
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
                'Schreibe eine App, die eine Zeichenkette in ihre einzelnen Zeichen aufteilt und diese zurückgibt.',
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
                controller: textController,
                labelText: 'Text Eingeben',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
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
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
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

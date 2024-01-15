import 'package:flutter/material.dart';

import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class Anagram extends StatefulWidget {
  const Anagram({super.key});

  @override
  State<Anagram> createState() => _AnagramState();
}

class _AnagramState extends State<Anagram> {
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
          'Anagram',
          style: TextStyle(
              color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Aufgabe',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        '''Schreibe eine Funktion, die prüft, ob eine gegebene Zeichenkette ein gültiges Anagramm einer anderen Zeichenkette ist. Ein Anagramm ist ein Wort, das durch Umordnen der Buchstaben ein anderes Wort ergibt.
Beispiele: Ort - Tor, Atlas - Salat, Brei - Bier, Ferien - Reifen, Riverpod - Provider.''',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
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
      ),
    );
  }
}

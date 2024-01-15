import 'package:flutter/material.dart';

import 'package:practice2/util/colors.dart';
import 'package:practice2/widgets/custom_stack_textfield.dart';

class Klammern extends StatefulWidget {
  const Klammern({super.key});

  @override
  State<Klammern> createState() => _KlammernState();
}

class _KlammernState extends State<Klammern> {
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
          'Klammern',
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
                        '''Schreibe eine App, die prüft, ob in einem Ausdruck mit Klammern jede geöffnete Klammer eine passende schließende Klammer hat: “(a + b) * ((c + d) * e)”.
        Weitere Beispiele:
        ● “((())())” ist gültig, da jede Klammer passend geschlossen wird.
        ● “(()))” ist nicht gültig, da eine Klammer mehr geschlossen wird als geöffnet.
        ● “(()()” ist nicht gültig, da eine Klammer mehr geöffnet wird als geschlossen.
        ● “)()” ist nicht gültig, da die erste Klammer keine öffnende Klammer hat.
        ● “())()(()” ist nicht gültig, da eine Klammer geschlossen wird, die keine öffnende
        Klammer hat und eine öffnende Klammer keine passende schließende Klammer hat. Hinweis: Auch hier gibt es wieder verschiedene Lösungsansätze.''',
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

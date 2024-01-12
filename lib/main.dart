import 'package:flutter/material.dart';
import 'package:practice2/bonusscreens/fizzbuzz.dart';
import 'package:practice2/bonusscreens/klammern.dart';
import 'package:practice2/bonusscreens/quadratmuster.dart';
import 'package:practice2/bonusscreens/textanalyse.dart';
import 'package:practice2/screens/aufteilung.dart';
import 'package:practice2/screens/buchstabenzahl.dart';
import 'package:practice2/screens/durchschnitt.dart';
import 'package:practice2/screens/find_den_buchstaben.dart';
import 'package:practice2/screens/haeufigkeit.dart';
import 'package:practice2/screens/summe.dart';
import 'package:practice2/screens/vorzeichen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Practice',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: const Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50, top: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Summe()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Summe',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Durchschnitt()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Durchschnitt',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Haeufigkeit()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Häufigekeit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FindChar()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Buchstabe',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Vorzeichen()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Vorzeichen',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Aufteilung()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Aufteilung',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BuchstabemZahl()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Buchstabenzahl',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextAnalyse()));
                },
                child: const SizedBox(
                  height: 50,
                  width: 200,
                  child: Center(
                      child: Text(
                    'Textanalyse',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FizzBuzz()));
                },
                child: const SizedBox(
                  height: 50,
                  width: 200,
                  child: Center(
                      child: Text(
                    'FizzBuzz',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Quadratmuster()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Quadratmuster',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Summe()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Palindrom',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Klammern()));
              },
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Klammern',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

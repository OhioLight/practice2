import 'package:flutter/material.dart';
import 'package:practice2/helpers/custom_stack_textfield.dart';

class Durchschnitt extends StatefulWidget {
  const Durchschnitt({super.key});

  @override
  State<Durchschnitt> createState() => _DurchschnittState();
}

class _DurchschnittState extends State<Durchschnitt> {
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
          'Durchschnitt',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: CustomStackTextField(
                labelText: 'Erste Zahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: CustomStackTextField(
                labelText: 'Zweite Zahl',
                borderRadius: 25,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

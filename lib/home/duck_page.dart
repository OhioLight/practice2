import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice2/util/colors.dart';

class DuckPage extends StatefulWidget {
  const DuckPage({super.key});

  @override
  State<DuckPage> createState() => _DuckPageState();
}

String imageUri = 'https://random-d.uk/api/randomimg';
const factsUri = 'https://03vpefsitf.execute-api.eu-west-1.amazonaws.com/prod/';

// getImageFromApi() async {
//   final Response responseImage = await get(Uri.parse(imageUri));
//   final String jsonImage = responseImage.body;

//   print(jsonImage);
//   return jsonImage;
// }

// getDuckImg() async {
//   final String jsonImage = await getImageFromApi();
//   final Map<String, dynamic> jsonImageMap = json.decode(jsonImage);
//   final String duckImage = jsonImageMap['image/jpeg'];
//   print(duckImage);
//   return duckImage;
// }

Future<String> getDataFromApi() async {
  final Response response = await get(Uri.parse(factsUri));
  final String jsonString = response.body;
  return jsonString;
}

Future<String> getDuckFact() async {
  final String jsonString = await getDataFromApi();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final String duckFact = jsonMap['fact'];
  return duckFact;
}

class _DuckPageState extends State<DuckPage> {
  bool isLoading = false;
  String newDuckImage = '';
  String newDuckFact = '';
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
          'Duck Facts',
          style: TextStyle(
              color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //Image.network(newDuckImage),
              const SizedBox(height: 40),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Coloors.primaryColor)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  // newDuckImage = await getDuckImg();
                  newDuckFact = await getDuckFact();
                  setState(() {
                    isLoading = false;
                  });
                },
                child: const Text(
                  'Random',
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
              const Text('fact about Ducks'),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Coloors.lightBlue,
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Coloors.primaryColor,
                        width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(newDuckFact.isEmpty
                        ? 'Drück auf den button'
                        : newDuckFact),
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

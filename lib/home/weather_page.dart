import 'package:flutter/material.dart';
import 'package:practice2/util/colors.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
              color: Coloors.icon,
            ),
          ),
          backgroundColor: Coloors.primaryColor,
          title: const Text(
            'Weather App',
            style: TextStyle(
                color: Coloors.text, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stadt: ',
                      style:
                          TextStyle(fontSize: 32, color: Coloors.primaryColor),
                    ),
                    Text(
                      'Stuttgart',
                      style:
                          TextStyle(fontSize: 32, color: Coloors.primaryColor),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gefühlte Temperatur: ',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '-10°',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temperatur: ',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '-4°',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Niederschlag: ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '15.00 mm',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tageszeit: ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Tag',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Standort: ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'lat: 48.783, long:9.183',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Coloors.primaryColor)),
                    onPressed: () {},
                    child: const Text(
                      'Vorhersage updaten',
                      style: TextStyle(
                          color: Coloors.text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}

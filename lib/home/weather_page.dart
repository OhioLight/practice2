import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice2/util/colors.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

String apiUri =
    'https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';

Future<String> fetchData() async {
  final Response response = await get(Uri.parse(apiUri));
  final String jsonString = response.body;
  return jsonString;
}

Future<String> getLat() async {
  final String jsonString = await fetchData();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final double lat = jsonMap['latitude'];

  return lat.toString();
}

Future<String> getLong() async {
  final String jsonString = await fetchData();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final double long = jsonMap['longitude'];

  return long.toString();
}

Future<String> getTemp() async {
  final String jsonString = await fetchData();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final double temp = jsonMap['current']['temperature_2m'];

  return temp.toString();
}

Future<String> getApparentTemp() async {
  final String jsonString = await fetchData();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final double apperentTemp = jsonMap['current']['apparent_temperature'];

  return apperentTemp.toString();
}

Future<int> getDayTime() async {
  final String jsonString = await fetchData();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final int isDayTime = jsonMap['current']['is_day'];

  return isDayTime;
}

// Future<String> getLocationId() async {
//   final String jsonString = await fetchData();
//   final Map<String, dynamic> jsonMap = json.decode(jsonString);
//   final String locationId = jsonMap['locationId'];

//   return locationId;
// }

Future<String> getPrecipitation() async {
  final String jsonString = await fetchData();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  final double precipitation = jsonMap['current']['precipitation'];

  return precipitation.toString();
}

class _WeatherPageState extends State<WeatherPage> {
  String? lat;
  String? long;
  String? location;
  int isDay = 0;
  String? temp;
  String? apperentTemp;
  String? precipitation;
  bool intToBool(int isDay) => isDay == 0 ? false : true;

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
                    'Stadt: Stuttgart',
                    style: TextStyle(
                        fontSize: 28,
                        color: Coloors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gefühlte Temperatur: $apperentTemp°',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temperatur: $temp°',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Niederschlag: $precipitation mm',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (intToBool(isDay))
                (const Text(
                  'Tageszeit: Tag',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ))
              else
                (const Text(
                  'Tageszeit: Nacht',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Standort: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'lat: $lat , long: $long',
                    style: const TextStyle(
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
                  onPressed: () async {
                    lat = await getLat();

                    long = await getLong();
                    // location = await getLocationId();
                    temp = await getTemp();
                    apperentTemp = await getApparentTemp();
                    precipitation = await getPrecipitation();
                    isDay = await getDayTime();
                    setState(() {});
                  },
                  child: const Text('Vorhersage updaten',
                      style: TextStyle(
                          color: Coloors.text,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}

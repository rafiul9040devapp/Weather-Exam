import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_exam/model/city_weather.dart';

import '../netowrk/fetch_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<CityWeather>>(
        future: getCityWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitWaveSpinner(
                color: Colors.blueAccent.shade200,
                waveColor: Colors.blueAccent.shade100,
                trackColor: Colors.white12,
                size: 100,
              ),
            );
          } else if (snapshot.hasError) {
            if (snapshot.error is TimeoutException) {
              return const Center(
                child: Text(
                    'Connection timeout. Please check your internet connection.'),
              );
            } else {
              return const Center(
                child: Text('An error has occurred.'),
              );
            }
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No weather is available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? List.empty().length,
              itemBuilder: (context, index) {
                CityWeather cityWeather = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: ListTile(
                      title: Text(
                        'City: ${cityWeather.city}',
                        style: const TextStyle(color: Colors.black, fontSize: 25),
                      ),

                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Temperature: ${cityWeather.temperature}°C',style: const TextStyle(color: Colors.grey,fontSize: 18),),
                          Text('Condition: ${cityWeather.condition}',style: const TextStyle(color: Colors.grey,fontSize: 18),),
                          Text('Humidity: ${cityWeather.humidity}%',style: const TextStyle(color: Colors.grey,fontSize: 18),),
                          Text('WindSpeed: ${cityWeather.windSpeed} m/s',style: const TextStyle(color: Colors.grey,fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

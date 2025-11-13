import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: const WeatherScreen()),
  );
}

class WeatherCity {
  final String city;
  final double current;
  final double min;
  final double max;
  final String weather;
  final Color color;
  final String weatherImage;

  WeatherCity({
    required this.city,
    required this.current,
    required this.min,
    required this.max,
    required this.weather,
    required this.color,
    required this.weatherImage,
  });
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WeatherCity> cities = [
      WeatherCity(
        city: 'PhnomPenh',
        current: 12.2,
        min: 10,
        max: 30,
        weather: 'cloudy',
        color: const Color(0xFFAE67FA),
        weatherImage:
            '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex4/cloudy.png',
      ),
      WeatherCity(
        city: 'Paris',
        current: 22.2,
        min: 10,
        max: 40,
        weather: 'cloudy',
        color: const Color(0xFF4ECDC4),
        weatherImage:
            '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex4/sunnyCloudy.png',
      ),
      WeatherCity(
        city: 'Rome',
        current: 45.2,
        min: 10,
        max: 40,
        weather: 'sunny',
        color: const Color(0xFFFF6B9D),
        weatherImage:
            '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex4/sunny.png',
      ),
      WeatherCity(
        city: 'Toulouse',
        current: 45.2,
        min: 10,
        max: 40,
        weather: 'cloudy',
        color: const Color(0xFFFFA94D),
        weatherImage:
            '/Users/nika/Computer_Science/Term1-Year3/Flutter/Lab_Practice/Dart-SE_G4-Y3/flutter_practice/lib/w5_practice/assets/ex4/veryCloudy.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [IconButton(icon: const Icon(Icons.menu), onPressed: null)],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: WeatherCard(city: cities[index]),
          );
        },
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherCity city;

  const WeatherCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [city.color, city.color.withValues(alpha: 0.7)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: city.color.withValues(alpha: 0.5), blurRadius: 12),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            bottom: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(city.weatherImage),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city.city,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Min ${city.min}°C',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Max ${city.max}°C',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${city.current}°C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

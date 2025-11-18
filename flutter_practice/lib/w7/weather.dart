import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seasons Cycle',
      home: const SeasonsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SeasonsPage extends StatelessWidget {
  const SeasonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> seasons = [
      'assets/images/Winter.jpg',
      'assets/images/Spring.jpg',
      'assets/images/Summer.jpg',
      'assets/images/Fall.jpg',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('SEASONS'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SeasonCard(country: 'FRANCE', seasonImages: seasons),
                  SeasonCard(country: 'CAMBODIA', seasonImages: seasons),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final String country;
  final List<String> seasonImages;

  const SeasonCard({
    super.key,
    required this.country,
    required this.seasonImages,
  });

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  int currentSeasonIndex = 0;

  void _nextSeason() {
    setState(() {
      currentSeasonIndex =
          (currentSeasonIndex + 1) % widget.seasonImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _nextSeason,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  widget.seasonImages[currentSeasonIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  widget.country,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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

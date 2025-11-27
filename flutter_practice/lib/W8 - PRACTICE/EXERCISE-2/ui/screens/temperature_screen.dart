import 'package:flutter/material.dart';

// class TemperatureScreen extends StatelessWidget {
//   TemperatureScreen({super.key});

//   final InputDecoration inputDecoration = InputDecoration(
//     enabledBorder: OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.white, width: 1.0),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     hintText: 'Enter a temperature',
//     hintStyle: const TextStyle(color: Colors.white),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40.0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Icon(
//               Icons.thermostat_outlined,
//               size: 120,
//               color: Colors.white,
//             ),
//             const Center(
//               child: Text(
//                 "Converter",
//                 style: TextStyle(color: Colors.white, fontSize: 45),
//               ),
//             ),
//             const SizedBox(height: 50),
//             const Text("Temperature in Degrees:"),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: inputDecoration,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 30),
//             const Text("Temperature in Fahrenheit:"),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Text('test'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Bonus
class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _celsiusController = TextEditingController();
  double _fahrenheit = 0;

  void _convertToFahrenheit(String value) {
    setState(() {
      if (value.isEmpty) {
        _fahrenheit = 0;
      } else {
        double celsius = double.tryParse(value) ?? 0;
        _fahrenheit = (celsius * 9 / 5) + 32;
      }
    });
  }

  @override
  void dispose() {
    _celsiusController.dispose();
    super.dispose();
  }

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                'Converter',
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text('Temperature in Degrees (Celsius):'),
            const SizedBox(height: 10),
            TextField(
              controller: _celsiusController,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: _convertToFahrenheit,
            ),
            const SizedBox(height: 30),
            const Text('Temperature in Fahrenheit:'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _fahrenheit.toStringAsFixed(2),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ButtonExercise()));
}

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _getBackgroundColor();
    final iconWidget = Icon(icon, color: Colors.white, size: 20);

    final textWidget = Text(label, style: const TextStyle(color: Colors.white));

    final List<Widget> children = iconPosition == IconPosition.left
        ? [iconWidget, const SizedBox(width: 8), textWidget]
        : [textWidget, const SizedBox(width: 8), iconWidget];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }
}

class ButtonExercise extends StatelessWidget {
  const ButtonExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Custom buttons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            // Submit Button (Blue)
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              iconPosition: IconPosition.left,
              type: ButtonType.primary,
            ),

            // Time Button (Green)
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              iconPosition: IconPosition.right,
              type: ButtonType.secondary,
            ),

            // Account Button (Grey)
            CustomButton(
              label: 'Account',
              icon: Icons.person,
              iconPosition: IconPosition.left,
              type: ButtonType.disabled,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HelperWidget extends StatelessWidget {
  const HelperWidget({super.key});

  @override
  // support bygpt
  Widget build(BuildContext context) {
    List<Color> gradientColor = const [Color(0xFFFE654D), Color(0xFFFE654D)];

    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Speech bubble shape (rounded rectangle)
          Container(
            width: 80,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                colors: gradientColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Icon(
              Icons.no_crash_outlined, // Placeholder for the police car icon
              color: Colors.white,
              size: 40,
            ),
          ),
          // Tail of the speech bubble (rotated triangle)
          Positioned(
            bottom: -5,
            child: Transform.rotate(
              angle: 3.14 / 4, // Rotate 45 degrees
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColor,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          // "Help" label at the top
          Positioned(
            top: -5,
            left: -5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Help",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

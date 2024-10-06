import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoweatherWidget extends StatelessWidget {
  const NoweatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/photo_2024-09-09_01-45-42.jpg'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'there is no Weather 😔 start ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 23,
              ),
            ),
            const Text(
              'searching now 🔍',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

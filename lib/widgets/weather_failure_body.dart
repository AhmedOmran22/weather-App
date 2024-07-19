import 'package:flutter/material.dart';

class WeatherFailureBody extends StatelessWidget {
  const WeatherFailureBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there was an error please 😞 ',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            'make sure that you entered ',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            ' correct name and Try',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            ' again ! ',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}

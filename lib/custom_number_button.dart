import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final Function function;
  const NumberButton({
    super.key,
    required this.function,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function(number);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SymbolButton extends StatelessWidget {
  final String symbol;
  final Function function;
  const SymbolButton({
    super.key,
    required this.function,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function(symbol);
      },
      child: Text(
        symbol,
        style: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 31, 206, 237),
        ),
      ),
    );
  }
}

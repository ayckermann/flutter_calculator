class ExtractionResult {
  final double first;
  final String second;
  final double third;

  ExtractionResult(this.first, this.second, this.third);
}

List<dynamic>? extractValuesAndOperator(String input) {
  // Define a regular expression pattern to match double values (including negative) and operators (+, -, *, /).
  final pattern = RegExp(r'(-?[\d.]+)\s*([+\-x/])\s*(-?[\d.]+)');

  // Use the firstMatch method to find the match in the input string.
  final match = pattern.firstMatch(input);

  if (match != null) {
    // Extract the matched groups and convert them to doubles and operator string.
    final firstDouble = double.parse(match.group(1)!);
    final operator = match.group(2)!;
    final secondDouble = double.parse(match.group(3)!);

    return [firstDouble, operator, secondDouble];
  } else {
    return null;
  }
}

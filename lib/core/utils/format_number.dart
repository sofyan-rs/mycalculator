// import 'package:intl/intl.dart';

String formatNumber({required String input, bool? removeLastNol}) {
  input = input.replaceAll(',', '');

  if (input.isEmpty) return '';

  bool isNegative = input.startsWith('-');
  if (isNegative) {
    input = input.substring(1);
  }

  List<String> parts = input.split('.');
  String integerPart = parts[0];
  String? decimalPart = parts.length > 1 ? parts[1] : null;

  // Manually format integer part for large numbers
  String formattedInteger = _formatLargeInteger(integerPart);

  String formatted =
      decimalPart != null && decimalPart.isNotEmpty
          ? '$formattedInteger.$decimalPart'
          : formattedInteger;

  if (removeLastNol == true && decimalPart != null) {
    formatted = formatted.replaceFirst(RegExp(r'\.0+$'), '');
    formatted = formatted.replaceFirstMapped(
      RegExp(r'(\.\d*?)0+$'),
      (m) => m[1]!,
    );
  }

  return isNegative ? '-$formatted' : formatted;
}

// Helper to manually add thousands separators to large integers
String _formatLargeInteger(String digits) {
  final buffer = StringBuffer();
  int count = 0;

  for (int i = digits.length - 1; i >= 0; i--) {
    buffer.write(digits[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      buffer.write(',');
    }
  }

  return buffer.toString().split('').reversed.join();
}

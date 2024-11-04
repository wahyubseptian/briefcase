import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

enum FormatType {
  decimal,
  percent,
  scientific,
  compact,
  compactLong,
  custom,
}

enum DecimalType {
  automatic,
  periodDecimal,
  commaDecimal,
}

String format3part(int number) {
  final formatter =
      NumberFormat('#,###', 'id_ID'); // 'id_ID' for Indonesian locale
  return formatter.format(number).replaceAll(',', '.');
}

String formatNumber(
  num? value, {
  required FormatType formatType,
  DecimalType? decimalType,
  String? currency,
  bool toLowerCase = false,
  String? format,
  String? locale,
}) {
  if (value == null) {
    return '';
  }
  var formattedValue = '';
  switch (formatType) {
    case FormatType.decimal:
      switch (decimalType!) {
        case DecimalType.automatic:
          formattedValue = NumberFormat.decimalPattern().format(value);
          break;
        case DecimalType.periodDecimal:
          formattedValue = NumberFormat.decimalPattern('en_US').format(value);
          break;
        case DecimalType.commaDecimal:
          formattedValue = NumberFormat.decimalPattern('es_PA').format(value);
          break;
      }
      break;
    case FormatType.percent:
      formattedValue = NumberFormat.percentPattern().format(value);
      break;
    case FormatType.scientific:
      formattedValue = NumberFormat.scientificPattern().format(value);
      if (toLowerCase) {
        formattedValue = formattedValue.toLowerCase();
      }
      break;
    case FormatType.compact:
      formattedValue = NumberFormat.compact().format(value);
      break;
    case FormatType.compactLong:
      formattedValue = NumberFormat.compactLong().format(value);
      break;
    case FormatType.custom:
      final hasLocale = locale != null && locale.isNotEmpty;
      formattedValue =
          NumberFormat(format, hasLocale ? locale : null).format(value);
  }

  if (formattedValue.isEmpty) {
    return value.toString();
  }

  if (currency != null) {
    final currencySymbol = currency.isNotEmpty
        ? currency
        : NumberFormat.simpleCurrency().format(0.0).substring(0, 1);
    formattedValue = '$currencySymbol$formattedValue';
  }

  return formattedValue;
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove all non-digit characters
    String cleanedText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Convert the string into an integer
    if (cleanedText.isEmpty) return newValue.copyWith(text: '');

    int value = int.parse(cleanedText);

    // Format the integer with periods for thousands separator
    String formattedText = _formatWithPeriods(value);

    // Return the new formatted text with updated cursor position
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  // Helper method to format the number with periods as thousands separators
  String _formatWithPeriods(int value) {
    String result = '';
    String stringValue = value.toString();
    int length = stringValue.length;

    for (int i = 0; i < length; i++) {
      result += stringValue[i];
      // Insert a period every 3 digits from the right (except for the last group)
      if ((length - i - 1) % 3 == 0 && i != length - 1) {
        result += '.';
      }
    }
    return result;
  }
}

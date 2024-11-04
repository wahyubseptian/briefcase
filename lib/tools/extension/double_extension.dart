import 'dart:math' as math;

extension DoubleExtensions on double {
  /// Formats the double as Indonesian Rupiah (e.g., "Rp 200.000")
  String toRupiah() {
    final formatted = toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}.',
    );
    return "Rp $formatted";
  }

  /// Rounds the double to the specified number of decimal places
  double roundTo(int decimalPlaces) {
    final factor = math.pow(10, decimalPlaces);
    return (this * factor).round() / factor;
  }

  /// Checks if the double is an integer
  bool isWholeNumber() => this == roundToDouble();

  /// Clamps the double within a minimum and maximum range
  double clampDouble(double min, double max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Converts the double to a percentage string (e.g., 0.25 -> "25%")
  String toPercentage({int decimalPlaces = 0}) {
    final percentage = (this * 100).toStringAsFixed(decimalPlaces);
    return "$percentage%";
  }
}

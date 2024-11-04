extension DateTimeExtensions on DateTime {
  /// Formats the DateTime to a readable string like "12 Oct 2024"
  String toReadableDate() {
    return "$day ${_monthToString(month)} $year";
  }

  /// Formats to "HH:mm" or "HH:mm:ss" based on whether seconds are shown
  String toTimeString({bool withSeconds = false}) {
    return withSeconds
        ? "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}"
        : "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  /// Checks if the DateTime is today
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Checks if the DateTime is yesterday
  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Checks if the DateTime is tomorrow
  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Returns a relative time description like "2 hours ago", "Yesterday", "In 3 days"
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 7) {
      return "$day ${_monthToString(month)} $year";
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "Just now";
    }
  }

  /// Returns whether the DateTime is in the future
  bool isFuture() => isAfter(DateTime.now());

  /// Adds a given number of days to the DateTime
  DateTime addDays(int days) => add(Duration(days: days));

  /// Helper function to convert month number to a short string (e.g., 1 -> Jan)
  String _monthToString(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return months[month - 1];
  }
}

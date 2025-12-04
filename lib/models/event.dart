class Event {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final String location;
  final String locationDetail;
  final DateTime date;
  final String time;
  final String category;
  final double? price;
  final String? status; // For My Events: Pending, Approved, Rejected
  bool isFavorite;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.location,
    required this.locationDetail,
    required this.date,
    required this.time,
    required this.category,
    this.price,
    this.status,
    this.isFavorite = false,
  });

  String get formattedDate {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${date.day} ${months[date.month - 1]}, ${date.year}';
  }

  String get priceText {
    if (price == null || price == 0) return 'Free';
    return 'From  US\$${price!.toStringAsFixed(2)}';
  }
}

class TimelineItem {
  final String id;
  final String date;
  final String title;
  final String description;
  final String type;
  final String source;
  final String category;

  TimelineItem({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.type,
    required this.source,
    required this.category,
  });

  factory TimelineItem.fromJson(Map<String, dynamic> json) {
    return TimelineItem(
      id: json['id'],
      date: json['date'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      source: json['source'],
      category: json['category'],
    );
  }
}

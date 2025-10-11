class TagItem {
  final String icon;
  final String label;

  TagItem({required this.icon, required this.label});

  factory TagItem.fromJson(Map<String, dynamic> json) => TagItem(
    icon: json['icon'] as String? ?? '',
    label: json['label'] as String? ?? '',
  );
}

class CategoryItem {
  final String icon;
  final String label;

  CategoryItem({required this.icon, required this.label});

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
    icon: json['icon'] as String? ?? '',
    label: json['label'] as String? ?? '',
  );
}

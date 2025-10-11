class BrandItem {
  final String image;
  final String name;
  final double rating;
  final int deliveryType;
  final double distance;
  final int minOrder;
  final String tag;

  BrandItem({
    required this.image,
    required this.name,
    required this.rating,
    required this.deliveryType,
    required this.distance,
    required this.minOrder,
    required this.tag,
  });

  factory BrandItem.fromJson(Map<String, dynamic> json) => BrandItem(
    image: json['image'] as String? ?? '',
    name: json['name'] as String? ?? '',
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    deliveryType: json['deliveryType'] as int? ?? 0,
    distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    minOrder: json['minOrder'] as int? ?? 0,
    tag: json['tag'] as String? ?? '',
  );
}

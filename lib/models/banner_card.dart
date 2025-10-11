import 'dart:convert';

class Bannercard {
  final String imagePath;
  final String mainLabel;
  final String subLabel;

  Bannercard({
    required this.imagePath,
    required this.mainLabel,
    required this.subLabel,
  });

  factory Bannercard.fromJson(Map<String, dynamic> json) {
    return Bannercard(
      imagePath: json['imagePath'] as String,
      mainLabel: json['mainLabel'] as String,
      subLabel: json['subLabel'] as String,
    );
  }
}

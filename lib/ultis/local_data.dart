import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/banner_card.dart';
import '../models/category_item.dart';
import '../models/tag_item.dart';
import '../models/brand_item.dart';

class LocalData {
  LocalData._();

  static Future<List<Bannercard>> loadBanners() async {
    final s = await rootBundle.loadString('assets/data/banner.json');
    final data = json.decode(s) as List<dynamic>;
    return data
        .map((e) => Bannercard.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<CategoryItem>> loadCategories() async {
    final s = await rootBundle.loadString('assets/data/categories.json');
    final data = json.decode(s) as List<dynamic>;
    return data
        .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<TagItem>> loadTags() async {
    final s = await rootBundle.loadString('assets/data/tags.json');
    final data = json.decode(s) as List<dynamic>;
    return data
        .map((e) => TagItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<BrandItem>> loadBrands() async {
    final s = await rootBundle.loadString('assets/data/brands.json');
    final data = json.decode(s) as List<dynamic>;
    return data
        .map((e) => BrandItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

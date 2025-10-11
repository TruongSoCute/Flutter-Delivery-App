import 'package:flutter/material.dart';
import 'package:food_delivery/models/banner_card.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/tag_item.dart';
import 'package:food_delivery/models/brand_item.dart';
import 'package:food_delivery/ultis/category_ulti.dart';
import 'package:food_delivery/ultis/local_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery/ultis/skeleton.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Row(
            children: [
              Icon(Icons.location_on, color: Color.fromRGBO(34, 35, 46, 1)),
              SizedBox(
                width: 155,
                child: Text(
                  "120 Yên Lãng, Hà Nội",
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  softWrap: false,
                  style: GoogleFonts.nunitoSans(
                    color: Color.fromRGBO(34, 35, 46, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromRGBO(34, 35, 46, 1),
              ),
              Spacer(),
              Icon(
                Icons.notifications_none,
                color: Color.fromRGBO(34, 35, 46, 1),
              ),
              SizedBox(width: 16),
              Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromRGBO(34, 35, 46, 1),
              ),
            ],
          ),
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          foregroundColor: Color.fromRGBO(34, 35, 46, 1),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm "Cơm tấm"',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(Icons.map, color: Color.fromRGBO(34, 35, 46, 1)),
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(
          child: Column(
            children: [
              // First row of categories (loaded from JSON)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FutureBuilder<List<CategoryItem>>(
                  future: LocalData.loadCategories(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      // category row skeleton (show a few placeholder items)
                      return SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemBuilder: (c, i) => Column(
                            children: [
                              SkeletonBox(
                                width: 60,
                                height: 60,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              const SizedBox(height: 8),
                              SkeletonBox(
                                width: 60,
                                height: 12,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemCount: 6,
                        ),
                      );
                    }
                    final categories = snap.data!;
                    // Render categories in a horizontal scroll view
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories
                            .take(6)
                            .map(
                              (c) => CategoryUtils.buildCategoryItem(
                                (c.icon as dynamic) as String,
                                (c.label as dynamic) as String,
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
              ),

              // Second row (remaining categories)
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: FutureBuilder<List<CategoryItem>>(
                  future: LocalData.loadCategories(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      // second category row skeleton
                      return SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemBuilder: (c, i) => Column(
                            children: [
                              SkeletonBox(
                                width: 60,
                                height: 60,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              const SizedBox(height: 8),
                              SkeletonBox(
                                width: 60,
                                height: 12,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemCount: 6,
                        ),
                      );
                    }
                    final categories = snap.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories
                            .skip(6)
                            .map(
                              (c) => CategoryUtils.buildCategoryItem(
                                (c.icon as dynamic) as String,
                                (c.label as dynamic) as String,
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: FutureBuilder<List<TagItem>>(
              future: LocalData.loadTags(),
              builder: (context, snap) {
                if (!snap.hasData) {
                  // tags skeleton (small pills)
                  return SizedBox(
                    height: 56,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (c, i) => SkeletonBox(
                        width: 90,
                        height: 36,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemCount: 4,
                    ),
                  );
                }
                final tags = snap.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 8,
                    children: tags
                        .map(
                          (t) => CategoryUtils.buildTag(
                            (t.icon as dynamic) as String,
                            (t.label as dynamic) as String,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: FutureBuilder<List<Bannercard>>(
              future: LocalData.loadBanners(),
              builder: (context, snap) {
                if (!snap.hasData) {
                  // banner skeleton
                  return SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemBuilder: (_, __) => SkeletonBox(
                        width: 370,
                        height: 146,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemCount: 3,
                    ),
                  );
                }
                final banners = snap.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: banners
                        .map(
                          (b) => Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: CategoryUtils.buildBanner(
                              b.imagePath,
                              b.mainLabel,
                              b.subLabel,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Gần Bạn Nhất',
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/flat_icons/right_arrow.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                FutureBuilder<List<BrandItem>>(
                  future: LocalData.loadBrands(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      // brands skeleton
                      return SizedBox(
                        height: 260,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemBuilder: (_, __) => Column(
                            children: [
                              SkeletonBox(
                                width: 180,
                                height: 180,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              const SizedBox(height: 8),
                              SkeletonBox(
                                width: 140,
                                height: 14,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              const SizedBox(height: 6),
                              SkeletonBox(
                                width: 80,
                                height: 12,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 12),
                          itemCount: 4,
                        ),
                      );
                    }
                    final brands = snap.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 15,
                        children: brands
                            .map(
                              (b) => CategoryUtils.buildBrandCard(
                                (b.image as dynamic) as String,
                                (b.name as dynamic) as String,
                                (b.rating as dynamic) as double,
                                (b.deliveryType as dynamic) as int,
                                (b.distance as dynamic) as double,
                                (b.minOrder as dynamic) as int,
                                (b.tag as dynamic) as String,
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

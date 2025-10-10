import 'package:flutter/material.dart';
import 'package:food_delivery/ultis/category_ulti.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/hot-deal.png',
                          'Khuyến Mãi',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/cart.png',
                          'Tiện Lợi',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/grocery.png',
                          'Thực Phẩm',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/pick_up.png',
                          'Tại Quầy',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/medicine_1.png',
                          'Nhà Thuốc',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/pho.png',
                          'Phở',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/banh_mi.png',
                          'Bánh Mì',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/fast_food.png',
                          'Ăn Nhanh',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/com_tam.png',
                          'Cơm Tấm',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/goi_cuon.png',
                          'Gỏi Cuốn',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/vietnam.png',
                          'Đồ Việt',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/thai.png',
                          'Đồ Thái',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/korean.png',
                          'Đồ Hàn',
                        ),
                        CategoryUtils.buildCategoryItem(
                          'assets/icons/japan.png',
                          'Đồ Nhật',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 3,
                  children: [
                    CategoryUtils.buildTag(
                      'assets/flat_icons/discount.png',
                      'Khuyến mãi',
                    ),
                    const SizedBox(width: 8),
                    CategoryUtils.buildTag(
                      'assets/flat_icons/location.png',
                      'Gần Bạn',
                    ),
                    const SizedBox(width: 8),
                    CategoryUtils.buildTag(
                      'assets/flat_icons/star.png',
                      'Đánh Giá Cao',
                    ),
                    const SizedBox(width: 8),
                    CategoryUtils.buildTag(
                      'assets/flat_icons/new.png',
                      'Quán Mới',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 15,
                  children: [
                    CategoryUtils.buildBanner(
                      'assets/images/banner1.png',
                      'Giảm 40% cho đơn đầu tiên',
                      'Miễn phí giao hàng cho đơn từ 200.000đ Mã: NEW40',
                    ),
                    CategoryUtils.buildBanner(
                      'assets/images/banner2.png',
                      'Giảm 30% cho mọi đơn!',
                      'Áp dụng 10h–14h, đơn từ 100.000đ Mã: LUNCH30',
                    ),
                    CategoryUtils.buildBanner(
                      'assets/images/banner3.png',
                      'Giảm thêm 10% khi đặt từ 3 món trở lên',
                      'Áp dụng tại các cửa hàng tham gia Mã: MULTI10',
                    ),
                  ],
                ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 15,
                      children: [
                        CategoryUtils.buildBrandCard(
                          'assets/images/brand1.jpg',
                          'Starbucks',
                          4.7,
                          1,
                          0.3,
                          10,
                          'Mua 1 tặng 1',
                        ),
                        CategoryUtils.buildBrandCard(
                          'assets/images/brand2.jpg',
                          'Jolibee',
                          4.8,
                          2,
                          1.4,
                          25,
                          'Giảm 50%',
                        ),
                        CategoryUtils.buildBrandCard(
                          'assets/images/brand3.jpg',
                          'Texas Chicken',
                          4.3,
                          2,
                          1.3,
                          15,
                          'FreeShip',
                        ),
                        CategoryUtils.buildBrandCard(
                          'assets/images/brand4.jpg',
                          'Bánh Mì Bà Hoa',
                          4.9,
                          3,
                          2.3,
                          10,
                          'Giảm 20%',
                        ),
                        CategoryUtils.buildBrandCard(
                          'assets/images/brand5.jpg',
                          'Pizza Hut',
                          4.7,
                          2,
                          0.6,
                          9,
                          'Mua 1 tặng 1',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:food_delivery/pages/subPages/home_page.dart';
import 'package:food_delivery/ultis/category_ulti.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    HomeBody(),
    Center(child: Text('Nhận Đơn')),
    Center(child: Text('Tìm Kiếm')),
    Center(child: Text('Tài Khoản')),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavigation(),
    );
  }

  BottomNavigationBar bottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.redAccent,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Trang Chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_walk_outlined),
          activeIcon: Icon(Icons.directions_walk),
          label: 'Nhận Đơn',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: 'Tìm Kiếm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Tài Khoản',
        ),
      ],
    );
  }

  Widget buildBanners() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 12),
        child: FutureBuilder<List<dynamic>>(
          future: rootBundle
              .loadString('assets/data/banner.json')
              .then((s) => json.decode(s) as List<dynamic>),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (_, __) => SizedBox(width: 370, height: 146),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: 3,
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox.shrink();
            }

            final items = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: items.map((raw) {
                  final map = raw as Map<String, dynamic>;
                  final imagePath = map['imagePath'] as String? ?? '';
                  final mainLabel = map['mainLabel'] as String? ?? '';
                  final subLabel = map['subLabel'] as String? ?? '';
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CategoryUtils.buildBanner(
                      imagePath,
                      mainLabel,
                      subLabel,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

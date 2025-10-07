import 'package:flutter/material.dart';
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
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(
                  width: 155,
                  child: Text(
                    "120 Yên Lãng, Hà Nội",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                    style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black),
                Spacer(),
                Icon(Icons.notifications_none, color: Colors.black),
                SizedBox(width: 16),
                Icon(Icons.shopping_cart_outlined, color: Colors.black),
              ],
            ),
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
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
                  child: Icon(Icons.map, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

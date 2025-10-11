import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryUtils {
  CategoryUtils._();

  static Widget buildBrandCard(
    String imagePath,
    String brandName,
    double rating,
    int ratingCount,
    double distance,
    int time,
    String tag,
  ) {
    return SizedBox(
      width: 180,
      height: 300,
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        brandName,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border, size: 18),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Color.fromRGBO(34, 35, 46, 1),
                      ),
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('- (${ratingCount}k+)', maxLines: 1),
                  ],
                ),
                Row(
                  children: [
                    Text('${distance}km'),
                    SizedBox(width: 8),
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Color.fromRGBO(
                        34,
                        35,
                        46,
                        1,
                      ).withValues(alpha: 0.6),
                    ),
                    Text('$time phút'),
                  ],
                ),
                SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      tag,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildBanner(
    String imagePath,
    String mainLabel,
    String subLabel,
  ) {
    return Container(
      width: 370,
      height: 146,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent.shade100.withValues(alpha: 0.3),
      ),

      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 200,
              height: 146,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainLabel,
                    style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),

                  Text(
                    subLabel,
                    style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Text(
                      'Tìm Hiểu Thêm',
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 146,
            height: 146,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildTag(String iconPath, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 2),
        ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 17, height: 17, fit: BoxFit.contain),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              color: Color.fromRGBO(34, 35, 46, 1),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildCategoryItem(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                iconPath,
                width: 45,
                height: 45,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: Text(
                label,
                style: GoogleFonts.nunitoSans(
                  color: Color.fromRGBO(34, 35, 46, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

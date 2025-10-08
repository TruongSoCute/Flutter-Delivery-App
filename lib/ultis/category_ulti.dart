import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryUtils {
  CategoryUtils._();

  static Widget buildTag(String iconPath, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
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
                color: Colors.grey.shade200,
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

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(isDarkMode ? Colors.white : Colors.black).make(),
        "Trending Products".text.xl2.color(isDarkMode ? Colors.white : Colors.black).make(),
      ],
    );
  }
}

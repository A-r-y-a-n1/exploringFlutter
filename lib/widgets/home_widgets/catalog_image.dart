import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: 150,
      height: 150,
    )
        .box
        .rounded
        .p1
        .color(context.canvasColor)
        .make()
        .p12()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 60)
        .hPCT(context: context, heightPCT: context.isMobile ? 20 : 30);
  }
}

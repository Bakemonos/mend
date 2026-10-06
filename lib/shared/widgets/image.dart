import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String assetPath;
  final double? imageSize;
  final BoxFit fit;

  const MyImage({
    super.key,
    required this.assetPath,
    this.imageSize,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: imageSize,
      height: imageSize,
      fit: fit,
    );
  }
}
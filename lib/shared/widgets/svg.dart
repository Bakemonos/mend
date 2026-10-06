import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvg extends StatelessWidget {
  final double? iconSize;
  final String assetPath;
  final Color? color;
  final BoxFit? fit;

  const MySvg({
    super.key,
    required this.assetPath,
    this.iconSize,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: iconSize,
      height: iconSize,
      fit: fit ?? BoxFit.contain,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

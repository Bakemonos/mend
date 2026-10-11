import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvg extends StatelessWidget {
  const MySvg({
    super.key,
    required this.assetPath,
    this.color,
    this.size,
  });

  final String assetPath;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final c = color ?? iconTheme.color;
    final s = size ?? iconTheme.size ?? 24;

    return SvgPicture.asset(
      assetPath,
      width: s,
      height: s,
      colorFilter: c == null ? null : ColorFilter.mode(c, BlendMode.srcIn),
    );
  }
}
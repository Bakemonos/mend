// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mend/core/constants/sizes.dart';

// class MyText extends StatelessWidget {
//   final String text;
//   final double? size;
//   final FontWeight? weight;
//   final Color? color;
//   final TextAlign textAlign;
//   final double? lineHeight;
//   final bool isUnderline;
//   final Color? underlineColor;
//   final TextOverflow? textOverflow;
//   final double? letterSpacing;

//   const MyText({
//     super.key,
//     required this.text,
//     this.size,
//     this.color,
//     this.weight = FontWeight.w500,
//     this.textAlign = TextAlign.start,
//     this.lineHeight = 1.3,
//     this.isUnderline = false,
//     this.underlineColor,
//     this.textOverflow,
//     this.letterSpacing,
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Text(
//       text,
//       textAlign: textAlign,
//       style: TextStyle(
//         fontSize: size?? AppSize.fontMedium.sp,
//         fontWeight: weight,
//         color: color?? Theme.of(context).colorScheme.onPrimary,
//         height: lineHeight,
//         decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
//         decorationColor: underlineColor ?? color,
//         overflow: textOverflow,
//         letterSpacing: letterSpacing,
//       )
//     );
//   }
// }

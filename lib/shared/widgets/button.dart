import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mend/core/constants/enum.dart';
import 'package:mend/core/constants/sizes.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key, 
    required this.text,
    required this.onPressed,
    this.buttonType = ButtonType.elevated,
  });

  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: AppSize.buttonHeight.h,
      child: switch (buttonType) {
        ButtonType.outlined => OutlinedButton(
          onPressed: onPressed, 
          child: Text(text)
        ),
        _ => ElevatedButton(
          onPressed: onPressed, 
          child: Text(text)
        )
      }
    );
  }
}

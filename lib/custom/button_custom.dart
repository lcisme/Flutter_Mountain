import 'package:flutter/material.dart';
import '../core/constant/dimension_constant.dart';
import '../widgets/app_text.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({super.key,
    this.text,
    this.width=60,
    this.height = 60,
    this.colorText = Colors.black,
    this.backgroundColor = Colors.blue,
    this.isIcon = false,
    this.icon,
    this.borderColor = Colors.transparent
  });
  double width;
  double height;
  String? text;
  Color colorText;
  Color backgroundColor;
  bool? isIcon;
  Icon? icon;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kMediumPadding/2),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0
        )
      ),
      child: Center(
        child: (isIcon== true) ? icon : AppText(text: text!, color: colorText,),
      )
    );
  }
}

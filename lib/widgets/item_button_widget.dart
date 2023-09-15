
import 'package:flutter/material.dart';
import 'package:tripsmountain/core/constant/dimension_constant.dart';

import '../core/constant/color_palette.dart';
import '../core/extention/text_style_ext.dart';

class ItemButtonWidget extends StatelessWidget{
  const ItemButtonWidget({Key? key, required this.data, this.onTap, this.color, this.width}) : super(key: key);
  final String data;
  final Function()? onTap;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kItemPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
            ? TextStyles.defaultStyle.whiteTextColor.bold
            : TextStyles.defaultStyle.bold.copyWith(
            color: ColorPalette.primaryColor,
          ),
        ),
      ),
    );
  }

}
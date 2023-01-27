import 'package:countrylist/resources/color_manager.dart';
import 'package:countrylist/resources/font_manager.dart';
import 'package:countrylist/resources/style_manager.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final bool isValue;

  const TextWidget({
    Key? key,
    required this.text,
    required this.isValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: isValue ? TextAlign.right : TextAlign.left,
        style: isValue
            ? getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSizes.s13)
            : getLightStyle(
                color: ColorManager.textColor, fontSize: FontSizes.s13),
      );
}

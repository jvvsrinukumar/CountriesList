

// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:countrylist/resources/color_manager.dart';
import 'package:countrylist/resources/font_manager.dart';
import 'package:countrylist/resources/style_manager.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String text;
   TextInputType keyboardType;
   String hintText = "";
   Icon? prefixIcon;
   Icon? suffixIcon;
  final ValueChanged<String> onChanged;

  TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.text,
    required this.keyboardType,
    required this.hintText,
     this.prefixIcon,
    required this.onChanged,
    this.suffixIcon,

  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  String hint = "";
  @override
  void initState() {
    super.initState();
    
   // print(widget.text);
    controller = TextEditingController(text: widget.text);
    hint = widget.hintText;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            keyboardType: widget.keyboardType,
            obscureText: false,
            
            style: getSemiBoldStyle(
                fontSize: FontSizes.s14, color: ColorManager.textColor),
            decoration:  InputDecoration(
               prefixIcon: widget.prefixIcon,
               suffixIcon: widget.suffixIcon,
                hintText: hint,
              //fillColor: Colors.red,
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: FontSizes.s14,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.regular),
              //hintStyle: getSemiBoldStyle(fontSize:FontSize.s20,color: ColorManager.primary),
            ),
            onChanged: (val) {
              widget.onChanged(val);
            },
          ),
        ],
      );
}
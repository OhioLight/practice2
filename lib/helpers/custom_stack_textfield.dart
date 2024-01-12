import 'package:flutter/material.dart';

class CustomStackTextField extends StatelessWidget {
  const CustomStackTextField({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.onTap,
    this.suffixIcon,
    this.onChange,
    this.fontSize = 16,
    this.autoFocus,
    required this.backgroundColor,
    this.labelText = '',
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.black,
    this.borderRadius = 0,
    this.hintTextColor = Colors.grey,
    this.positionFromLeft = 40,
    this.hintFontSize = 8,
    this.positionFromTop = -12,
    this.borderBreak = 8,
    this.enabledWidth = 1,
    this.focusedWidth = 2,
    this.hintFontFamily,
    this.hintFontStyle,
    this.hintFontWeight,
    this.labelColor = Colors.black,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
  });
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final double? fontSize;
  final bool? autoFocus;
  // backgroundColor must be set to your backgroundColor to break the border
  final Color backgroundColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final double borderRadius;
  final Color hintTextColor;
  final double positionFromLeft;
  final double hintFontSize;
  // must be -double in case -10 when u change the fontsize of the label u must change the value between 0 and -100
  final double positionFromTop;
  final double borderBreak;
  final double enabledWidth;
  final double focusedWidth;
  final String? hintFontFamily;
  final FontStyle? hintFontStyle;
  final FontWeight? hintFontWeight;
  final Color labelColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          onTap: onTap,
          controller: controller,
          readOnly: readOnly ?? false,
          textAlign: textAlign ?? TextAlign.center,
          keyboardType: readOnly == null ? keyboardType : null,
          onChanged: onChange,
          style: TextStyle(fontSize: fontSize),
          autofocus: autoFocus ?? false,
          decoration: InputDecoration(
            isDense: true,
            prefixText: prefixText,
            suffix: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: hintFontFamily,
              fontSize: hintFontSize,
              color: hintTextColor,
              fontWeight: hintFontWeight,
              fontStyle: hintFontStyle,
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 50,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 50,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
          ),
        ),
        Positioned(
          left: positionFromLeft,
          top: positionFromTop,
          child: Container(
            decoration: BoxDecoration(color: backgroundColor),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: borderBreak),
              child: Text(
                labelText,
                style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight,
                    fontStyle: fontStyle,
                    color: labelColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

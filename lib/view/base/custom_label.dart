import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLabel extends StatelessWidget {
  final String? title;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double fontSize;
  final double height;
  final int? maxLines;
  final bool? isUnderLine;

  const CustomLabel({
    Key? key,
    required this.title,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.maxLines,
    this.height = 1.2,
    this.textAlign = TextAlign.left,
    this.isUnderLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title == null) return Container();
    return Text(
      title!,
      style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          decoration:
              isUnderLine! ? TextDecoration.underline : TextDecoration.none),
      textScaleFactor: Get.context!.textScaleFactor,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

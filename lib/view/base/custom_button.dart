import 'package:flutter/material.dart';
import 'package:getx_localization/util/dimensions.dart';
import 'package:getx_localization/util/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback buttonAction;
  final String buttonText;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;

  const CustomButton(
      {Key? key,
      required this.buttonAction,
      required this.buttonText,
      this.transparent = false,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.radius = 5,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      minimumSize: Size(width ?? Dimensions.WEB_MAX_WIDTH, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
    );

    return Center(
      child: SizedBox(
        width: width ?? Dimensions.WEB_MAX_WIDTH,
        child: Padding(
          padding: margin ?? const EdgeInsets.all(0),
          child: TextButton(
            onPressed: buttonAction,
            style: _flatButtonStyle,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: robotoBold.copyWith(
                  color: transparent!
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).cardColor,
                  fontSize: fontSize ?? Dimensions.fontSizeLarge,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

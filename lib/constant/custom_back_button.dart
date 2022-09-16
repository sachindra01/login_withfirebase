import 'package:flutter/material.dart';
import 'package:login_page/constant/style.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.buttonColor,
    this.buttonIconColor,
    this.height,
    this.width,
    this.icon,
    required this.onTap,
  }) : super(key: key);
  final Color? buttonColor;
  final Color? buttonIconColor;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            height:height?? 42,
            width: width??60,
            decoration: BoxDecoration(
              color: buttonColor ??greyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffC5C5C5)
              )
              
            ),
            child:icon?? const Icon(
              Icons.chevron_left,
              color: Color(0xffFBFBFB),
              size: 33,
            ),
          ),
        ),
      ),
    );
  }
}

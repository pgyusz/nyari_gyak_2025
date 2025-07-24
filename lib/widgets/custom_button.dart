import 'package:flutter/material.dart';
import 'package:nyari_gyak_2025/res/colours.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.width,
    this.height,
    required this.onTap,
  });
  final Widget child;
  final double? width;
  final double? height;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colours.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: child),
      ),
    );
  }
}

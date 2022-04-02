import 'package:clepy_ui/components/clepy_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final double height;
  final List<Color>? backGroundColors;
  final Color? labelColor;

  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.height = 50,
    this.backGroundColors,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: backGroundColors ??
                [
                  ClepyColors.brandPrimary,
                  ClepyColors.brandLight,
                ],
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: labelColor ?? ClepyColors.ice,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

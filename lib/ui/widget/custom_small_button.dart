import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

enum ButtonType { primary, secondary, tertiary }

class CustomSmallButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function() onTap;
  const CustomSmallButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: buttonType == ButtonType.primary ? primaryColor : Colors.white,
        child: InkWell(
          splashColor:
              buttonType == ButtonType.primary ? secondaryColor : primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: buttonType == ButtonType.primary
                    ? secondaryColor
                    : primaryColor,
                textStyle: Theme.of(context).textTheme.titleMedium,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

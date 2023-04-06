import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

enum ButtonType { cancel, report }

class CustomSmallButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function() onTap;
  const CustomSmallButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonType = ButtonType.report,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: buttonType == ButtonType.report ? primaryColor : Colors.white,
      child: InkWell(
        splashColor:
            buttonType == ButtonType.report ? secondaryColor : primaryColor,
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: buttonType == ButtonType.report
                  ? secondaryColor
                  : primaryColor,
              textStyle: Theme.of(context).textTheme.titleMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

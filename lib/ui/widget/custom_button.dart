import 'package:donatoo/ui/widget/custom_small_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final ButtonType buttonType;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: buttonType == ButtonType.primary ? primaryColor : secondaryColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor:
              buttonType == ButtonType.primary ? secondaryColor : primaryColor,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleLarge,
                fontWeight: FontWeight.bold,
                color: buttonType == ButtonType.primary
                    ? secondaryColor
                    : primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

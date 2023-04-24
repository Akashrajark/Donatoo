import 'package:donatoo/ui/widget/custom_small_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final ButtonType buttonType;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonType = ButtonType.primary,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: buttonType == ButtonType.primary
            ? primaryColor
            : buttonType == ButtonType.secondary
                ? secondaryColor
                : primaryColor.withOpacity(
                    0.2,
                  ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor:
              buttonType == ButtonType.primary ? secondaryColor : primaryColor,
          onTap: onTap,
          child: isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(14.5),
                    child: CupertinoActivityIndicator(
                      color: Colors.grey,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.titleMedium,
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

import 'package:flutter/material.dart';

import '../../values/colors.dart';

enum ButtonType { primary, secondary }

class CustomActionButton extends StatelessWidget {
  final ButtonType buttonType;
  final IconData iconData;
  final String label;
  final Color color;
  final Function() onPressed;
  final bool isLoading;
  const CustomActionButton({
    super.key,
    required this.iconData,
    this.color = primaryColor,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.buttonType = ButtonType.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonType == ButtonType.primary
          ? primaryColor
          : color.withOpacity(.1),
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: onPressed,
        hoverColor: buttonType == ButtonType.primary
            ? secondaryColor.withOpacity(.15)
            : color.withOpacity(.15),
        focusColor: buttonType == ButtonType.primary
            ? secondaryColor.withOpacity(.15)
            : color.withOpacity(.15),
        highlightColor: buttonType == ButtonType.primary
            ? secondaryColor.withOpacity(.1)
            : color.withOpacity(.15),
        splashColor: buttonType == ButtonType.primary
            ? secondaryColor.withOpacity(.15)
            : color.withOpacity(.2),
        borderRadius: BorderRadius.circular(2),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: isLoading
              ? SizedBox(
                  width: 50,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(30), //TODO:BORDER RADIUS
                    child: LinearProgressIndicator(
                      color: buttonType == ButtonType.primary
                          ? primaryColor
                          : color,
                      backgroundColor: buttonType == ButtonType.primary
                          ? secondaryColor
                          : color.withOpacity(.2),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: buttonType == ButtonType.primary
                                ? secondaryColor
                                : color,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 2.5),
                    Icon(
                      iconData,
                      color: buttonType == ButtonType.primary
                          ? secondaryColor
                          : color,
                      size: 18,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

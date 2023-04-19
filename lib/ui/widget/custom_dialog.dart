import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';
import 'custom_small_button.dart';

class CustomDialog extends StatelessWidget {
  final String label;
  const CustomDialog({
    super.key,
    this.label = 'Report',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: SizedBox(
        height: 200,
        child: Material(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.roboto(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Details",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(borderRadius),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSmallButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      text: "Cancel",
                      buttonType: ButtonType.secondary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomSmallButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      text: label,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

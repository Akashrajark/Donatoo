import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_label.dart';
import '../widget/custom_small_button.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: Colors.black.withOpacity(.20),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 200,
                          child: Material(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Report",
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black26,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomSmallButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        text: "Cancel",
                                        buttonType: ButtonType.secondary,
                                      ),
                                      CustomSmallButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        text: "Report",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text(
                      "Report",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Emergency.jpg",
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "akjsgfasgfdjhalsfh ajsfgajhsbfv  jf hasfvajhsfv",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Created by",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "The Arcane",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "dggfjgsdjf sjdfjksb sdiuhfsd jsdhfkjdb ashduaisudhiashdiahsidhiashdh asidh",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black45,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Las Vegas , NV",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const LinearProgressIndicator(
                  value: .5,
                  backgroundColor: Colors.black12,
                  color: Colors.lightGreen,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Expanded(
                      flex: 4,
                      child: CustomLabel(
                        titleText: "US\$ 8,200",
                        descriptionText: "pledged of US\$ 200000",
                        color: Colors.lightGreen,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: CustomLabel(
                          titleText: "24",
                          descriptionText: "donaters",
                        )),
                    Expanded(
                      flex: 2,
                      child: CustomLabel(
                        titleText: "11",
                        descriptionText: "hours to go",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(text: "Donate", onTap: () {}),
      ),
    );
  }
}

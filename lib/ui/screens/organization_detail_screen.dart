import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_label.dart';
import '../widget/custom_dialog.dart';

class OrganizationDetails extends StatelessWidget {
  const OrganizationDetails({super.key});

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
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CustomDialog(),
              );
            },
            icon: const Icon(Icons.report),
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
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Category",
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
                      child: CustomLabel(
                        titleText: "24",
                        descriptionText: "donaters",
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
        child: CustomButton(
          text: "Donate",
          onTap: () {},
        ),
      ),
    );
  }
}

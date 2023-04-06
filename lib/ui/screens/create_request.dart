import 'package:donatoo/ui/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';
import '../widget/custom_button.dart';

class CreateRequest extends StatelessWidget {
  const CreateRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
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
            color: primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Material(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add image",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: primaryColor,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Patient Details",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Address line",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Place",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "District",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pincode",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "State",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "User Details",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Address line",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Place",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "District",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pincode",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "State",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hospital Details",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Case Name (Title)",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Hospital Name",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "DueDate",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Amount",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Gpay",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Bank Account",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "About Case",
                      hintStyle: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          text: "Create Request",
          onTap: () {},
        ),
      ),
    );
  }
}

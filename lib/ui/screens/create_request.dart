import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/validaters.dart';
import '../../values/colors.dart';
import '../widget/custom_button.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({super.key});

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  TextEditingController patientFullNameController = TextEditingController();
  TextEditingController patientAddressLineController = TextEditingController();
  TextEditingController patientPlaceController = TextEditingController();
  TextEditingController patientDistrictController = TextEditingController();
  TextEditingController patientPincodeController = TextEditingController();
  TextEditingController patientStateController = TextEditingController();
  TextEditingController patientContactController = TextEditingController();
  TextEditingController userFullNameController = TextEditingController();
  TextEditingController userAddressLineController = TextEditingController();
  TextEditingController userPlaceController = TextEditingController();
  TextEditingController userDistrictController = TextEditingController();
  TextEditingController userPincodeController = TextEditingController();
  TextEditingController userStateController = TextEditingController();
  TextEditingController caseNameController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController gpayController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController aboutCaseController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
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
                    TextFormField(
                      controller: patientFullNameController,
                      validator: fullName,
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
                    TextFormField(
                      controller: patientContactController,
                      validator: fullName,
                      decoration: InputDecoration(
                        hintText: "Contact Number",
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
                    TextFormField(
                      controller: patientAddressLineController,
                      validator: addressLine,
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
                    TextFormField(
                      controller: patientPlaceController,
                      validator: place,
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
                    TextFormField(
                      controller: patientDistrictController,
                      validator: district,
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
                    TextFormField(
                      controller: patientPincodeController,
                      validator: pincode,
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
                    TextFormField(
                      controller: patientStateController,
                      validator: state,
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
                    TextFormField(
                      controller: userFullNameController,
                      validator: fullName,
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
                    TextFormField(
                      controller: userAddressLineController,
                      validator: addressLine,
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
                    TextFormField(
                      controller: userPlaceController,
                      validator: place,
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
                    TextFormField(
                      controller: userDistrictController,
                      validator: district,
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
                    TextFormField(
                      controller: userPincodeController,
                      validator: pincode,
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
                    TextFormField(
                      controller: userStateController,
                      validator: state,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter case name';
                        }
                        final nameExp = RegExp(r'^[A-Za-z ]+$');
                        if (!nameExp.hasMatch(value)) {
                          return 'Please enter a valid case name';
                        }
                      },
                      controller: caseNameController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter hospital name';
                        }
                        final nameExp = RegExp(r'^[A-Za-z ]+$');
                        if (!nameExp.hasMatch(value)) {
                          return 'Please enter a valid hospital name';
                        }
                      },
                      controller: hospitalNameController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter date';
                        }
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid date';
                        }
                      },
                      controller: dueDateController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter bank account';
                        }
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid  bank account';
                        }
                      },
                      controller: amountController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter gpay ';
                        }
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid gpay';
                        }
                      },
                      controller: gpayController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter bank account';
                        }
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid  bank account';
                        }
                      },
                      controller: bankAccountController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter about case';
                        }
                        final nameExp = RegExp(r'^[A-Za-z ]+$');
                        if (!nameExp.hasMatch(value)) {
                          return 'Please enter a valid case';
                        }
                      },
                      controller: aboutCaseController,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          text: "Create Request",
          onTap: () {
            if (formKey.currentState!.validate()) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}

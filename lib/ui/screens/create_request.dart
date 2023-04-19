import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../util/validaters.dart';
import '../../values/colors.dart';
import '../widget/custom_button.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({super.key});

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _duedateController = TextEditingController();
  final TextEditingController _amountRequiredController =
      TextEditingController();
  final TextEditingController _amountCollectedController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientPhoneController = TextEditingController();
  final TextEditingController _patientAddressLineController =
      TextEditingController();
  final TextEditingController _patientPlaceController = TextEditingController();
  final TextEditingController _patientDistrictController =
      TextEditingController();
  final TextEditingController _patientStateController = TextEditingController();
  final TextEditingController _patientPincodeController =
      TextEditingController();
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _hospitalPhoneController =
      TextEditingController();
  final TextEditingController _hospitalAddressLineController =
      TextEditingController();
  final TextEditingController _hospitalPlaceController =
      TextEditingController();
  final TextEditingController _hospitalDistrictController =
      TextEditingController();
  final TextEditingController _hospitalStateController =
      TextEditingController();
  final TextEditingController _hospitalPincodeController =
      TextEditingController();
  final TextEditingController _bankAccountHolderController =
      TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
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
                    //TODO:image picker
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Base Details",
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
                      height: 5,
                    ),
                    Text(
                      " Enter the details about this campaign",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _titleController,
                      validator: titleValidator,
                      decoration: const InputDecoration(
                        hintText: "Title",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: _duedateController,
                      decoration: const InputDecoration(
                        hintText: 'Duedate',
                      ),
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015),
                          lastDate: DateTime(2025),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            _duedateController.text =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _amountRequiredController,
                      validator: amount,
                      decoration: const InputDecoration(
                        hintText: "Amount Required",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _amountCollectedController,
                      validator: amount,
                      decoration: const InputDecoration(
                        hintText: "Amount Collected",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      validator: description,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: "Description",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      height: 5,
                    ),
                    Text(
                      " Enter the details about the patient",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientNameController,
                      validator: fullName,
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientPhoneController,
                      validator: phoneNumber,
                      decoration: const InputDecoration(
                        hintText: "Contact Number",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientAddressLineController,
                      validator: addressLine,
                      decoration: const InputDecoration(
                        hintText: "Address line",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientPlaceController,
                      validator: place,
                      decoration: const InputDecoration(
                        hintText: "Place",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientDistrictController,
                      validator: district,
                      decoration: const InputDecoration(
                        hintText: "District",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientStateController,
                      validator: state,
                      decoration: const InputDecoration(
                        hintText: "State",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _patientPincodeController,
                      validator: pincode,
                      decoration: const InputDecoration(
                        hintText: "Pincode",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
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
                      height: 5,
                    ),
                    Text(
                      " Enter hospital details where the patient is admitted",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalNameController,
                      validator: fullName,
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalPhoneController,
                      validator: phoneNumber,
                      decoration: const InputDecoration(
                        hintText: "Contact Number",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalAddressLineController,
                      validator: addressLine,
                      decoration: const InputDecoration(
                        hintText: "Address line",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalPlaceController,
                      validator: place,
                      decoration: const InputDecoration(
                        hintText: "Place",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalDistrictController,
                      validator: district,
                      decoration: const InputDecoration(
                        hintText: "District",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalStateController,
                      validator: state,
                      decoration: const InputDecoration(
                        hintText: "State",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospitalPincodeController,
                      validator: pincode,
                      decoration: const InputDecoration(
                        hintText: "Pincode",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bank Details",
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
                      height: 5,
                    ),
                    Text(
                      " Enter bank details of the authorised person",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _bankAccountHolderController,
                      validator: accountHolder,
                      decoration: const InputDecoration(
                        hintText: "Bank Account Holder",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _bankAccountNumberController,
                      validator: accountNumber,
                      decoration: const InputDecoration(
                        hintText: "Bank Account Number",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _branchNameController,
                      validator: branchName,
                      decoration: const InputDecoration(
                        hintText: "Branch Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _ifscCodeController,
                      validator: ifscCode,
                      decoration: const InputDecoration(
                        hintText: "IFSC Code",
                      ),
                    ),
                    //TODO:add proof option
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 1,
            ),
            Padding(
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
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/screens/homescreen.dart';
import 'package:donatoo/ui/screens/request_page.dart';
import 'package:donatoo/util/custom_file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../util/validaters.dart';
import '../../values/colors.dart';
import '../widget/custom_button.dart';

class CreateRequest extends StatefulWidget {
  final ManageRequestBloc manageRequestBloc;
  final Map<String, dynamic>? details;
  const CreateRequest(
      {super.key, required this.manageRequestBloc, this.details});

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

  PlatformFile? file;
  DateTime? selectedDateTime;

  @override
  void initState() {
    if (widget.details != null) {
      selectedDateTime = DateTime.parse(widget.details!['duedate']);
      _titleController.text = widget.details!['title'];
      _duedateController.text = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(widget.details!['duedate']));
      _amountRequiredController.text =
          widget.details!['amount_required'].toString();
      _amountCollectedController.text =
          widget.details!['amount_collected'].toString();
      _descriptionController.text = widget.details!['description'];
      _bankAccountNumberController.text = widget.details!['bank_account_no'];
      _ifscCodeController.text = widget.details!['ifsc_code'];
      _bankAccountHolderController.text = widget.details!['account_holder'];
      _patientNameController.text = widget.details!['patient_name'];
      _patientPlaceController.text = widget.details!['patient_place'];
      _patientDistrictController.text = widget.details!['patient_district'];
      _patientAddressLineController.text =
          widget.details!['patient_address_line'];
      _patientStateController.text = widget.details!['patient_state'];
      _patientPincodeController.text = widget.details!['patient_pincode'];
      _hospitalNameController.text = widget.details!['hospital_name'];
      _hospitalAddressLineController.text =
          widget.details!['hospital_address_line'];
      _hospitalPlaceController.text = widget.details!['hospital_place'];
      _hospitalDistrictController.text = widget.details!['hospital_district'];
      _hospitalStateController.text = widget.details!['hospital_state'];
      _hospitalPincodeController.text = widget.details!['hospital_pincode'];
      _patientPhoneController.text = widget.details!['patient_phone'];
      _hospitalPhoneController.text = widget.details!['hospital_phone'] ?? '';
      _branchNameController.text = widget.details!['branch_name'] ?? '';
    }
    super.initState();
  }

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
                child: InkWell(
                  onTap: () async {
                    PlatformFile? selectedFile = await pickFile();
                    if (selectedFile != null) {
                      file = selectedFile;
                      setState(() {});
                    }
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: file != null
                        ? Image.file(File(file!.path!))
                        : widget.details != null
                            ? Image.network(widget.details!['image'])
                            : Text(
                                "Add image",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: primaryColor,
                                    ),
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
                            selectedDateTime = selectedDate;
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
                    // //TODO:add proof option
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
                text: widget.details != null
                    ? 'Update Request'
                    : "Create Request",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (widget.details != null) {
                      widget.manageRequestBloc.add(
                        EditRequestEvent(
                          title: _titleController.text.trim(),
                          description: _descriptionController.text.trim(),
                          amountRequired:
                              int.parse(_amountRequiredController.text.trim()),
                          amountCollected:
                              int.parse(_amountCollectedController.text.trim()),
                          duedate: selectedDateTime!,
                          image: file,
                          accountHolder:
                              _bankAccountHolderController.text.trim(),
                          bankAcNumber:
                              _bankAccountNumberController.text.trim(),
                          hospitalAddressLine:
                              _hospitalAddressLineController.text.trim(),
                          hospitalDistrict:
                              _hospitalDistrictController.text.trim(),
                          hospitalName: _hospitalNameController.text.trim(),
                          hospitalPinCode:
                              _hospitalPincodeController.text.trim(),
                          hospitalPlace: _hospitalPlaceController.text.trim(),
                          hospitalState: _hospitalStateController.text.trim(),
                          ifscCode: _ifscCodeController.text.trim(),
                          patientAddressLine:
                              _patientAddressLineController.text.trim(),
                          patientDistrict:
                              _patientDistrictController.text.trim(),
                          patientName: _patientNameController.text.trim(),
                          patientPhone:
                              int.parse(_patientPhoneController.text.trim()),
                          patientPinCode: _patientPincodeController.text.trim(),
                          patientPlace: _patientPlaceController.text.trim(),
                          patientState: _patientStateController.text.trim(),
                          branchName: _branchNameController.text.trim(),
                          hospitalPhone: _hospitalPhoneController.text.trim(),
                          requestId: widget.details!['id'],
                        ),
                      );

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen(
                                    currentIndex: 2,
                                  )),
                          (route) => true);
                    } else {
                      widget.manageRequestBloc.add(
                        AddRequestEvent(
                          title: _titleController.text.trim(),
                          description: _descriptionController.text.trim(),
                          amountRequired:
                              int.parse(_amountRequiredController.text.trim()),
                          amountCollected:
                              int.parse(_amountCollectedController.text.trim()),
                          duedate: selectedDateTime!,
                          image: file!,
                          accountHolder:
                              _bankAccountHolderController.text.trim(),
                          bankAcNumber:
                              _bankAccountNumberController.text.trim(),
                          hospitalAddressLine:
                              _hospitalAddressLineController.text.trim(),
                          hospitalDistrict:
                              _hospitalDistrictController.text.trim(),
                          hospitalName: _hospitalNameController.text.trim(),
                          hospitalPinCode:
                              _hospitalPincodeController.text.trim(),
                          hospitalPlace: _hospitalPlaceController.text.trim(),
                          hospitalState: _hospitalStateController.text.trim(),
                          ifscCode: _ifscCodeController.text.trim(),
                          patientAddressLine:
                              _patientAddressLineController.text.trim(),
                          patientDistrict:
                              _patientDistrictController.text.trim(),
                          patientName: _patientNameController.text.trim(),
                          patientPhone:
                              int.parse(_patientPhoneController.text.trim()),
                          patientPinCode: _patientPincodeController.text.trim(),
                          patientPlace: _patientPlaceController.text.trim(),
                          patientState: _patientStateController.text.trim(),
                          branchName: _branchNameController.text.trim(),
                          hospitalPhone: _hospitalPhoneController.text.trim(),
                        ),
                      );

                      Navigator.pop(context);
                    }
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

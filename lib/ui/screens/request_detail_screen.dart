import 'dart:ui';

import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/screens/create_request.dart';
import 'package:donatoo/ui/widget/custom_action_button.dart';
import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widget/custom_label.dart';
import '../widget/custom_dialog.dart';

class RequestDetails extends StatelessWidget {
  final Map<String, dynamic> details;
  final ManageRequestBloc manageRequestBloc;
  const RequestDetails(
      {super.key, required this.details, required this.manageRequestBloc});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              details['image'],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details['title'],
                    textAlign: TextAlign.start,
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
                  //TODO:: for emergency details screen

                  // Text(
                  //   "Created by",
                  //   textAlign: TextAlign.start,
                  //   style: GoogleFonts.roboto(
                  //     textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  // Text(
                  //   "The Arcane",
                  //   textAlign: TextAlign.start,
                  //   style: GoogleFonts.roboto(
                  //     textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    details['description'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const Divider(
                    height: 30,
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
                  const Divider(
                    height: 30,
                  ),
                  Text(
                    'Patient Details',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['patient_name'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 1.5,
                  ),
                  Text(
                    details['patient_address_line'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['patient_place'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['patient_district'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['patient_state'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['patient_pincode'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Text(
                    'Hospital Details',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['hospital_name'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 1.5,
                  ),
                  Text(
                    details['hospital_address_line'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['hospital_place'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['hospital_district'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['hospital_state'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    details['hospital_pincode'],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: details['user_id'] !=
                Supabase.instance.client.auth.currentUser!.id
            ? CustomButton(text: "Donate", onTap: () {})
            : details['status'] != 'completed' || details['status'] != 'closed'
                ? Row(
                    children: [
                      Expanded(
                        child: CustomActionButton(
                          color: Colors.orange,
                          iconData: Icons.edit,
                          label: 'Edit',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CreateRequest(
                                  manageRequestBloc: manageRequestBloc,
                                  details: details,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomActionButton(
                          color: Colors.green,
                          iconData: Icons.done,
                          label: 'Completed',
                          onPressed: () {
                            manageRequestBloc.add(UpdateRequestStatusEvent(
                                status: 'completed', requestId: details['id']));

                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomActionButton(
                          color: Colors.red,
                          iconData: Icons.close,
                          label: 'Close',
                          onPressed: () {
                            manageRequestBloc.add(UpdateRequestStatusEvent(
                                status: 'closed', requestId: details['id']));

                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
      ),
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/screens/create_request.dart';
import 'package:donatoo/ui/widget/custom_action_button.dart';
import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
            CachedNetworkImage(
              imageUrl: details['image'],
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details['title'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    details['user']['name'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomLabel(
                          titleText: "₹8,200",
                          descriptionText: "of ₹200000",
                          color: Colors.lightGreen,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: CustomLabel(
                            titleText: "24",
                            descriptionText: "Donators",
                            color: Colors.deepPurple,
                          )),
                      Expanded(
                        flex: 3,
                        child: CustomLabel(
                          alignment: CrossAxisAlignment.end,
                          titleText: DateFormat('dd/MM/yyyy')
                              .format(DateTime.parse(details['duedate'])),
                          descriptionText: "Due Date",
                          color: Colors.deepOrange,
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
                  const Divider(
                    height: 30,
                  ),
                  Text(
                    'Patient Details',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
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
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.black45,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            details['patient_address_line'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            details['patient_place'] +
                                ', ' +
                                details['patient_district'] +
                                ', ' +
                                details['patient_state'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            details['patient_pincode'].toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call),
                    label: Text(details['patient_phone']),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Hospital Details',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
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
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.black45,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            details['hospital_address_line'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            details['hospital_place'] +
                                ', ' +
                                details['hospital_district'] +
                                ', ' +
                                details['hospital_state'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            details['hospital_pincode'].toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call),
                    label: Text(details['hospital_phone']),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Padding(
          padding:
              details['status'] == 'pending' || details['status'] == 'active'
                  ? const EdgeInsets.symmetric(horizontal: 10, vertical: 15)
                  : EdgeInsets.zero,
          child: details['user_id'] !=
                  Supabase.instance.client.auth.currentUser!.id
              ? CustomButton(text: "Donate", onTap: () {})
              : details['status'] == 'pending' || details['status'] == 'active'
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
                                  status: 'completed',
                                  requestId: details['id']));

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
      ),
    );
  }
}

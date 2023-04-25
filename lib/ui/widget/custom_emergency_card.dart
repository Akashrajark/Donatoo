import 'package:cached_network_image/cached_network_image.dart';
import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/screens/request_detail_screen.dart';
import 'package:donatoo/util/truncate_string.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_label.dart';

class EmergencyCard extends StatelessWidget {
  final Map<String, dynamic> emergencyRequestDetail;
  final ManageRequestBloc manageRequestBloc;
  const EmergencyCard({
    super.key,
    required this.emergencyRequestDetail,
    required this.manageRequestBloc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequestDetails(
              details: emergencyRequestDetail,
              manageRequestBloc: manageRequestBloc,
            ),
          ),
        );
      },
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: emergencyRequestDetail['image'],
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, child, loadingProgress) =>
                  const CupertinoActivityIndicator(),
              height: 220,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(emergencyRequestDetail['title'],
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      truncateString(
                          emergencyRequestDetail['description'], 100),
                      style: Theme.of(context).textTheme.bodyMedium),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        emergencyRequestDetail['collected_amount'] != null
                            ? emergencyRequestDetail['collected_amount']
                                .toString()
                            : '100',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        emergencyRequestDetail['amount_required'] != null
                            ? emergencyRequestDetail['amount_required']
                                .toString()
                            : '1000',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const LinearProgressIndicator(
                    value: .5,
                    backgroundColor: Colors.black12,
                    color: Colors.lightGreen,
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomLabel(
                          titleText:
                              emergencyRequestDetail['fundedPercentage'] ??
                                  '60%',
                          descriptionText: "Funded",
                          color: Colors.lightGreen,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: CustomLabel(
                            alignment: CrossAxisAlignment.start,
                            titleText:
                                emergencyRequestDetail['donaters'] ?? '22',
                            descriptionText: "Donations",
                            color: Colors.deepPurple,
                          )),
                      Expanded(
                        flex: 3,
                        child: CustomLabel(
                          alignment: CrossAxisAlignment.end,
                          titleText: DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                              emergencyRequestDetail['duedate'],
                            ),
                          ),
                          descriptionText: "Due Date",
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

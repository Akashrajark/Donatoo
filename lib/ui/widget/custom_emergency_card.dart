import 'package:cached_network_image/cached_network_image.dart';
import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/screens/request_detail_screen.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              // loadingBuilder: (context, child, loadingProgress) =>
              //     const CupertinoActivityIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(emergencyRequestDetail['title'],
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(emergencyRequestDetail['description'],
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomLabel(
                          titleText:
                              emergencyRequestDetail['fundedPercentage'] ??
                                  '60',
                          descriptionText: "funded",
                          color: Colors.lightGreen,
                        ),
                      ),
                      Expanded(
                          child: CustomLabel(
                        titleText: emergencyRequestDetail['donaters'] ?? '22',
                        descriptionText: "donaters",
                      )),
                      Expanded(
                        flex: 2,
                        child: CustomLabel(
                          titleText: emergencyRequestDetail['timeleft'] ?? '11',
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
      ),
    );
  }
}

import 'package:donatoo/ui/screens/request_detail_screen.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';

import 'custom_label.dart';

class EmergencyCard extends StatelessWidget {
  final Map<String, dynamic> emergencyRequestDetail;
  const EmergencyCard({
    super.key,
    required this.emergencyRequestDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RequestDetails(),
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
            Image.asset(
              emergencyRequestDetail['image'],
              fit: BoxFit.cover,
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
                        emergencyRequestDetail['collectedAmount'],
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        emergencyRequestDetail['requiredAmount'],
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
                          titleText: emergencyRequestDetail['fundedPercentage'],
                          descriptionText: "funded",
                          color: Colors.lightGreen,
                        ),
                      ),
                      Expanded(
                          child: CustomLabel(
                        titleText: emergencyRequestDetail['donaters'],
                        descriptionText: "donaters",
                      )),
                      Expanded(
                        flex: 2,
                        child: CustomLabel(
                          titleText: emergencyRequestDetail['timeleft'],
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

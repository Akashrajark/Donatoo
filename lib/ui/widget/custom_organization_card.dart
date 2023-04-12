import 'package:donatoo/ui/screens/organization_detail_screen.dart';
import 'package:flutter/material.dart';

import 'custom_label.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrganizationDetails(),
            ),
          );
        },
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Emergency.jpg",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Organization Name",
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("category",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$60000",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomLabel(
                      titleText: "24",
                      descriptionText: "donaters",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

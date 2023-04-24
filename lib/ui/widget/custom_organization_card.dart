import 'package:cached_network_image/cached_network_image.dart';
import 'package:donatoo/bloc/manage_organizations/manage_organizations_bloc.dart';
import 'package:donatoo/ui/screens/organization_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_label.dart';

class OrganizationCard extends StatelessWidget {
  final Map<String, dynamic> organizationDetails;
  final ManageOrganizationsBloc manageOrganizationsBloc;
  const OrganizationCard({
    super.key,
    required this.organizationDetails,
    required this.manageOrganizationsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrganizationDetails(
              organisationDetails: organizationDetails,
              manageOrganizationsBloc: manageOrganizationsBloc,
            ),
          ),
        );
      },
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: organizationDetails['photo'],
              fit: BoxFit.cover,
              height: 150,
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
                  Text(
                    organizationDetails['name'],
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    organizationDetails['category'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
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
                        organizationDetails['place'] +
                            ', ' +
                            organizationDetails['state'] +
                            ', ' +
                            organizationDetails['district'],
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
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomLabel(
                        titleText: '₹${organizationDetails['total_payment']}',
                        descriptionText: "Funded",
                        color: Colors.green,
                      ),
                      CustomLabel(
                        alignment: CrossAxisAlignment.end,
                        titleText:
                            organizationDetails['payments'].length.toString(),
                        descriptionText: "Donations",
                        color: Colors.deepPurple,
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

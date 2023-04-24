import 'package:donatoo/bloc/manage_organizations/manage_organizations_bloc.dart';
import 'package:donatoo/ui/widget/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_alert_dialog.dart';
import '../widget/custom_organization_card.dart';
import '../widget/image_tex_box.dart';

class Organization extends StatefulWidget {
  const Organization({super.key});

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  final ManageOrganizationsBloc manageOrganizationsBloc =
      ManageOrganizationsBloc();
  String? query;

  void getOrganisations() {
    manageOrganizationsBloc.add(GetAllOrganizationEvent(query: query));
  }

  @override
  void initState() {
    super.initState();
    getOrganisations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageOrganizationsBloc>.value(
      value: manageOrganizationsBloc,
      child: ListView(
        children: [
          const ImageTextBox(
            image:
                "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
            title: "Organizations",
            iconData: Icons.volunteer_activism,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomSearch(
              onSearch: (search) {
                query = search;
                getOrganisations();
              },
            ),
          ),
          BlocConsumer<ManageOrganizationsBloc, ManageOrganizationsState>(
            listener: (context, state) {
              if (state is ManageOrganizationsFailureState) {
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: 'Failure',
                    message: state.message,
                    primaryButtonLabel: 'Ok',
                    primaryOnPressed: () {
                      manageOrganizationsBloc.add(GetAllOrganizationEvent());
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
            builder: (context, state) {
              return state is ManageOrganizationsSuccessState
                  ? state.organizations.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          itemBuilder: (context, index) => OrganizationCard(
                            organizationDetails: state.organizations[index],
                            manageOrganizationsBloc: manageOrganizationsBloc,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: state.organizations.length,
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 50,
                            ),
                            child: Text('No Organisations found!'),
                          ),
                        )
                  : const Center(
                      child: Padding(
                        padding: EdgeInsets.all(50.0),
                        child: CupertinoActivityIndicator(),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

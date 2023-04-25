import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/widget/custom_alert_dialog.dart';
import 'package:donatoo/ui/widget/custom_emergency_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_search.dart';
import '../widget/image_tex_box.dart';

class Emergency extends StatefulWidget {
  final ManageRequestBloc manageRequestBloc;
  const Emergency({super.key, required this.manageRequestBloc});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  String? query;

  @override
  void initState() {
    super.initState();
    getRequests();
  }

  void getRequests() {
    widget.manageRequestBloc.add(GetAllRequestsEvent(
      ownRequests: false,
      query: query,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageRequestBloc>.value(
      value: widget.manageRequestBloc,
      child: BlocConsumer<ManageRequestBloc, ManageRequestState>(
        listener: (context, state) {
          if (state is ManageRequestsFailureState) {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                title: 'Failure',
                message: state.message,
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              const ImageTextBox(
                image:
                    "https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
                title: "Emergencies",
                iconData: Icons.emergency,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomSearch(
                  onSearch: (search) {
                    query = search;
                    getRequests();
                  },
                ),
              ),
              state is ManageRequestsSuccessState
                  ? state.requests.isNotEmpty
                      ? ListView.separated(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                            bottom: 100,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => EmergencyCard(
                            emergencyRequestDetail: state.requests[index],
                            manageRequestBloc: widget.manageRequestBloc,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: state.requests.length,
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 50,
                            ),
                            child: Text('No Requests found!'),
                          ),
                        )
                  : state is ManageRequestsLoadingState
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(50.0),
                            child: CupertinoActivityIndicator(),
                          ),
                        )
                      : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

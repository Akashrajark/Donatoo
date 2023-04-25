import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/widget/custom_alert_dialog.dart';
import 'package:donatoo/ui/widget/custom_emergency_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/image_tex_box.dart';

class Request extends StatefulWidget {
  final ManageRequestBloc manageRequestBloc;
  const Request({super.key, required this.manageRequestBloc});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  void initState() {
    widget.manageRequestBloc.add(GetAllRequestsEvent(ownRequests: true));
    super.initState();
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
                    "https://images.unsplash.com/photo-1544027993-37dbfe43562a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
                title: "Requests",
                iconData: Icons.playlist_add_check_rounded,
              ),
              state is ManageOwnRequestsSuccessState
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

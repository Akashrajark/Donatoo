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
          return Column(
            children: [
              const ImageTextBox(
                image:
                    "https://images.unsplash.com/photo-1544027993-37dbfe43562a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
                title: "Requests",
                iconData: Icons.playlist_add_check_rounded,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: state is ManageOwnRequestsSuccessState
                        ? state.requests.isNotEmpty
                            ? Wrap(
                                runSpacing: 10,
                                children: List<Widget>.generate(
                                  state.requests.length,
                                  (index) => EmergencyCard(
                                    emergencyRequestDetail:
                                        state.requests[index],
                                    manageRequestBloc: widget.manageRequestBloc,
                                  ),
                                ),
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
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

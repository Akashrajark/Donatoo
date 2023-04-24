import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:flutter/material.dart';
import '../widget/custom_emergency_card.dart';
import '../widget/image_tex_box.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ImageTextBox(
          image:
              "https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
          title: "Emergencies",
          iconData: Icons.emergency,
        ),
        Padding(padding: EdgeInsets.all(8.0), child: SizedBox()
            //  EmergencyCard(
            //   //manageRequestBloc: ManageRequestBloc(),
            //   emergencyRequestDetail: {
            //     'image': 'assets/images/Emergency.jpg',
            //     'title': 'abc',
            //     'description': 'sjhjbjbknbjk',
            //     'collectedAmount': '60000',
            //     'requiredAmount': '100000',
            //     'fundedPercentage': '60%',
            //     'donaters': '24',
            //     'timeleft': '11'
            //   },
            // ),
            ),
      ],
    );
  }
}

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
          image: "assets/images/Emergency.jpg",
          title: "Emergency",
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: EmergencyCard(
            emergencyRequestDetail: {
              'image': 'assets/images/Emergency.jpg',
              'title': 'abc',
              'description': 'sjhjbjbknbjk',
              'collectedAmount': '60000',
              'requiredAmount': '100000',
              'fundedPercentage': '60%',
              'donaters': '24',
              'timeleft': '11'
            },
          ),
        ),
      ],
    );
  }
}

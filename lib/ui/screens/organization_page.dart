import 'package:flutter/material.dart';

import '../widget/custom_organization_card.dart';
import '../widget/image_tex_box.dart';

class Organization extends StatelessWidget {
  const Organization({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ImageTextBox(
          image: "assets/images/Emergency.jpg",
          title: "Organization",
        ),
        OrganizationCard(),
      ],
    );
  }
}

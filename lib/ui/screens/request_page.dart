import 'package:donatoo/ui/screens/create_request.dart';
import 'package:flutter/material.dart';

import '../widget/custom_button.dart';
import '../widget/image_tex_box.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageTextBox(
          image: "assets/images/Emergency.jpg",
          title: "Request",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            text: "Create Request",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateRequest(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

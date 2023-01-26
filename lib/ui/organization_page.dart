import 'package:donatoo/widget/image_tex_box.dart';
import 'package:flutter/material.dart';

class Organization extends StatelessWidget {
  const Organization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ImageTextBox(
              image: "assets/images/Emergency.jpg", title: "Organization")
        ],
      ),
    );
  }
}

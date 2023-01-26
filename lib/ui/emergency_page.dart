import 'package:flutter/material.dart';

import '../widget/image_tex_box.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ImageTextBox(
            image: "assets/images/Emergency.jpg",
            title: "Emergency",
          ),
        ],
      ),
    );
  }
}

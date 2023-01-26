import 'package:donatoo/widget/image_tex_box.dart';
import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ImageTextBox(image: "assets/images/Emergency.jpg", title: "Request"),
        ],
      ),
    );
  }
}

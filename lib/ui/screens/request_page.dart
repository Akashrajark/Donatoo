import 'package:flutter/material.dart';

import '../widget/image_tex_box.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ImageTextBox(
          image:
              "https://images.unsplash.com/photo-1544027993-37dbfe43562a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
          title: "Requests",
          iconData: Icons.playlist_add_check_rounded,
        ),
      ],
    );
  }
}

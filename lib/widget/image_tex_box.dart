import 'package:flutter/material.dart';

class ImageTextBox extends StatelessWidget {
  final String image, title;
  const ImageTextBox({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 160,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            bottom: 25,
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

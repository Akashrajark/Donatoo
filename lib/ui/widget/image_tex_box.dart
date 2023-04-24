import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageTextBox extends StatelessWidget {
  final String image, title;
  final IconData iconData;
  const ImageTextBox({
    Key? key,
    required this.image,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Material(
          color: Colors.black,
          child: Opacity(
            opacity: .6,
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: 160,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                size: 60,
                color: Colors.white60,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

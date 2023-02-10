import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String image;
  const ContactImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        image,
        width: 100,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

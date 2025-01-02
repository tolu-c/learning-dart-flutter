import 'package:flutter/material.dart';

class AssetImage extends StatelessWidget {
  const AssetImage({super.key, required this.imageSrc});

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageSrc);
  }
}

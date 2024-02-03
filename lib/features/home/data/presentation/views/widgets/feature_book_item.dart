import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeatureBookItem extends StatelessWidget {
  const FeatureBookItem({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        20,
      ),
      child: AspectRatio(
        aspectRatio: 2.3 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl ??
              'https://www.neelwafurat.com/images/eg/abookstore/covers/carton/188/188651.jpg',
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Icon(Icons.access_alarm_outlined),
        ),
      ),
    );
  }
}

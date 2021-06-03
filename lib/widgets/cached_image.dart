import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  CachedImage({
    this.imageUrl,
    this.height = 100,
    this.width = double.maxFinite,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      fit: BoxFit.fill,
      width: width,
      imageUrl: imageUrl,
      placeholder: (context, _) => Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Center(
        child: Text('Error loading image'),
      ),
    );
  }
}

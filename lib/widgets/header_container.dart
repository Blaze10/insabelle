import 'package:flutter/material.dart';
import 'package:insabelle_task/widgets/cached_image.dart';

class HeaderContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  HeaderContainer({this.imageUrl, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpeg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.srcOver),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (imageUrl != null)
            CachedImage(
              imageUrl: '$imageUrl',
              height: 160,
              width: 120,
            ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: imageUrl == null
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (description != null) SizedBox(height: 8),
                if (description != null)
                  Text(
                    '$description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

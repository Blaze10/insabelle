import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insabelle_task/core/theme_colors.dart';
import 'package:insabelle_task/widgets/cached_image.dart';

class GridListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String brandData;
  final String price;
  final bool isFav;
  final bool showIsFav;
  final String subCategory;

  GridListItem({
    @required this.imageUrl,
    @required this.title,
    this.brandData,
    this.subCategory,
    this.price,
    this.isFav,
    this.showIsFav,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          if (brandData != null) SizedBox(height: 5),
          if (brandData != null)
            Text(
              brandData ?? '',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          if (subCategory != null) SizedBox(height: 5),
          if (subCategory != null)
            Text(
              subCategory ?? '',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          SizedBox(height: 10),
          CachedImage(imageUrl: imageUrl),
          if (price != null) SizedBox(height: 8),
          if (price != null)
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: '$price',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'QAR',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: ThemeColors.scaffoldColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

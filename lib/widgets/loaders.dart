import 'package:flutter/material.dart';
import 'package:insabelle_task/widgets/gridlist_item.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 4 / 4,
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          children: [
            GridListItem(
              title: '',
              imageUrl: '',
            ),
            GridListItem(
              title: '',
              imageUrl: '',
            ),
            GridListItem(
              title: '',
              imageUrl: '',
            ),
            GridListItem(
              title: '',
              imageUrl: '',
            ),
          ],
        ),
      ),
    );
  }
}

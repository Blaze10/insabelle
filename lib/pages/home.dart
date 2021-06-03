import 'package:flutter/material.dart';
import 'package:insabelle_task/core/models/category_brand_model.dart';
import 'package:insabelle_task/core/providers/category_brand_provider.dart';
import 'package:insabelle_task/core/providers/product_list_provider.dart';
import 'package:insabelle_task/core/services/api_response.dart';
import 'package:insabelle_task/pages/product_list_page.dart';
import 'package:insabelle_task/widgets/common_appbar.dart';
import 'package:insabelle_task/widgets/filter_row.dart';
import 'package:insabelle_task/widgets/gridlist_item.dart';
import 'package:insabelle_task/widgets/header_container.dart';
import 'package:insabelle_task/widgets/loaders.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var catProvider = Provider.of<CategoryBrandProvider>(context);
    var showLoader = catProvider.apiResponse != null &&
        catProvider.apiResponse.status != null &&
        catProvider.apiResponse.status == Status.LOADING;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(),
        body: ListView(
          children: [
            HeaderContainer(
              title: 'Luxury',
              description: 'Everthing luxury',
            ),
            FilterRow(),
            showLoader
                ? LoadingShimmer()
                : (catProvider.apiResponse != null &&
                        catProvider.apiResponse.data != null)
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 5,
                          shrinkWrap: true,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ...catProvider.apiResponse.data.data.map((el) {
                              return _buildBrandItem(
                                item: el,
                                context: context,
                              );
                            }).toList()
                          ],
                        ),
                      )
                    : Center(
                        child: Text('No items found'),
                      )
          ],
        ),
      ),
    );
  }

  Widget _buildBrandItem({
    @required CategoryBrand item,
    @required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        var listProvider =
            Provider.of<ProductListProvider>(context, listen: false);
        listProvider.getProductList(brandId: item.id.toString());
        Navigator.of(context).pushNamed(
          ProductListPage.routeName,
          arguments: item,
        );
      },
      child: GridListItem(imageUrl: item.image ?? '', title: item.name ?? ''),
    );
  }
}

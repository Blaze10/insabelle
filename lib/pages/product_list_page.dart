import 'package:flutter/material.dart';
import 'package:insabelle_task/core/models/category_brand_model.dart';
import 'package:insabelle_task/core/providers/product_list_provider.dart';
import 'package:insabelle_task/core/services/api_response.dart';
import 'package:insabelle_task/pages/filter.dart';
import 'package:insabelle_task/widgets/common_appbar.dart';
import 'package:insabelle_task/widgets/filter_row.dart';
import 'package:insabelle_task/widgets/gridlist_item.dart';
import 'package:insabelle_task/widgets/header_container.dart';
import 'package:insabelle_task/widgets/loaders.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  static const routeName = '/productListRoute';
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductListProvider>(context);
    var showProductLoader = productProvider.apiResponse != null &&
        productProvider.apiResponse.status != null &&
        productProvider.apiResponse.status == Status.LOADING;
    CategoryBrand brandInfo = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(),
        body: ListView(
          children: [
            HeaderContainer(
              imageUrl: brandInfo.image ?? '',
              title: brandInfo.name ?? '',
              description: brandInfo.description ?? '',
            ),
            FilterRow(
              onPressFilterFn: () {
                Navigator.of(context).pushNamed(
                  FilterPage.routeName,
                  arguments: brandInfo,
                );
              },
            ),
            showProductLoader
                ? LoadingShimmer()
                : (productProvider.apiResponse != null &&
                        productProvider.apiResponse.data != null)
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.2),
                          shrinkWrap: true,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ...productProvider.apiResponse.data.data.map((el) {
                              return GridListItem(
                                  imageUrl: (el.imgData != null &&
                                          el.imgData.length > 0)
                                      ? el.imgData[0].img ?? ''
                                      : '',
                                  title: el.pName ?? '',
                                  brandData: el.brandData.toString() ?? '',
                                  subCategory:
                                      el.subCategoryData.toString() ?? '',
                                  showIsFav: true,
                                  isFav: false,
                                  price: el.pPrice);
                            }).toList(),
                          ],
                        ),
                      )
                    : Center(
                        child: Text('No items found'),
                      ),
          ],
        ),
      ),
    );
  }
}

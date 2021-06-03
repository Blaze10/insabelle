import 'package:flutter/material.dart';
import 'package:insabelle_task/core/models/category_brand_model.dart';
import 'package:insabelle_task/core/providers/product_list_provider.dart';
import 'package:insabelle_task/core/theme_colors.dart';
import 'package:insabelle_task/widgets/cached_image.dart';
import 'package:insabelle_task/widgets/common_appbar.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  static const routeName = '/filterPage';
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int selectedFilter;
  List<SubCategoryDatum> selectedSubCategories = [];

  @override
  Widget build(BuildContext context) {
    CategoryBrand brand = ModalRoute.of(context).settings.arguments;
    List<SubCategoryDatum> subcateogryList = brand.subCategoryData;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(),
        body: Stack(
          children: [
            ListView(
              children: [
                filterHeader('FILTERS'),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: RadioListTile(
                              value: 1,
                              groupValue: selectedFilter,
                              onChanged: onSelectFilter,
                              title: Text('Low Price'),
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: RadioListTile(
                              value: 3,
                              groupValue: selectedFilter,
                              onChanged: onSelectFilter,
                              title: Text('New-Old'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: RadioListTile(
                              value: 2,
                              groupValue: selectedFilter,
                              onChanged: onSelectFilter,
                              title: Text('High Price'),
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: RadioListTile(
                              value: 4,
                              groupValue: selectedFilter,
                              onChanged: onSelectFilter,
                              title: Text('A-Z'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                filterHeader('SUBCATEGORY FILTER'),
                SizedBox(height: 10),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 4,
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: subcateogryList.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        _onSelectSubCategory(subcateogryList[index]);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.white,
                              child: CachedImage(
                                imageUrl: subcateogryList[index].image ?? '',
                                height: 100,
                              ),
                            ),
                          ),
                          if (selectedSubCategories
                              .contains(subcateogryList[index]))
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.check_circle,
                                color: ThemeColors.themeGrey,
                                size: 35,
                              ),
                            )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white,
                        ),
                      ),
                      child: Text(
                        'Clear All',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: _clearAllFilter,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black,
                        ),
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        onApplyFilter(brand);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget filterHeader(String title) {
    return Container(
      color: ThemeColors.themeGrey,
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  _onSelectSubCategory(SubCategoryDatum item) {
    if (selectedSubCategories.any((el) => el.subCatId == item.subCatId)) {
      selectedSubCategories.removeWhere((el) => el.subCatId == item.subCatId);
    } else {
      selectedSubCategories.add(item);
    }
    setState(() {});
  }

  _clearAllFilter() {
    setState(() {
      selectedSubCategories = [];
      selectedFilter = null;
    });
  }

  onSelectFilter(int val) {
    setState(() {
      selectedFilter = val;
    });
  }

  onApplyFilter(CategoryBrand brand) {
    var provider = Provider.of<ProductListProvider>(context, listen: false);
    provider.getProductList(
        brandId: brand.id.toString(), filter: selectedFilter.toString());
    Navigator.of(context).pop(selectedSubCategories);
  }
}

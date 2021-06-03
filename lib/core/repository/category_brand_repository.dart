import 'package:insabelle_task/core/models/category_brand_model.dart';
import 'package:insabelle_task/core/services/api_base_helper.dart';
import 'package:meta/meta.dart';

class CategoryBrandRepository {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  //! get brand cateogires
  Future<CategoryBrandResponse> getCategoryBrands({
    @required String categoryId,
    @required String searchBrand,
    @required String storeId,
    @required String filter,
  }) async {
    try {
      var res = await apiBaseHelper.post(
        '/category_brand?category_id=$categoryId&store_id=$storeId&filter=""&search_brand=$searchBrand',
        {},
      );
      CategoryBrandResponse catRes = CategoryBrandResponse.fromJson(res);
      return catRes;
    } catch (err) {
      print('Error getting category brands in repo: ${err.toString()}');
      return null;
    }
  }
}

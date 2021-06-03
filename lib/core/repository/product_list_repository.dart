import 'package:insabelle_task/core/models/product_list_model.dart';
import 'package:insabelle_task/core/services/api_base_helper.dart';
import 'package:meta/meta.dart';

class ProductListRepository {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  //! get products list
  Future<ProductListResponse> getProductList({
    String userId = '563',
    String catId = "16",
    String storeId = "178",
    @required String brandId,
    String limit = "10",
    String page = "1",
    String filter = "1",
  }) async {
    try {
      var res = await apiBaseHelper.post(
        '/product_list_new?user_id=563&cat_id=16&store_id=178&brand_id=$brandId&limit=$limit&page=$page&filter=$filter',
        {},
      );
      ProductListResponse productListRes = ProductListResponse.fromJson(res);
      return productListRes;
    } catch (err) {
      print('Error getting product list in repo: ${err.toString()}');
      return null;
    }
  }
}

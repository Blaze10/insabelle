import 'package:flutter/material.dart';
import 'package:insabelle_task/core/models/product_list_model.dart';
import 'package:insabelle_task/core/repository/product_list_repository.dart';
import 'package:insabelle_task/core/services/api_response.dart';

class ProductListProvider with ChangeNotifier {
  ApiResponse<ProductListResponse> apiResponse;
  ApiResponse<ProductListResponse> filteredApiResponse;
  ProductListRepository _repository = ProductListRepository();

  // ProductListProvider() {
  //   getProductList();
  // }

  getProductList({
    String userId,
    String catId,
    String storeId,
    @required String brandId,
    String limit,
    String page,
    String filter,
  }) async {
    apiResponse = ApiResponse.loading('Fetching product list...');
    notifyListeners();
    try {
      var res = await _repository.getProductList(
        brandId: brandId,
        catId: catId,
        filter: filter,
        limit: limit,
        page: page,
        storeId: storeId,
        userId: userId,
      );
      apiResponse = ApiResponse.completed(res);
      filteredApiResponse = ApiResponse.loading('Fetching product list...');
      notifyListeners();
    } catch (err) {
      apiResponse = ApiResponse.error(err.toString() ?? 'Some error occured');
      notifyListeners();
    }
  }

  setFilteredApiResponse(data) {
    filteredApiResponse.data.data = data;
    notifyListeners();
  }
}

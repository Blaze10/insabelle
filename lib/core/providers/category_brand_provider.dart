import 'package:flutter/material.dart';
import 'package:insabelle_task/core/models/category_brand_model.dart';
import 'package:insabelle_task/core/repository/category_brand_repository.dart';
import 'package:insabelle_task/core/services/api_response.dart';

class CategoryBrandProvider with ChangeNotifier {
  ApiResponse<CategoryBrandResponse> apiResponse;
  CategoryBrandRepository _repository = CategoryBrandRepository();

  CategoryBrandProvider() {
    getCategoryBrands();
  }

  getCategoryBrands({
    String categoryId = "16",
    String searchBrand = "",
    String storeId = "178",
    String filter = "",
  }) async {
    apiResponse = ApiResponse.loading('Fetching category brands...');
    notifyListeners();
    try {
      var res = await _repository.getCategoryBrands(
        categoryId: categoryId,
        searchBrand: searchBrand,
        storeId: storeId,
        filter: filter,
      );
      apiResponse = ApiResponse.completed(res);
      notifyListeners();
    } catch (err) {
      apiResponse = ApiResponse.error(err.toString() ?? 'Some error occured');
      notifyListeners();
    }
  }
}

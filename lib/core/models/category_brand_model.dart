import 'dart:convert';

CategoryBrandResponse categoryBrandResponseFromJson(String str) =>
    CategoryBrandResponse.fromJson(json.decode(str));

String categoryBrandResponseToJson(CategoryBrandResponse data) =>
    json.encode(data.toJson());

class CategoryBrandResponse {
  CategoryBrandResponse({
    this.status,
    this.message,
    this.data,
  });

  final String status;
  final String message;
  final List<CategoryBrand> data;

  factory CategoryBrandResponse.fromJson(Map<String, dynamic> json) =>
      CategoryBrandResponse(
        status: json["status"],
        message: json["message"],
        data: List<CategoryBrand>.from(
            json["data"].map((x) => CategoryBrand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryBrand {
  CategoryBrand({
    this.id,
    this.name,
    this.description,
    this.image,
    this.document,
    this.subCategoryData,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final String document;
  final List<SubCategoryDatum> subCategoryData;

  factory CategoryBrand.fromJson(Map<String, dynamic> json) => CategoryBrand(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        document: json["document"],
        subCategoryData: List<SubCategoryDatum>.from(
            json["sub_category_data"].map((x) => SubCategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "document": document,
        "sub_category_data":
            List<dynamic>.from(subCategoryData.map((x) => x.toJson())),
      };
}

class SubCategoryDatum {
  SubCategoryDatum({
    this.subCatId,
    this.image,
  });

  final int subCatId;
  final String image;

  factory SubCategoryDatum.fromJson(Map<String, dynamic> json) =>
      SubCategoryDatum(
        subCatId: json["sub_cat_Id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "sub_cat_Id": subCatId,
        "image": image,
      };
}

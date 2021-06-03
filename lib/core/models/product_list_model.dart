// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'dart:convert';

ProductListResponse productListResponseFromJson(String str) =>
    ProductListResponse.fromJson(json.decode(str));

class ProductListResponse {
  ProductListResponse({
    this.status,
    this.message,
    this.currentPage,
    this.nextPage,
    this.totalRows,
    this.data,
  });

  final String status;
  final String message;
  final String currentPage;
  final int nextPage;
  final int totalRows;
  List<ProductList> data;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      ProductListResponse(
        status: json["status"],
        message: json["message"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        totalRows: json["total_rows"],
        data: List<ProductList>.from(
            json["data"].map((x) => ProductList.fromJson(x))),
      );
}

class ProductList {
  ProductList({
    this.pId,
    this.pType,
    this.pCatId,
    this.pPrice,
    this.imgData,
    this.status,
    this.isHighlighted,
    this.isFavourite,
    this.videoUrl,
    this.thumbVideoUrl,
    this.brandData,
    this.subCategoryData,
    this.maxOrderQty,
    this.pShareLink,
    this.createdAt,
    this.updatedAt,
    this.pName,
    this.pDesc,
    this.highlightText,
  });

  final int pId;
  final int pType;
  final PCatId pCatId;
  final String pPrice;
  final List<ImgDatum> imgData;
  final int status;
  final int isHighlighted;
  final String isFavourite;
  final String videoUrl;
  final String thumbVideoUrl;
  final String brandData;
  final String subCategoryData;
  final int maxOrderQty;
  final String pShareLink;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String pName;
  final String pDesc;
  final String highlightText;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        pId: json["pId"],
        pType: json["pType"],
        pCatId: pCatIdValues.map[json["pCatId"]],
        pPrice: json["pPrice"],
        imgData: List<ImgDatum>.from(
            json["imgData"].map((x) => ImgDatum.fromJson(x))),
        status: json["status"],
        isHighlighted: json["isHighlighted"],
        isFavourite: json["isFavourite"],
        videoUrl: json["videoUrl"],
        thumbVideoUrl: json["thumb_video_url"],
        brandData: json["brand_data"] ?? '',
        subCategoryData: json["sub_category_data"] ?? '',
        maxOrderQty: json["maxOrderQty"],
        pShareLink: json["pShareLink"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        pName: json["pName"] == null ? null : json["pName"],
        pDesc: json["pDesc"] == null ? null : json["pDesc"],
        highlightText:
            json["highlightText"] == null ? null : json["highlightText"],
      );
}

class ImgDatum {
  ImgDatum({
    this.isDefault,
    this.img,
  });

  final String isDefault;
  final String img;

  factory ImgDatum.fromJson(Map<String, dynamic> json) => ImgDatum(
        isDefault: json["isDefault"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "isDefault": isDefault,
        "img": img,
      };
}

enum PCatId { THE_1624 }

final pCatIdValues = EnumValues({",16,24,": PCatId.THE_1624});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

// ignore_for_file: constant_identifier_names

import 'dart:convert';

class Products {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  final int id;
  final String title;
  final String description;
  final Category category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final AvailabilityStatus availabilityStatus;
  final List<Review> reviews;
  final ReturnPolicy returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: Dimensions.fromMap(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus:
            availabilityStatusValues.map[json["availabilityStatus"]]!,
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
        returnPolicy: returnPolicyValues.map[json["returnPolicy"]]!,
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: Meta.fromMap(json["meta"]),
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "category": categoryValues.reverseMap[category],
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions.toMap(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus":
            availabilityStatusValues.reverseMap[availabilityStatus],
        "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
        "returnPolicy": returnPolicyValues.reverseMap[returnPolicy],
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta.toMap(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

enum AvailabilityStatus { IN_STOCK, LOW_STOCK, OUT_OF_STOCK }

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Low Stock": AvailabilityStatus.LOW_STOCK,
  "Out of Stock": AvailabilityStatus.OUT_OF_STOCK,
});

enum Category {
  BEAUTY,
  FRAGRANCES,
  FURNITURE,
  GROCERIES,
  HOME_DECORATION,
  KITCHEN_ACCESSORIES,
  LAPTOPS,
  MENS_SHIRTS,
  MENS_SHOES,
  MENS_WATCHES,
  MOBILE_ACCESSORIES,
  MOTORCYCLE,
  SKIN_CARE,
  SMARTPHONES,
  SPORTS_ACCESSORIES,
  SUNGLASSES,
  TABLETS,
  TOPS,
  VEHICLE,
  WOMENS_BAGS,
  WOMENS_DRESSES,
  WOMENS_JEWELLERY,
  WOMENS_SHOES,
  WOMENS_WATCHES,
}

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES,
  "home-decoration": Category.HOME_DECORATION,
  "kitchen-accessories": Category.KITCHEN_ACCESSORIES,
  "laptops": Category.LAPTOPS,
  "mens-shirts": Category.MENS_SHIRTS,
  "mens-shoes": Category.MENS_SHOES,
  "mens-watches": Category.MENS_WATCHES,
  "mobile-accessories": Category.MOBILE_ACCESSORIES,
  "motorcycle": Category.MOTORCYCLE,
  "skin-care": Category.SKIN_CARE,
  "smartphones": Category.SMARTPHONES,
  "sports-accessories": Category.SPORTS_ACCESSORIES,
  "sunglasses": Category.SUNGLASSES,
  "tablets": Category.TABLETS,
  "tops": Category.TOPS,
  "vehicle": Category.VEHICLE,
  "womens-bags": Category.WOMENS_BAGS,
  "womens-dresses": Category.WOMENS_DRESSES,
  "womens-jewellery": Category.WOMENS_JEWELLERY,
  "womens-shoes": Category.WOMENS_SHOES,
  "womens-watches": Category.WOMENS_WATCHES,
});

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(String str) =>
      Dimensions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

enum ReturnPolicy {
  NO_RETURN_POLICY,
  THE_30_DAYS_RETURN_POLICY,
  THE_60_DAYS_RETURN_POLICY,
  THE_7_DAYS_RETURN_POLICY,
  THE_90_DAYS_RETURN_POLICY,
}

final returnPolicyValues = EnumValues({
  "No return policy": ReturnPolicy.NO_RETURN_POLICY,
  "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
  "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
  "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY,
});

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  Map<String, dynamic> toMap() => {
        "rating": rating,
        "comment": comment,
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map) {
    reverseMap = map.map((k, v) => MapEntry(v, k));
  }
}

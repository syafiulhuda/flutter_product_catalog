import 'dart:convert';

class Cart {
  final List<CartElement> carts;
  final int total;
  final int skip;
  final int limit;

  Cart({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        carts: List<CartElement>.from(
            json["carts"].map((x) => CartElement.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toMap() => {
        "carts": List<dynamic>.from(carts.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class CartElement {
  final int id;
  final List<Product> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  CartElement({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartElement.fromJson(String str) =>
      CartElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartElement.fromMap(Map<String, dynamic> json) => CartElement(
        id: json["id"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
        total: json["total"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
      };
}

class Product {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
        total: json["total"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedTotal": discountedTotal,
        "thumbnail": thumbnail,
      };
}

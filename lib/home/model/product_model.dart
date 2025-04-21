import 'dart:convert';

class ProductModel {
  int? id;
  String? name;
  String? weight;
  String? price;
  int? isFavourite;
  int? isDaily;
  String? description;
  String? rating;
  String? category;
  List<String> relatedImages = [];
  String? image;
  String? quantity;

  ProductModel(
      {this.name,
      this.weight,
      this.category,
      this.description,
      this.isDaily,
      this.isFavourite,
      this.price,
      this.rating,
      this.image,
      this.id,
      this.quantity,
      required this.relatedImages});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        relatedImages: (json["relatedImages"] is String)
            ? List<String>.from(jsonDecode(json["relatedImages"]))
            : (json["relatedImages"] is List
                ? List<String>.from(json["relatedImages"])
                : []),
        category: json["category"] ?? "",
        description: json["description"] ?? "",
        isDaily: json["isDaily"],
        isFavourite: json["isFavourite"],
        name: json["name"] ?? "",
        price: json["price"] ?? "",
        rating: json["rating"] ?? "",
        image: json["image"] ?? "",
        quantity: json["quantity"].toString(),
        weight: json["weight"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "relatedImages": jsonEncode(relatedImages),
      "name": name,
      "weight": weight,
      "price": price,
      "isFavourite": isFavourite,
      "isDaily": isDaily,
      "description": description,
      "rating": rating,
      "category": category,
      "image": image,
      "quantity": quantity
    };
  }
}

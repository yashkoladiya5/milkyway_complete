class CartWalletModel {
  int id;
  String name;
  String price;
  String quantity;
  String image;
  String weightValue;
  String weightUnit;
  String date;
  int isIncome;
  int isExpense;
  int isDaily;

  CartWalletModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.weightValue,
      required this.quantity,
      required this.date,
      required this.image,
      required this.isExpense,
      required this.isIncome,
      required this.isDaily,
      required this.weightUnit});

  factory CartWalletModel.fromJson(Map<String, dynamic> json) {
    return CartWalletModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? "",
        weightValue: json["weightValue"] ?? "",
        quantity: json["quantity"] ?? "",
        date: json["date"] ?? "",
        image: json["image"] ?? "",
        isExpense: json["isExpense"] as int? ?? 0,
        isIncome: json["isIncome"] as int? ?? 0,
        isDaily: json["isDaily"] as int? ?? 0,
        weightUnit: json["weightUnit"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "quantity": quantity,
      "image": image,
      "weightValue": weightValue,
      "weightUnit": weightUnit,
      "date": date,
      "isIncome": isIncome,
      "isDaily": isDaily,
      "isExpense": isExpense
    };
  }
}

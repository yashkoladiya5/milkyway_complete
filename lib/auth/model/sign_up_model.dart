import 'package:milkyway/home/model/product_model.dart';

class SignUpModel {
  String? name;
  String? area;
  String? address;
  int? pincode;
  String? mobileNumber;
  String? email;
  String? password;
  String? confirmPassword;
  // List<ProductModel> products = [];

  SignUpModel(
      {this.name,
      this.address,
      this.area,
      this.email,
      this.mobileNumber,
      this.password,
      this.confirmPassword,
      // required this.products,
      this.pincode});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
        // products: (json["products"] as List<dynamic>?)?.map(
        //       (e) {
        //         return ProductModel.fromJson(e as Map<String, dynamic>);
        //       },
        //     ).toList() ??
        //     [],
        name: json["name"],
        address: json["address"],
        area: json["area"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        pincode: json["pincode"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "area": area,
      "email": email,
      "mobileNumber": mobileNumber,
      "pincode": pincode,
      "password": password,
      "confirmPassword": confirmPassword,
      // "products": products
      //     .map(
      //       (e) => e.toJson(),
      //     )
      //     .toList()
    };
  }
}

class LocationModel {
  String name;
  String address;
  String area;
  int? pincode;
  String mobileNumber;
  String email;

  LocationModel(
      {required this.name,
      required this.address,
      required this.area,
      required this.email,
      required this.mobileNumber,
      required this.pincode});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        name: json["name"],
        address: json["address"],
        area: json["area"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        pincode: int.tryParse(json["pincode"].toString()));
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "area": area,
      "pincode": pincode,
      "mobileNumber": mobileNumber,
      "email": email
    };
  }
}

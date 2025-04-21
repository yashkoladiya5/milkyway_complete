class CategoriesModel {
  String image;
  String title;

  CategoriesModel({required this.image, required this.title});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(image: json["name"], title: json["title"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "title": title,
    };
  }
}

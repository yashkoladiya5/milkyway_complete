import 'package:flutter/cupertino.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';

class ProductPageController extends ChangeNotifier {
  ProductModel? _productModel;

  ProductModel? get productModel => _productModel;

  Future fetchData({required int id}) async {
    List<ProductModel> data = [];
    data = await DbHelper().readData();

    for (int i = 0; i < data.length; i++) {
      if (data[i].id == id) {
        _productModel = data[i];
        break;
      }
    }
    notifyListeners();
    print("PRODUCT DATA FETCHED ID : ${_productModel!.id}");
  }
}

class QuantityController extends ChangeNotifier {
  String? _quantity = '0';

  String? get quantity => _quantity;

  updateQuantity({required String newQuantity}) {
    _quantity = newQuantity;
    print("QUANTITY = $_quantity");
    notifyListeners();
  }
}

class FavouriteController extends ChangeNotifier {
  int? _isFavourite;

  int? get isFavourite => _isFavourite;

  updateFavourite({required int newVal}) {
    _isFavourite = newVal;
    print("FAVOURITE : $_isFavourite");
    notifyListeners();
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/home/model/product_model.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

String tableName = DatabaseProductTableStrings.tableName;
String id = DatabaseProductTableStrings.productId;
String name = DatabaseProductTableStrings.productName;
String weight = DatabaseProductTableStrings.productWeight;
String price = DatabaseProductTableStrings.productPrice;
String isFavourite = DatabaseProductTableStrings.productIsFavourite;
String isDaily = DatabaseProductTableStrings.productIsDaily;
String description = DatabaseProductTableStrings.productDescription;
String rating = DatabaseProductTableStrings.productRating;
String category = DatabaseProductTableStrings.productCategory;
String relatedImages = DatabaseProductTableStrings.productRelatedImages;
String image = DatabaseProductTableStrings.productImage;
String quantity = DatabaseProductTableStrings.productQuantity;

String tableName1 = DatabaseRechargeTableStrings.tableName;
String company = DatabaseRechargeTableStrings.companyName;
String category1 = DatabaseRechargeTableStrings.companyCategory;
String data = DatabaseRechargeTableStrings.companyData;
String voice = DatabaseRechargeTableStrings.companyVoice;
String sms = DatabaseRechargeTableStrings.companySms;
String validity = DatabaseRechargeTableStrings.companyValidity;
String subscription = DatabaseRechargeTableStrings.companySubscription;
String offer = DatabaseRechargeTableStrings.companyOffer;
String price1 = DatabaseRechargeTableStrings.companyPrice;

String tableName2 = DatabaseGasBookingTableStrings.tableName;
String gasProviderName = DatabaseGasBookingTableStrings.providerName;
String registeredMobile = DatabaseGasBookingTableStrings.registeredMobile;
String cylinderPrice = DatabaseGasBookingTableStrings.cylinderPrice;
String paymentStatus = DatabaseGasBookingTableStrings.paymentStatus;
String dealerName = DatabaseGasBookingTableStrings.dealerName;
String imageGas = DatabaseGasBookingTableStrings.image;

String tableName3 = DatabasePayGasBillTableStrings.tableName;
String gasProviderName1 = DatabasePayGasBillTableStrings.providerName;
String customerId = DatabasePayGasBillTableStrings.customerId;
String customerName = DatabasePayGasBillTableStrings.customerName;
String registeredMobile1 = DatabasePayGasBillTableStrings.registeredMobile;
String billAmountRemain = DatabasePayGasBillTableStrings.billAmountRemain;
String dealerName1 = DatabasePayGasBillTableStrings.dealerName;
String imagePay = DatabasePayGasBillTableStrings.image;

String tableName4 = DatabaseElectricityTableStrings.tableName;
String customerNo = DatabaseElectricityTableStrings.customerNo;
String customerName1 = DatabaseElectricityTableStrings.customerName;
String electricityProvider =
    DatabaseElectricityTableStrings.electricityProvider;
String image2 = DatabaseElectricityTableStrings.image;
String dueDate = DatabaseElectricityTableStrings.dueDate;
String amount = DatabaseElectricityTableStrings.amount;
String state = DatabaseElectricityTableStrings.state;

String tableName5 = DatabaseIncomeExpenseTableStrings.tableName;
String incomeExpenseName = DatabaseIncomeExpenseTableStrings.name;
String incomeExpensePrice = DatabaseIncomeExpenseTableStrings.price;
String incomeExpenseDate = DatabaseIncomeExpenseTableStrings.date;
String isExpense = DatabaseIncomeExpenseTableStrings.isExpense;
String isIncome = DatabaseIncomeExpenseTableStrings.isIncome;
String weightValue = DatabaseIncomeExpenseTableStrings.weightValue;
String weightUnit = DatabaseIncomeExpenseTableStrings.weightUnit;
String quantity1 = DatabaseIncomeExpenseTableStrings.quantity;
String image3 = DatabaseIncomeExpenseTableStrings.image;

String tableName6 = DatabaseDailyTableStrings.tableName;

class DbHelper {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, "milkyway.db");

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName($id INTEGER,$name TEXT,$weight TEXT,$price TEXT,$isFavourite INTEGER,$isDaily INTEGER,$description TEXT,$rating TEXT,$category TEXT,$relatedImages TEXT,$image TEXT,$quantity TEXT )');

        db.execute(
            'CREATE TABLE $tableName1(id INTEGER PRIMARY KEY AUTOINCREMENT, $company TEXT, $category1 TEXT, $data TEXT, $voice TEXT, $sms TEXT, $validity TEXT, $subscription TEXT, $offer TEXT,$price1 TEXT)');

        db.execute(
            'CREATE TABLE $tableName2(id INTEGER PRIMARY KEY AUTOINCREMENT, $gasProviderName TEXT,$registeredMobile TEXT,$cylinderPrice REAL, $paymentStatus TEXT,$dealerName TEXT,$imageGas TEXT)');

        db.execute(
            'CREATE TABLE $tableName3(id INTEGER PRIMARY KEY AUTOINCREMENT,$gasProviderName1 TEXT,$customerId TEXT,$customerName TEXT,$registeredMobile1 TEXT,$billAmountRemain REAL,$dealerName1 TEXT,$imagePay TEXT)');

        db.execute(
            'CREATE TABLE $tableName4($customerNo TEXT,$electricityProvider TEXT,$image2 TEXT,$dueDate TEXT,$amount REAL,$state TEXT,$customerName1 TEXT)');

        db.execute(
            'CREATE TABLE $tableName5($id INTEGER,$incomeExpenseName TEXT,$incomeExpensePrice TEXT,$incomeExpenseDate DATE,$weightValue TEXT,$weightUnit TEXT, $isExpense INTEGER NOT NULL DEFAULT 0,$isIncome INTEGER NOT NULL DEFAULT 0,$quantity1 TEXT,$image TEXT,$isDaily int)');

        db.execute(
            'CREATE TABLE $tableName6($id INTEGER,$name TEXT,$weight TEXT,$price TEXT,$isFavourite INTEGER,$isDaily INTEGER,$description TEXT,$rating TEXT,$category TEXT,$relatedImages TEXT,$image TEXT,$quantity TEXT )');
      },
    );
    return _database;
  }

  Future<void> insertData(ProductModel productModel) async {
    Database? db = await database;

    await db!.insert(tableName, {
      id: productModel.id,
      name: productModel.name,
      weight: productModel.weight,
      price: productModel.price,
      isFavourite: productModel.isFavourite,
      isDaily: productModel.isDaily,
      description: productModel.description,
      rating: productModel.rating,
      category: productModel.category,
      relatedImages: jsonEncode(productModel.relatedImages),
      image: productModel.image,
      quantity: productModel.quantity
    });
  }

  Future<List<ProductModel>> readData() async {
    Database? db = await database;

    final data = await db!.query(tableName);
    List<ProductModel> finalData = data
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();

    return finalData;
  }

  Future<List<ProductModel>> readFavouriteProductData() async {
    Database? db = await database;

    final data = await db!.query(
      tableName,
      where: 'isFavourite = 1',
    );
    List<ProductModel> finalData = data
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();

    return finalData;
  }

  Future updateProduct(int id, Map<String, Object?> model) async {
    Database? db = await database;

    await db!.update(tableName, model, where: 'id = ?', whereArgs: [id]);

    print("LIST UPDATED SUCCESSFULLY...");
  }

  Future fetchCartProductsData() async {
    Database? db = await database;

    final data = await db!.rawQuery('''
    SELECT 
      id,
      name,
      price,
      quantity,
      isDaily,
      image,
      TRIM(SUBSTR(weight, 1, INSTR(weight, ' ') - 1)) AS weightValue,
      TRIM(SUBSTR(weight, INSTR(weight, ' ') + 1)) AS weightUnit
    FROM ProductTable 
    WHERE quantity > 0;
    ''');

    List<CartWalletModel> finalData = [];
    for (int i = 0; i < data.length; i++) {
      finalData.add(CartWalletModel.fromJson(data[i]));

      finalData[i].date =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString();
      finalData[i].isExpense = 1;
    }

    print("CART WALLET DATA :: ${finalData.map(
      (e) => e.toJson(),
    )}");

    for (int i = 0; i < finalData.length; i++) {
      await db.insert(tableName5, finalData[i].toJson());
    }
  }

  Future setDefaultQuantityOfProducts() async {
    Database? db = await database;

    int rowsAffected = await db!
        .rawUpdate('UPDATE $tableName SET $quantity = 0 WHERE $quantity > 0');

    print("ROWS UPDATED IN DATABASE :::: $rowsAffected");
  }

  Future<void> insertPlansData() async {
    Database? db = await database;

    for (var item in AppLists().allRechargePlansList) {
      await db!.insert(tableName1, item);
    }
  }

  Future<List<Map<String, dynamic>>> fetchPlansData(
      {required String companyValue, required String planValue}) async {
    Database? db = await database;

    final plans = await db!.query(tableName1,
        where: '$company = ? AND $category = ?',
        whereArgs: [companyValue, planValue]);

    List<Map<String, dynamic>> finalData = plans;
    return finalData;
  }

  Future<void> insertGasData() async {
    Database? db = await database;
    for (var item in AppLists().gasBookingData) {
      await db!.insert(tableName2, item);
    }

    for (var item in AppLists().payGasBillData) {
      await db!.insert(tableName3, item);
    }
  }

  Future<List<Map<String, dynamic>>> fetchGasProviderData() async {
    Database? db = await database;
    final data =
        await db!.rawQuery('SELECT * from GasBooking GROUP BY gasProviderName');

    print(data);
    List<Map<String, dynamic>> myData = data;
    return myData;
  }

  Future<List<Map<String, dynamic>>> fetchGasBookingData(
      {required String company, required String mobile}) async {
    Database? db = await database;
    List<Map<String, dynamic>> data = await db!.query(tableName2,
        where: '$gasProviderName = ? AND $registeredMobile = ?',
        whereArgs: [company, mobile]);
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchGasProviderDetails(
      {required String operator, required String mobile}) async {
    Database? db = await database;

    final data = await db!.rawQuery(
        'SELECT p.* from payGasBill p, GasBooking g where g.registeredMobile = p.registeredMobile AND g.gasProviderName = ? AND g.registeredMobile = ?',
        [operator, mobile]);

    return data;
  }

  Future<List<Map<String, dynamic>>> fetchPayCustomerDetails(
      {required String customerId, required String provider}) async {
    Database? db = await database;

    final data = await db!.rawQuery(
        'SELECT * from payGasBill where customerId = ? AND gasProviderName = ? ',
        [customerId, provider]);

    return data;
  }

  Future<void> insertElectricityData() async {
    Database? db = await database;

    for (int i = 0; i < AppLists().electricityBillData.length; i++) {
      await db!.insert(tableName4, AppLists().electricityBillData[i]);
    }
  }

  Future<List<Map<String, dynamic>>> fetchElectricityData() async {
    Database? db = await database;

    final data = db!.rawQuery(
        'SELECT DISTINCT(electricityProvider),image from Electricity');

    return data;
  }

  Future<List<Map<String, dynamic>>> fetchElectricityDetails(
      {required String state,
      required String provider,
      required String number}) async {
    Database? db = await database;

    final data = await db!.query(tableName4,
        where: 'state = ? AND electricityProvider = ? AND customerNo = ?',
        whereArgs: [state, provider, number]);

    return data;
  }

  Future insertWalletData({required CartWalletModel model}) async {
    Database? db = await database;

    await db!.insert(tableName5, model.toJson());
  }

  Future<List<CartWalletModel>> fetchWalletData(
      {required String start, required String end}) async {
    Database? db = await database;

    final data = await db!.query(tableName5,
        where: '$incomeExpenseDate BETWEEN ? AND ?', whereArgs: [start, end]);

    List<CartWalletModel> finalData = [];

    for (int i = 0; i < data.length; i++) {
      finalData.add(CartWalletModel.fromJson(data[i]));
    }

    return finalData;
  }

  Future<List<CartWalletModel>> fetchHomeScreenTableData(
      {required String firstDate, required String lastDate}) async {
    Database? db = await database;

    try {
      final data = await db!.rawQuery(
          "SELECT name,id,price,date,SUM(weightValue) as weightValue,weightUnit,isExpense,isIncome,quantity,image,isDaily from IncomeExpense WHERE (date BETWEEN ? AND ?) OR (date < ? AND isDaily = 1) GROUP BY name",
          [firstDate, lastDate, firstDate]);

      List<CartWalletModel> finalData = [];

      for (int i = 0; i < data.length; i++) {
        Map<String, dynamic> rawData = Map<String, dynamic>.from(data[i]);
        rawData["weightValue"] = rawData["weightValue"].toString();
        finalData.add(CartWalletModel.fromJson(rawData));
      }

      for (int i = 0; i < finalData.length; i++) {
        if (finalData[i].isExpense == 1) {
          double value = double.parse(finalData[i].weightValue) *
              int.parse(finalData[i].quantity);
          if (finalData[i].weightUnit == "gm" && value >= 1000) {
            finalData[i].weightUnit = "kg";
            double weight = value / 1000;
            String weightVal = weight.toString();
            finalData[i].weightValue = weightVal;
          } else if (finalData[i].weightUnit == "ml" && value >= 1000) {
            finalData[i].weightUnit = "litre";
            double weight = value / 1000;
            String weightVal = weight.toString();
            finalData[i].weightValue = weightVal;
          } else if (finalData[i].weightUnit == "ml" && value < 1000) {
            finalData[i].weightUnit = "litre";
            double weight = value / 1000;
            String weightVal = weight.toString();
            finalData[i].weightValue = weightVal;
          } else {
            finalData[i].weightValue = value.toString();
          }
        }
      }

      for (int i = 0; i < finalData.length; i++) {
        String weightValue = finalData[i].weightValue.substring(
            finalData[i].weightValue.length - 2,
            finalData[i].weightValue.length);
        print("WEIGHT VALUE :::: $weightValue");

        if (weightValue == ".0") {
          finalData[i].weightValue = finalData[i]
              .weightValue
              .substring(0, finalData[i].weightValue.length - 2);
        }
      }

      Map<String, List<CartWalletModel>> duplicateList = {};

      for (var item in finalData) {
        duplicateList.putIfAbsent(item.name, () => []);
        duplicateList[item.name]!.add(item); // Always add the item
      }

      print("DUPLICATE LIST :::: ${duplicateList.values.map(
        (e) => e.toList().map(
              (e) => e.toJson(),
            ),
      )}");

      List<List<CartWalletModel>> duplicates = duplicateList.values
          .where(
            (element) => element.length > 1,
          )
          .toList();

      print("Duplicates ::: ${duplicates.map(
        (e) => e.toList().map(
              (e) => e.toJson(),
            ),
      )}");

      return finalData;
    } catch (e) {
      print("ERROR FROM DATABASE $e");
      return [];
    }
  }

  Future<List<CartWalletModel>> fetchHomeScreenTableFutureDailyData(
      {required String firstDate}) async {
    Database? db = await database;

    try {
      final data = await db!.rawQuery(
          "SELECT name,id,price,date,SUM(weightValue) as weightValue,weightUnit,isExpense,isIncome,quantity,image,isDaily from IncomeExpense WHERE date < ? AND isDaily = 1 GROUP BY name",
          [firstDate]);

      List<CartWalletModel> finalData = [];

      for (int i = 0; i < data.length; i++) {
        Map<String, dynamic> rawData = Map<String, dynamic>.from(data[i]);
        rawData["weightValue"] = rawData["weightValue"].toString();
        finalData.add(CartWalletModel.fromJson(rawData));
      }

      for (int i = 0; i < finalData.length; i++) {
        double value = double.parse(finalData[i].weightValue) *
            int.parse(finalData[i].quantity);
        if (finalData[i].isExpense == 1) {
          if (finalData[i].weightUnit == "gm" && value >= 1000) {
            finalData[i].weightUnit = "kg";
            double weight = value / 1000;
            String weightVal = weight.toString();
            finalData[i].weightValue = weightVal;
          } else if (finalData[i].weightUnit == "ml" && value >= 1000) {
            finalData[i].weightUnit = "litre";
            double weight = value / 1000;
            String weightVal = weight.toString();
            finalData[i].weightValue = weightVal;
          } else if (finalData[i].weightUnit == "ml" && value < 1000) {
            finalData[i].weightUnit = "litre";
            double weight = value / 1000;
            String weightVal = weight.toString();
            finalData[i].weightValue = weightVal;
          } else {
            finalData[i].weightValue = value.toString();
          }
        }
      }

      for (int i = 0; i < finalData.length; i++) {
        String weightValue = finalData[i].weightValue.substring(
            finalData[i].weightValue.length - 2,
            finalData[i].weightValue.length);
        print("WEIGHT VALUE :::: $weightValue");

        if (weightValue == ".0") {
          finalData[i].weightValue = finalData[i]
              .weightValue
              .substring(0, finalData[i].weightValue.length - 2);
        }
      }

      return finalData;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<CartWalletModel>> fetchFutureWalletData(
      {required String date}) async {
    Database? db = await database;

    final data = await db!.query(tableName5,
        where: '$incomeExpenseDate < ? AND $isDaily = 1', whereArgs: [date]);
    List<CartWalletModel> finalData = [];

    for (int i = 0; i < data.length; i++) {
      finalData.add(CartWalletModel.fromJson(data[i]));
    }

    return finalData;
  }

  Future<String> fetchTotalBalanceData() async {
    Database? db = await database;

    final data = await db!.query(tableName5);

    List<CartWalletModel> finalData = [];

    finalData.addAll(data.map(
      (e) => CartWalletModel.fromJson(e),
    ));

    double _expense = 0.0;
    double _income = 0.0;
    for (int i = 0; i < finalData.length; i++) {
      double price = double.parse(
          finalData[i].price.substring(1, finalData[i].price.length));
      print(price);

      if (finalData[i].isExpense == 1) {
        int quantity = int.parse(finalData[i].quantity);
        if (quantity == 1) {
          finalData[i].price = price.toString();
        } else {
          double finalPrice = price * quantity;
          finalData[i].price = finalPrice.toString();
          price = double.parse(finalData[i].price);
        }
      }

      if (finalData[i].isExpense == 1) {
        _expense += price;
      } else if (finalData[i].isIncome == 1) {
        _income += price;
      }

      print(finalData[i].toJson());
    }

    double total = _income - _expense;
    print("TOTAL ::: $total");

    print("EXPENSES TOTAL : $_expense");
    print("INCOMES TOTAL : $_income");

    return total.toString();
  }

  Future<List<ProductModel>> fetchDailyProductsData() async {
    Database? db = await database;
    List<ProductModel> productList = [];

    final data = await db!.query(tableName6);

    productList = data
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();

    return productList;
  }

  Future insertDailyProductData({required int id}) async {
    Database? db = await database;

    final data = await db!.query(tableName, where: 'id = ?', whereArgs: [id]);

    List<Map<String, dynamic>> userData = data
        .map(
          (e) => e,
        )
        .toList();

    await db.insert(tableName6, userData[0]);

    print("Data inserted to the Daily Products Table");
  }
}

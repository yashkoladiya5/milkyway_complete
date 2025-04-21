import 'dart:convert';
import 'dart:io';

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
            'CREATE TABLE $tableName5($incomeExpenseName TEXT,$incomeExpensePrice TEXT,$incomeExpenseDate DATE,$isExpense INTEGER NOT NULL DEFAULT 0,$isIncome INTEGER NOT NULL DEFAULT 0)');
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
}

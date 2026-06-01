import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:milkyway/services/backend_api.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<String> _currentUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPreferenceKeys.userIdKey) ?? '';
  }

  DateTime? _safeParseDate(String value) {
    if (value.trim().isEmpty) {
      return null;
    }

    final normalized = value.replaceFirst(' ', 'T');
    return DateTime.tryParse(normalized);
  }

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
    String tableName = DatabaseProductTableStrings.tableName;
    String tableName5 = DatabaseIncomeExpenseTableStrings.tableName;
    await db!.execute(
        'CREATE TABLE IF NOT EXISTS $tableName ($id INTEGER,$name TEXT,$weight TEXT,$price TEXT,$isFavourite INTEGER,$isDaily INTEGER,$description TEXT,$rating TEXT,$category TEXT,$relatedImages TEXT,$image TEXT,$quantity TEXT)');

    await db.execute(
        'CREATE TABLE IF NOT EXISTS $tableName5($id INTEGER,$incomeExpenseName TEXT,$incomeExpensePrice TEXT,$incomeExpenseDate DATE,$weightValue TEXT,$weightUnit TEXT, $isExpense INTEGER NOT NULL DEFAULT 0,$isIncome INTEGER NOT NULL DEFAULT 0,$quantity1 TEXT,$image TEXT,$isDaily int)');

    print("DB CLASS TABLE NAME ::: ${tableName}");
    await db.insert(tableName, {
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
    print("DB_HELPER [readData]: started");
    final userId = await _currentUserId();
    print("DB_HELPER [readData]: userId = '$userId'");
    if (userId.isEmpty) {
      print("DB_HELPER [readData]: returning empty list because userId is empty");
      return [];
    }

    try {
      final response = await BackendApi.getJson(
        '/products',
        queryParameters: {'userId': userId},
      );
      final products = (response['products'] as List<dynamic>? ?? const [])
          .cast<Map<String, dynamic>>();
      print("DB_HELPER [readData]: successfully fetched ${products.length} products raw maps");
      final list = products.map(ProductModel.fromJson).toList();
      print("DB_HELPER [readData]: successfully parsed ${list.length} ProductModel objects");
      return list;
    } catch (e) {
      print("DB_HELPER [readData] ERROR: $e");
      rethrow;
    }
  }

  Future<List<ProductModel>> readFavouriteProductData() async {
    print("DB_HELPER [readFavouriteProductData]: started");
    final userId = await _currentUserId();
    print("DB_HELPER [readFavouriteProductData]: userId = '$userId'");
    if (userId.isEmpty) {
      print("DB_HELPER [readFavouriteProductData]: returning empty list because userId is empty");
      return [];
    }

    try {
      final response = await BackendApi.getJson(
        '/products',
        queryParameters: {'userId': userId, 'favourite': '1'},
      );
      final products = (response['products'] as List<dynamic>? ?? const [])
          .cast<Map<String, dynamic>>();
      print("DB_HELPER [readFavouriteProductData]: successfully fetched ${products.length} products raw maps");
      final list = products.map(ProductModel.fromJson).toList();
      print("DB_HELPER [readFavouriteProductData]: successfully parsed ${list.length} ProductModel objects");
      return list;
    } catch (e) {
      print("DB_HELPER [readFavouriteProductData] ERROR: $e");
      rethrow;
    }
  }

  Future updateProduct(int id, Map<String, Object?> model) async {
    print("DB_HELPER [updateProduct]: started for id = $id, payload: $model");
    final userId = await _currentUserId();
    print("DB_HELPER [updateProduct]: userId = '$userId'");
    if (userId.isNotEmpty) {
      try {
        final response = await BackendApi.patchJson(
          '/products/$id',
          body: model,
          queryParameters: {'userId': userId},
        );
        print("DB_HELPER [updateProduct]: response from patch: $response");
      } catch (e) {
        print("DB_HELPER [updateProduct] ERROR: $e");
        rethrow;
      }
    } else {
      print("DB_HELPER [updateProduct]: skipped because userId is empty");
    }

    print("LIST UPDATED SUCCESSFULLY...");
  }

  Future fetchCartProductsData() async {
    final products = await readData();
    final now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    for (final product in products) {
      final qty = int.tryParse(product.quantity ?? '') ?? 0;
      if (qty <= 0) {
        continue;
      }

      final parts = (product.weight ?? '').trim().split(RegExp(r'\s+'));
      final weightVal = parts.isNotEmpty ? parts.first : '';
      final unit = parts.length > 1 ? parts.sublist(1).join(' ') : '';

      await insertWalletData(
        model: CartWalletModel(
          id: product.id ?? 0,
          name: product.name ?? '',
          price: product.price ?? '',
          quantity: product.quantity ?? '',
          image: product.image ?? '',
          weightValue: weightVal,
          weightUnit: unit,
          date: now,
          isIncome: 0,
          isExpense: 1,
          isDaily: product.isDaily ?? 0,
        ),
      );
    }
  }

  Future setDefaultQuantityOfProducts() async {
    final products = await readData();
    for (final product in products) {
      final qty = int.tryParse(product.quantity ?? '') ?? 0;
      if (qty > 0) {
        await updateProduct(product.id ?? 0, {'quantity': '0'});
      }
    }
  }

  Future<void> insertPlansData() async {}

  Future<List<Map<String, dynamic>>> fetchPlansData(
      {required String companyValue, required String planValue}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/recharge-plans',
      queryParameters: {
        'userId': userId,
        'company': companyValue,
        'category': planValue,
      },
    );
    final plans = (response['plans'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return plans;
  }

  Future<void> insertGasData() async {}

  Future<List<Map<String, dynamic>>> fetchGasProviderData() async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/gas/providers',
      queryParameters: {'userId': userId},
    );
    final providers = (response['providers'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return providers;
  }

  Future<List<Map<String, dynamic>>> fetchGasBookingData(
      {required String company, required String mobile}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/gas/bookings',
      queryParameters: {
        'userId': userId,
        'provider': company,
        'mobile': mobile,
      },
    );
    final bookings = (response['bookings'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return bookings;
  }

  Future<List<Map<String, dynamic>>> fetchGasProviderDetails(
      {required String operator, required String mobile}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/gas/pay-bills',
      queryParameters: {
        'userId': userId,
        'provider': operator,
      },
    );
    final bills = (response['bills'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return bills.where((b) => b['registeredMobile'] == mobile).toList();
  }

  Future<List<Map<String, dynamic>>> fetchPayCustomerDetails(
      {required String customerId, required String provider}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/gas/pay-bills',
      queryParameters: {
        'userId': userId,
        'customerId': customerId,
        'provider': provider,
      },
    );
    final bills = (response['bills'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return bills;
  }

  Future<void> insertElectricityData() async {}

  Future<List<Map<String, dynamic>>> fetchElectricityData() async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/electricity/providers',
      queryParameters: {'userId': userId},
    );
    final providers = (response['providers'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return providers;
  }

  Future<List<Map<String, dynamic>>> fetchElectricityDetails(
      {required String state,
      required String provider,
      required String number}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }
    final response = await BackendApi.getJson(
      '/electricity/bills',
      queryParameters: {
        'userId': userId,
        'state': state,
        'provider': provider,
        'number': number,
      },
    );
    final bills = (response['bills'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return bills;
  }

  Future<int> updatePayGasBill({
    required String customerId,
    required String provider,
    required double amount,
  }) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return 0;
    }
    final bills = await fetchPayCustomerDetails(customerId: customerId, provider: provider);
    if (bills.isEmpty) {
      return 0;
    }
    final billId = bills.first['_id'] ?? bills.first['id'];
    if (billId == null) {
      return 0;
    }
    final response = await BackendApi.patchJson(
      '/gas/pay-bills/$billId',
      queryParameters: {'userId': userId},
      body: {'billAmountRemain': amount},
    );
    return response['success'] == true ? 1 : 0;
  }

  Future<int> updateGasBooking({
    required String mobile,
    required String provider,
    required String status,
  }) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return 0;
    }
    final bookings = await fetchGasBookingData(company: provider, mobile: mobile);
    if (bookings.isEmpty) {
      return 0;
    }
    final bookingId = bookings.first['_id'] ?? bookings.first['id'];
    if (bookingId == null) {
      return 0;
    }
    final response = await BackendApi.patchJson(
      '/gas/bookings/$bookingId',
      queryParameters: {'userId': userId},
      body: {'paymentStatus': status},
    );
    return response['success'] == true ? 1 : 0;
  }

  Future<int> updateElectricityBill({
    required String customerNo,
    required String provider,
    required String state,
    required double amount,
  }) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return 0;
    }
    final bills = await fetchElectricityDetails(state: state, provider: provider, number: customerNo);
    if (bills.isEmpty) {
      return 0;
    }
    final billId = bills.first['_id'] ?? bills.first['id'];
    if (billId == null) {
      return 0;
    }
    final response = await BackendApi.patchJson(
      '/electricity/bills/$billId',
      queryParameters: {'userId': userId},
      body: {'amount': amount},
    );
    return response['success'] == true ? 1 : 0;
  }

  Future insertWalletData({required CartWalletModel model}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return;
    }

    await BackendApi.postJson(
      '/wallet/entries',
      body: {
        ...model.toJson(),
        'userId': userId,
      },
    );
  }

  Future<List<CartWalletModel>> fetchWalletData(
      {required String start, required String end}) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }

    final response = await BackendApi.getJson(
      '/wallet/entries',
      queryParameters: {'userId': userId, 'start': start, 'end': end},
    );
    final entries = (response['entries'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return entries.map(CartWalletModel.fromJson).toList();
  }

  Future<List<CartWalletModel>> fetchHomeScreenTableData(
      {required String firstDate, required String lastDate}) async {
    try {
      final userId = await _currentUserId();
      if (userId.isEmpty) {
        return [];
      }

      final response = await BackendApi.getJson(
        '/wallet/entries',
        queryParameters: {
          'userId': userId,
          'start': '2000-01-01 00:00:00',
          'end': lastDate,
        },
      );

      final entries = (response['entries'] as List<dynamic>? ?? const [])
          .cast<Map<String, dynamic>>()
          .map(CartWalletModel.fromJson)
          .toList();

      final start = _safeParseDate(firstDate);
      final end = _safeParseDate(lastDate);
      if (start == null || end == null) {
        return [];
      }

      final source = entries.where((entry) {
        final entryDate = _safeParseDate(entry.date);
        if (entryDate == null) {
          return false;
        }

        final inRange = !entryDate.isBefore(start) && !entryDate.isAfter(end);
        final isOlderDaily = entryDate.isBefore(start) && entry.isDaily == 1;
        return inRange || isOlderDaily;
      }).toList();

      final Map<String, CartWalletModel> grouped = {};
      for (final item in source) {
        final existing = grouped[item.name];
        if (existing == null) {
          grouped[item.name] = item;
          continue;
        }

        final currentWeight = double.tryParse(existing.weightValue) ?? 0;
        final newWeight = double.tryParse(item.weightValue) ?? 0;
        existing.weightValue = (currentWeight + newWeight).toString();
      }

      List<CartWalletModel> finalData = grouped.values.toList();

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
    try {
      final userId = await _currentUserId();
      if (userId.isEmpty) {
        return [];
      }

      final response = await BackendApi.getJson(
        '/wallet/entries',
        queryParameters: {
          'userId': userId,
          'start': '2000-01-01 00:00:00',
          'end': firstDate,
        },
      );

      final start = _safeParseDate(firstDate);
      if (start == null) {
        return [];
      }

      final source = (response['entries'] as List<dynamic>? ?? const [])
          .cast<Map<String, dynamic>>()
          .map(CartWalletModel.fromJson)
          .where((entry) {
        final entryDate = _safeParseDate(entry.date);
        return entryDate != null && entryDate.isBefore(start) && entry.isDaily == 1;
      }).toList();

      final Map<String, CartWalletModel> grouped = {};
      for (final item in source) {
        final existing = grouped[item.name];
        if (existing == null) {
          grouped[item.name] = item;
          continue;
        }

        final currentWeight = double.tryParse(existing.weightValue) ?? 0;
        final newWeight = double.tryParse(item.weightValue) ?? 0;
        existing.weightValue = (currentWeight + newWeight).toString();
      }

      List<CartWalletModel> finalData = grouped.values.toList();

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
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }

    final response = await BackendApi.getJson(
      '/wallet/entries',
      queryParameters: {
        'userId': userId,
        'start': '2000-01-01 00:00:00',
        'end': date,
      },
    );

    final boundary = _safeParseDate(date);
    if (boundary == null) {
      return [];
    }

    return (response['entries'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>()
        .map(CartWalletModel.fromJson)
        .where((entry) {
      final entryDate = _safeParseDate(entry.date);
      return entryDate != null && entryDate.isBefore(boundary) && entry.isDaily == 1;
    }).toList();
  }

  Future<String> fetchTotalBalanceData() async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return '0.00';
    }

    final response = await BackendApi.getJson(
      '/wallet/summary',
      queryParameters: {'userId': userId},
    );
    final balance = response['balance'];
    return balance is num ? balance.toString() : '0.00';
  }

  Future<List<ProductModel>> fetchDailyProductsData() async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return [];
    }

    final response = await BackendApi.getJson(
      '/daily-products',
      queryParameters: {'userId': userId},
    );
    final products = (response['products'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    return products.map(ProductModel.fromJson).toList();
  }

  Future insertDailyProductData({required int id}) async {
    final products = await fetchDailyProductsData();
    final existingIds = products.map((e) => e.id).whereType<int>().toSet();
    existingIds.add(id);
    await syncDailyProductIds(existingIds.toList());
  }

  Future<void> syncDailyProductIds(List<int> ids) async {
    final userId = await _currentUserId();
    if (userId.isEmpty) {
      return;
    }

    await BackendApi.postJson(
      '/daily-products',
      body: {
        'userId': userId,
        'productIds': ids,
      },
    );
  }
}

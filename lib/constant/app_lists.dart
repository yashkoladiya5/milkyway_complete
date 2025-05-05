import 'package:milkyway/home/model/categories_model.dart';
import 'package:milkyway/home/model/product_model.dart';

import 'app_strings.dart';

class AppLists {
  static List<String> states = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",

    "Alberta",
    "British Columbia",
    "Manitoba",
    "New Brunswick",
    "Newfoundland and Labrador",
    "Nova Scotia",
    "Ontario",
    "Prince Edward Island",
    "Quebec",
    "Saskatchewan",

    // India
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  List<String> months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

  List<String> imagePathList = [
    "assets/images/Home/home_light_theme/top-10-dairy-companies-in-the-world 1.png",
    "assets/images/Home/home_light_theme/Frame 2.png",
    "assets/images/Home/home_light_theme/top-10-dairy-companies-in-the-world 1.png"
  ];

  final List<CategoriesModel> categoriesList = [
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_1_categories.png",
        title: "Desserts & Sweets"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_2_categories.png",
        title: "Dairy Product"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_3_categories.png",
        title: "Cooking Essentials"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_4_categories.png",
        title: "Party Supplies"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_5_categories.png",
        title: "Meat & Seafood"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_6_categories.png",
        title: "Snacks"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_7_categories.png",
        title: "Personal Care"),
    CategoriesModel(
        image: "assets/images/Home/home_light_theme/image_8_categories.png",
        title: "Household Cleaning"),
  ];

  static List<String> offerPercentageList = [
    "10% - 20%",
    "15% - 25%",
    "20% - 30%"
  ];

  static List<String> offerCategoryList = [
    "From 1000.00 shopping",
    "From 1500.00 shopping",
    "From 2000.00 shopping"
  ];

  List<Map<String, dynamic>> profileOptionLightList = [
    {
      "name": "Theme",
      "image":
          "assets/images/profile/light/8674513_ic_fluent_color_regular_icon 1.png"
    },
    {
      "name": "Edit Profile",
      "image":
          "assets/images/profile/light/5402373_write_modify_tool_edit_pen_icon 1.png"
    },
    {
      "name": "Change Password",
      "image": "assets/images/profile/light/185088_lock_locker_icon 2 1.png"
    },
    {
      "name": "Location",
      "image":
          "assets/images/profile/light/8324266_ui_essential_app_location_map_icon 1.png"
    },
    {
      "name": "Order History",
      "image":
          "assets/images/profile/light/3209355_document_edit_note_review_writing_icon 1.png"
    },
    {
      "name": "Favorite",
      "image":
          "assets/images/profile/light/1814104_favorite_heart_like_love_icon 1.png"
    },
    {
      "name": "Language",
      "image":
          "assets/images/profile/light/646196_earth_global_globe_internet_network_icon 1.png"
    },
    {
      "name": "Connect with us",
      "image": "assets/images/profile/light/whatsapp_black_24dp 1.png"
    },
    {
      "name": "Terms & Condition",
      "image":
          "assets/images/profile/light/3209355_document_edit_note_review_writing_icon 1.png"
    },
    {
      "name": "Privacy Policy",
      "image":
          "assets/images/profile/light/4280489_outlined_shield_secure_security_icon 1.png"
    },
    {
      "name": "Cancellation policy",
      "image": "assets/images/profile/light/226567_no_icon 1.png"
    },
    {
      "name": "Share us",
      "image":
          "assets/images/profile/light/1814118_graph_network_share_social_icon 1.png"
    },
    {
      "name": "FAQ’s",
      "image":
          "assets/images/profile/light/6318082_about_faq_help_question_icon 1.png"
    },
    {
      "name": "Log Out",
      "image":
          "assets/images/profile/light/3403739_log out_off_out_power_shutdown_icon 1.png"
    },
  ];

  List<Map<String, dynamic>> profileOptionDarkList = [
    {
      "name": "Theme",
      "image":
          "assets/images/profile/dark/8674513_ic_fluent_color_regular_icon 1 (1).png"
    },
    {
      "name": "Edit Profile",
      "image":
          "assets/images/profile/dark/5402373_write_modify_tool_edit_pen_icon 1.png"
    },
    {
      "name": "Change Password",
      "image": "assets/images/profile/dark/185088_lock_locker_icon 2 1.png"
    },
    {
      "name": "Location",
      "image":
          "assets/images/profile/dark/8324266_ui_essential_app_location_map_icon 1.png"
    },
    {
      "name": "Order History",
      "image":
          "assets/images/profile/dark/3209355_document_edit_note_review_writing_icon 1.png"
    },
    {
      "name": "Favorite",
      "image":
          "assets/images/profile/dark/1814104_favorite_heart_like_love_icon 1.png"
    },
    {
      "name": "Language",
      "image":
          "assets/images/profile/dark/646196_earth_global_globe_internet_network_icon 1.png"
    },
    {
      "name": "Connect with us",
      "image": "assets/images/profile/dark/whatsapp_black_24dp 1.png"
    },
    {
      "name": "Terms & Condition",
      "image":
          "assets/images/profile/dark/3209355_document_edit_note_review_writing_icon 1.png"
    },
    {
      "name": "Privacy policy",
      "image":
          "assets/images/profile/dark/4280489_outlined_shield_secure_security_icon 1.png"
    },
    {
      "name": "Cancellation policy",
      "image": "assets/images/profile/dark/226567_no_icon 1.png"
    },
    {
      "name": "Share us",
      "image":
          "assets/images/profile/dark/1814118_graph_network_share_social_icon 1.png"
    },
    {
      "name": "FAQ’s",
      "image":
          "assets/images/profile/dark/6318082_about_faq_help_question_icon 1.png"
    },
    {
      "name": "Log Out",
      "image":
          "assets/images/profile/dark/3403739_log out_off_out_power_shutdown_icon 1.png"
    },
  ];

  List<String> faqTitleList = [
    AppStrings.faq1Title,
    AppStrings.faq2Title,
    AppStrings.faq3Title,
    AppStrings.faq4Title,
    AppStrings.faq5Title,
  ];

  List<String> faqDescriptionList = [
    AppStrings.faq1Answer,
    AppStrings.faq2Answer,
    AppStrings.faq3Answer,
    AppStrings.faq4Answer,
    AppStrings.faq5Answer,
  ];

  static List<String> balanceList = [
    "100.00",
    "200.00",
    "300.00",
    "400.00",
    "500.00",
  ];

  static List<String> autoPayList = [
    "1000.00 Auto Pay",
    "1500.00 Auto Pay",
    "2000.00 Auto Pay",
    "2500.00 Auto Pay",
    "3000.00 Auto Pay",
  ];

  static List<String> upiBalanceList = [
    "500",
    "1000",
    "1500",
    "1800",
    "2000",
    "3000",
  ];

  static List<String> paymentOptionNames = [
    "UPI",
    "Credit Card",
    "Debit Card",
    "Cash On Delivery"
  ];

  // List<Map<String, String>> favouriteProductsList = [
  //   {
  //     "image": "assets/images/Home/home_light_theme/fav_list_1.png",
  //     "name": "Milk",
  //     "weight": "2 Litre",
  //     "price": "120.00₹"
  //   },
  //   {
  //     "image": "assets/images/Home/home_light_theme/fav_list_2.png",
  //     "name": "Ghee",
  //     "weight": "500 gm",
  //     "price": "700.00₹"
  //   },
  //   {
  //     "image": "assets/images/Home/home_light_theme/fav_list_3.png",
  //     "name": "Cheese",
  //     "weight": "500 gm",
  //     "price": "240.00₹"
  //   },
  //   {
  //     "image": "assets/images/Home/home_light_theme/fav_list_4.png",
  //     "name": "Cake",
  //     "weight": "500 gm",
  //     "price": "240.00₹"
  //   },
  // ];

  final List<String> groceries = [
    "Staples & Grains",
    "Fruits",
    "Vegetables",
    "Dairy Product",
    "Snacks",
    "Beverages",
    "Bakery",
    "Household Cleaning",
    "Personal Care",
    "Frozen & Ready-to-Eat",
    "Condiments & Spices",
    "Meat & Seafood",
    "Canned Goods",
    "Breakfast Items",
    "Desserts & Sweets",
    "Cooking Essentials",
    "Health Foods",
    "Baby Products",
    "Pet Supplies",
    "Party Supplies",
  ];

  List<String> dairyProducts = [
    "Milk",
    "Butter",
    "Cheese",
    "Yogurt",
    "Cream",
    "Ghee",
  ];

  List<String> billPayOptionsImageList = [
    "assets/images/bill_pay/light/3401854_essential_mobile_smartphone_web_icon 1.png",
    "assets/images/bill_pay/light/Untitled-1-01 1.png",
    "assets/images/bill_pay/light/6705019_abstract_bulb_creative_energy_idea_icon 1.png"
  ];

  List<String> billPayOptionsNameList = [
    "Mobile Recharge",
    "Gas Bill",
    "Electricity Bill"
  ];

  List<String> mobileRechargeOperatorList = ["Airtel", "BSNL", "Jio", "VI"];

  List<String> mobileRechargeStateList = [
    "Madhya Pradesh",
    "Gujarat",
    "Uttar Pradesh",
    "Maharashtra",
    "Tamil Nadu",
    "Keral",
    "Rajasthan"
  ];

  List<String> languageOptionsList = [
    "English(UK)",
    "Hindi",
    "Gujarati",
    "Marathi"
  ];

  List<String> rechargePlansCategoryList = [
    "Popular",
    "Annual Plans",
    "Cricket",
    "4G Data Voucher"
  ];

  List<Map<String, dynamic>> gasBookingData = [
    {
      "gasProviderName": "Gujarat Gas Limited",
      "registeredMobile": "9876543210",
      "cylinderPrice": 1150.50,
      "paymentStatus": "Paid",
      "dealerName": "Sharma Gas Agency",
      "image":
          "assets/images/bill_pay/light/Group 193.png" // Gujarat Gas Limited -> 193
    },
    {
      "gasProviderName": "Gujarat Gas Limited",
      "registeredMobile": "9876543211",
      "cylinderPrice": 1160.00,
      "paymentStatus": "Remain",
      "dealerName": "Hari Gas Centre",
      "image":
          "assets/images/bill_pay/light/Group 193.png" // Gujarat Gas Limited -> 193
    },
    {
      "gasProviderName": "Gujarat State Petronet Limited",
      "registeredMobile": "9876500001",
      "cylinderPrice": 1120.00,
      "paymentStatus": "Remain",
      "dealerName": "Bharat Flames",
      "image":
          "assets/images/bill_pay/light/Group 194.png" // Gujarat State Petronet Limited -> 194
    },
    {
      "gasProviderName": "Gujarat State Petronet Limited",
      "registeredMobile": "9876500002",
      "cylinderPrice": 1130.50,
      "paymentStatus": "Paid",
      "dealerName": "Patel Gas Traders",
      "image":
          "assets/images/bill_pay/light/Group 194.png" // Gujarat State Petronet Limited -> 194
    },
    {
      "gasProviderName": "Indian Oil Corporation Limited",
      "registeredMobile": "9876543211",
      "cylinderPrice": 1135.75,
      "paymentStatus": "Paid",
      "dealerName": "HP Fuel Services",
      "image":
          "assets/images/bill_pay/light/Group 195.png" // Indian Oil Corporation Limited -> 195
    },
    {
      "gasProviderName": "Indian Oil Corporation Limited",
      "registeredMobile": "9876543212",
      "cylinderPrice": 1142.50,
      "paymentStatus": "Remain",
      "dealerName": "IOC Connect",
      "image":
          "assets/images/bill_pay/light/Group 195.png" // Indian Oil Corporation Limited -> 195
    },
    {
      "gasProviderName": "Sabarmati Gas",
      "registeredMobile": "9876543213",
      "cylinderPrice": 1148.60,
      "paymentStatus": "Paid",
      "dealerName": "Sabarmati Flame House",
      "image":
          "assets/images/bill_pay/light/Group 196.png" // Sabarmati Gas -> 196
    },
    {
      "gasProviderName": "Sabarmati Gas",
      "registeredMobile": "9876543214",
      "cylinderPrice": 1155.30,
      "paymentStatus": "Remain",
      "dealerName": "Sabarmati Gas Agency",
      "image":
          "assets/images/bill_pay/light/Group 196.png" // Sabarmati Gas -> 196
    },
    {
      "gasProviderName": "Adani Total Gas Limited",
      "registeredMobile": "9876543215",
      "cylinderPrice": 1155.90,
      "paymentStatus": "Paid",
      "dealerName": "Adani Flame Traders",
      "image":
          "assets/images/bill_pay/light/Group 197.png" // Adani Total Gas Limited -> 197
    },
    {
      "gasProviderName": "Adani Total Gas Limited",
      "registeredMobile": "9876543216",
      "cylinderPrice": 1160.00,
      "paymentStatus": "Remain",
      "dealerName": "Total Gas Service",
      "image":
          "assets/images/bill_pay/light/Group 197.png" // Adani Total Gas Limited -> 197
    }
  ];

  List<Map<String, dynamic>> payGasBillData = [
    {
      "gasProviderName": "Gujarat Gas Limited",
      "customerId": "GGL001",
      "customerName": "Ravi Mehta",
      "registeredMobile": "9876543210",
      "billAmountRemain": 0.0, // Paid, so remain = 0
      "dealerName": "Sharma Gas Agency",
      "image": "assets/images/bill_pay/light/Group 193.png"
    },
    {
      "gasProviderName": "Gujarat Gas Limited",
      "customerId": "GGL002",
      "customerName": "Vishal Patel",
      "registeredMobile": "9876543211",
      "billAmountRemain": 1160.00, // Remain, so remain = cylinder price
      "dealerName": "Hari Gas Centre",
      "image": "assets/images/bill_pay/light/Group 193.png"
    },
    {
      "gasProviderName": "Gujarat State Petronet Limited",
      "customerId": "GSP001",
      "customerName": "Manish Kumar",
      "registeredMobile": "9876500001",
      "billAmountRemain": 1120.00, // Remain, so remain = cylinder price
      "dealerName": "Bharat Flames",
      "image": "assets/images/bill_pay/light/Group 194.png"
    },
    {
      "gasProviderName": "Gujarat State Petronet Limited",
      "customerId": "GSP002",
      "customerName": "Neha Gupta",
      "registeredMobile": "9876500002",
      "billAmountRemain": 0.0, // Paid, so remain = 0
      "dealerName": "Patel Gas Traders",
      "image": "assets/images/bill_pay/light/Group 194.png"
    },
    {
      "gasProviderName": "Indian Oil Corporation Limited",
      "customerId": "IOC001",
      "customerName": "Priya Shah",
      "registeredMobile": "9876543211",
      "billAmountRemain": 0.0, // Paid, so remain = 0
      "dealerName": "HP Fuel Services",
      "image": "assets/images/bill_pay/light/Group 195.png"
    },
    {
      "gasProviderName": "Indian Oil Corporation Limited",
      "customerId": "IOC002",
      "customerName": "Amit Verma",
      "registeredMobile": "9876543212",
      "billAmountRemain": 1142.50, // Remain, so remain = cylinder price
      "dealerName": "IOC Connect",
      "image": "assets/images/bill_pay/light/Group 195.png"
    },
    {
      "gasProviderName": "Sabarmati Gas",
      "customerId": "SGL001",
      "customerName": "Sanjay Desai",
      "registeredMobile": "9876543213",
      "billAmountRemain": 0.0, // Paid, so remain = 0
      "dealerName": "Sabarmati Flame House",
      "image": "assets/images/bill_pay/light/Group 196.png"
    },
    {
      "gasProviderName": "Sabarmati Gas",
      "customerId": "SGL002",
      "customerName": "Aarti Singh",
      "registeredMobile": "9876543214",
      "billAmountRemain": 1155.30, // Remain, so remain = cylinder price
      "dealerName": "Sabarmati Gas Agency",
      "image": "assets/images/bill_pay/light/Group 196.png"
    },
    {
      "gasProviderName": "Adani Total Gas Limited",
      "customerId": "ATG001",
      "customerName": "Rakesh Yadav",
      "registeredMobile": "9876543215",
      "billAmountRemain": 0.0, // Paid, so remain = 0
      "dealerName": "Adani Flame Traders",
      "image": "assets/images/bill_pay/light/Group 197.png"
    },
    {
      "gasProviderName": "Adani Total Gas Limited",
      "customerId": "ATG002",
      "customerName": "Meera Sharma",
      "registeredMobile": "9876543216",
      "billAmountRemain": 1160.00, // Remain, so remain = cylinder price
      "dealerName": "Total Gas Service",
      "image": "assets/images/bill_pay/light/Group 197.png"
    }
  ];

  List<Map<String, dynamic>> electricityBillData = [
    {
      "customerNo": "9876543210",
      "electricityProvider": "Dakshin Gujarat Vij Company Limited (DGVCL)",
      "image": "assets/images/bill_pay/light/Group 202.png",
      "dueDate": "10/11/2025",
      "amount": 1250.50,
      "state": "Gujarat",
      "name": "Rajesh Patel"
    },
    {
      "customerNo": "1234567890",
      "electricityProvider": "Torrent Power",
      "image": "assets/images/bill_pay/light/Group 203.png",
      "dueDate": "15/11/2025",
      "amount": 980.75,
      "state": "Maharashtra",
      "name": "Sanjay Deshmukh"
    },
    {
      "customerNo": "9871234560",
      "electricityProvider": "Madhya Gujarat Vij Company Limited (MGVCL)",
      "image": "assets/images/bill_pay/light/Group 204.png",
      "dueDate": "22/11/2025",
      "amount": 1120.00,
      "state": "Gujarat",
      "name": "Mehul Shah"
    },
    {
      "customerNo": "4567891230",
      "electricityProvider": "Uttar Gujarat Vij Company Limited (UGVCL)",
      "image": "assets/images/bill_pay/light/Group 205.png",
      "dueDate": "08/11/2025",
      "amount": 1345.25,
      "state": "Rajasthan",
      "name": "Ravi Choudhary"
    },
    {
      "customerNo": "3216549870",
      "electricityProvider": "Paschim Gujarat Vij Company Limited (PGVCL)",
      "image": "assets/images/bill_pay/light/Group 206.png",
      "dueDate": "05/11/2025",
      "amount": 900.40,
      "state": "Gujarat",
      "name": "Bhavesh Joshi"
    },
    {
      "customerNo": "7894561230",
      "electricityProvider": "Torrent Power",
      "image": "assets/images/bill_pay/light/Group 203.png",
      "dueDate": "30/11/2025",
      "amount": 1050.00,
      "state": "Tamil Nadu",
      "name": "Arjun Iyer"
    },
    {
      "customerNo": "6543217890",
      "electricityProvider": "Dakshin Gujarat Vij Company Limited (DGVCL)",
      "image": "assets/images/bill_pay/light/Group 202.png",
      "dueDate": "18/11/2025",
      "amount": 1185.60,
      "state": "Madhya Pradesh",
      "name": "Akash Verma"
    },
    {
      "customerNo": "7418529630",
      "electricityProvider": "Madhya Gujarat Vij Company Limited (MGVCL)",
      "image": "assets/images/bill_pay/light/Group 204.png",
      "dueDate": "25/11/2025",
      "amount": 1299.90,
      "state": "Keral",
      "name": "Rahul Nair"
    },
    {
      "customerNo": "8529637410",
      "electricityProvider": "Paschim Gujarat Vij Company Limited (PGVCL)",
      "image": "assets/images/bill_pay/light/Group 206.png",
      "dueDate": "12/11/2025",
      "amount": 1450.75,
      "state": "Uttar Pradesh",
      "name": "Vivek Singh"
    },
    {
      "customerNo": "3692581470",
      "electricityProvider": "Uttar Gujarat Vij Company Limited (UGVCL)",
      "image": "assets/images/bill_pay/light/Group 205.png",
      "dueDate": "20/11/2025",
      "amount": 990.35,
      "state": "Gujarat",
      "name": "Kiran Patel"
    },
    {
      "customerNo": "9638527410",
      "electricityProvider": "Torrent Power",
      "image": "assets/images/bill_pay/light/Group 203.png",
      "dueDate": "28/11/2025",
      "amount": 875.00,
      "state": "Madhya Pradesh",
      "name": "Ankit Jain"
    },
    {
      "customerNo": "1472583690",
      "electricityProvider": "Dakshin Gujarat Vij Company Limited (DGVCL)",
      "image": "assets/images/bill_pay/light/Group 202.png",
      "dueDate": "16/11/2025",
      "amount": 1195.20,
      "state": "Tamil Nadu",
      "name": "Hari Narayanan"
    }
  ];

  List<Map<String, dynamic>> allRechargePlansList = [
    {
      "company": "Jio",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription":
          "Complimentary subscription to JioTV, JioCinema, JioCloud",
      "offer": "20% upto ₹200 Cashback from Jiomart",
      "price": "₹299",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription":
          "Complimentary subscription to JioTV, JioCinema, JioSecurity",
      "offer": "₹50 discount on first recharge via MyJio App",
      "price": "₹239",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription":
          "Complimentary subscription to JioTV, JioCinema, JioCloud",
      "offer": "Free 6 GB additional data coupon",
      "price": "₹719",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "Complimentary subscription to JioTV, JioCinema",
      "offer": "₹25 cashback via Paytm wallet",
      "price": "₹666",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "Complimentary subscription to JioTV, JioCinema",
      "offer": "Extra 6 GB data with JioSaavn Pro subscription",
      "price": "₹349",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription":
          "Complimentary subscription to JioTV, JioCinema, JioCloud",
      "offer": "20% upto ₹100 Cashback from Jiomart",
      "price": "₹479",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "24 days",
      "subscription": "JioCinema and JioNews access",
      "offer": "No extra charges for roaming",
      "price": "₹209",
    },
    {
      "company": "Jio",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "Complimentary subscription to JioTV, JioCinema",
      "offer": "Free HelloTunes and JioNews",
      "price": "₹479",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription":
          "Complimentary subscription to JioTV, JioCinema, JioCloud",
      "offer": "20% upto ₹200 Cashback from Jiomart",
      "price": "₹2999",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Free access to JioSaavn, JioCinema, and JioNews",
      "offer": "Free 24 GB data coupon on recharge via MyJio",
      "price": "₹3199",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "JioTV, JioCinema, JioSecurity included",
      "offer": "₹100 Cashback via Paytm wallet",
      "price": "₹3999",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "336 days",
      "subscription": "Access to JioTV and JioCinema",
      "offer": "Free 12 GB data voucher",
      "price": "₹2545",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "Unlimited Data (FUP 2 GB/day)",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Complimentary Jio Apps + JioCloud 100 GB storage",
      "offer": "₹50 discount on JioMart shopping",
      "price": "₹3499",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "JioTV, JioCinema, JioNews",
      "offer": "20% cashback on UPI payments via Jio App",
      "price": "₹2099",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Free subscription to Jio Apps + caller tune feature",
      "offer": "Free ₹100 JioCinema coupon",
      "price": "₹2998",
    },
    {
      "company": "Jio",
      "category": "Annual Plans",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "360 days",
      "subscription": "JioCinema Premium (1 Year)",
      "offer": "20% off on Ajio orders above ₹999",
      "price": "₹3105",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "JioCinema Premium for IPL streaming",
      "offer": "Free Hotstar Mobile subscription (3 months)",
      "price": "₹749",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "51 days",
      "subscription": "JioCinema, JioTV",
      "offer": "₹50 cashback on recharge via MyJio App",
      "price": "₹749",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "JioCinema IPL Pack",
      "offer": "Free 6 GB additional data for match streaming",
      "price": "₹899",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "JioTV, JioCinema with sports add-on",
      "offer": "Chance to win IPL match tickets",
      "price": "₹1199",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "Unlimited (FUP 3 GB/day)",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "90 days",
      "subscription": "JioCinema Premium for full tournament access",
      "offer": "20% off on cricket merchandise via Jiomart",
      "price": "₹1499",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "1.5 GB/day + 10 GB extra",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "JioCinema + Fantasy Cricket Zone",
      "offer": "Free 1-month Sports pack access",
      "price": "₹799",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "JioCinema IPL Pass",
      "offer": "₹100 off on BookMyShow for match tickets",
      "price": "₹799",
    },
    {
      "company": "Jio",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "75 days",
      "subscription": "JioTV with Sports Booster",
      "offer": "Free digital collectibles from MyJio App",
      "price": "₹999",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "6 GB total",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "28 days",
      "subscription": "JioCinema, JioTV (data only usage)",
      "offer": "₹20 cashback on MyJio recharge",
      "price": "₹121",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "12 GB total",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "Unlimited (valid till base plan)",
      "subscription": "Data-only plan, ideal for streaming",
      "offer": "Free 1-day unlimited data voucher",
      "price": "₹181",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "2 GB/day",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "7 days",
      "subscription": "Access to JioCinema for 7 days",
      "offer": "₹10 instant discount via Paytm",
      "price": "₹151",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "20 GB total",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "30 days",
      "subscription": "High-speed internet booster",
      "offer": "Extra 2 GB on app recharge",
      "price": "₹241",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "1 GB/day",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "14 days",
      "subscription": "JioTV and JioCinema for mobile only",
      "offer": "Win ₹50 JioMart coupon",
      "price": "₹121",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "30 GB total",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "30 days",
      "subscription": "Ideal for work-from-home users",
      "offer": "Flat ₹30 discount via Amazon Pay",
      "price": "₹301",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "15 GB total",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "Unlimited (till base plan)",
      "subscription": "JioTV, JioCinema usable on extra data",
      "offer": "Double data weekend on Jio apps",
      "price": "₹151",
    },
    {
      "company": "Jio",
      "category": "4G Data Voucher",
      "data": "10 GB total",
      "voice": "No voice benefits",
      "sms": "No SMS benefits",
      "validity": "Unlimited (linked to base plan)",
      "subscription": "Only internet data",
      "offer": "Get free caller tune for 30 days",
      "price": "₹101",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "BSNL Tunes, BSNL Cinema Plus",
      "offer": "₹50 cashback on recharge via BSNL app",
      "price": "₹499",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "90 days",
      "subscription": "Zing Music and BSNL TV",
      "offer": "Free 5 GB extra data on app recharge",
      "price": "₹485",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "BSNL Cinema Plus (1 month)",
      "offer": "₹20 discount on recharges via Amazon Pay",
      "price": "₹247",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "Zing Music",
      "offer": "Free caller tune for 28 days",
      "price": "₹399",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "60 days",
      "subscription": "BSNL Cinema Plus",
      "offer": "10% cashback from Paytm",
      "price": "₹429",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "Unlimited (FUP 2 GB/day)",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "BSNL Tunes + Movies",
      "offer": "Free access to online courses (limited)",
      "price": "₹298",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "BSNL Cinema Plus + Music App",
      "offer": "25% off on next recharge",
      "price": "₹398",
    },
    {
      "company": "BSNL",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "70 days",
      "subscription": "BSNL TV & Music",
      "offer": "₹100 discount on BSNL broadband combo",
      "price": "₹429",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "BSNL Cinema Plus, BSNL Tunes",
      "offer": "₹200 cashback on first annual recharge",
      "price": "₹2399",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Zing Music + BSNL TV",
      "offer": "Free 20 GB bonus data",
      "price": "₹2299",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "BSNL Music & Movies pack",
      "offer": "Flat ₹250 off via BSNL Wallet",
      "price": "₹2899",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "BSNL Cinema Plus + Zing Premium",
      "offer": "Extra 30 days validity for limited time",
      "price": "₹2699",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "BSNL TV only",
      "offer": "Free BSNL caller tune for full year",
      "price": "₹1999",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "Unlimited Data (FUP: 2 GB/day)",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Cinema Plus + BSNL e-learning",
      "offer": "BSNL broadband combo 10% off",
      "price": "₹2499",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "BSNL Music Premium",
      "offer": "₹150 cashback from Paytm",
      "price": "₹2249",
    },
    {
      "company": "BSNL",
      "category": "Annual Plans",
      "data": "Unlimited (FUP 1 GB/day)",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "BSNL App Pack",
      "offer": "Loyalty bonus on next renewal",
      "price": "₹2099",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "BSNL Cricket Pack (Cricket Live Streaming)",
      "offer": "Free 30 days access to cricket content on BSNL app",
      "price": "₹249",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "Cricket data & sports live streaming",
      "offer": "Exclusive 10% off on recharges via BSNL app",
      "price": "₹419",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "BSNL Cricket Live Streaming",
      "offer": "Free 1-year subscription to Cricket Channel",
      "price": "₹699",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "BSNL App cricket streaming",
      "offer": "₹50 cashback on next recharge via BSNL app",
      "price": "₹289",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "BSNL Cricket Content (Match Highlights)",
      "offer": "Free 10 GB data after the first recharge",
      "price": "₹299",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "BSNL Cricket App & Live Scores",
      "offer": "Free access to match live commentary",
      "price": "₹399",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "BSNL Cricket Live Streaming and Highlights",
      "offer": "25% off on recharges via Paytm",
      "price": "₹349",
    },
    {
      "company": "BSNL",
      "category": "Cricket",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "90 days",
      "subscription": "BSNL Cricket Coverage (Live, Stats)",
      "offer": "Free 5 GB bonus data for cricket apps",
      "price": "₹749",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "10 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "₹100 cashback on recharge via BSNL app",
      "price": "₹99",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "20 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "Free 5 GB extra data on next recharge",
      "price": "₹149",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "30 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "10% cashback from Amazon Pay",
      "price": "₹199",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "50 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "₹50 off on next recharge via Paytm",
      "price": "₹249",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "100 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "Free 10 GB bonus data on first recharge",
      "price": "₹399",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "200 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "Exclusive 20% off for BSNL app recharges",
      "price": "₹599",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "500 GB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "₹300 cashback on next recharge via Paytm",
      "price": "₹999",
    },
    {
      "company": "BSNL",
      "category": "4G Data Voucher",
      "data": "1 TB",
      "voice": "No calls included",
      "sms": "No SMS included",
      "validity": "30 days",
      "subscription": "No subscription included",
      "offer": "Get ₹500 off on next recharge via BSNL app",
      "price": "₹1499",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription":
          "Complimentary subscription to Airtel Xstream, Wynk Music",
      "offer": "10% cashback on recharge via Airtel app",
      "price": "₹299",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "Airtel Xstream, Wynk Music, and ZEE5",
      "offer": "Free 5 GB extra data on next recharge",
      "price": "₹549",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "Airtel Xstream, Wynk Music",
      "offer": "₹50 cashback from Paytm",
      "price": "₹265",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "Airtel Xstream, Wynk Music, and Free Music Channels",
      "offer": "Free 3 months access to Amazon Prime Video",
      "price": "₹719",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "Airtel Xstream, Wynk Music, and Free Airtel Books",
      "offer": "Get 50% cashback on next recharge",
      "price": "₹319",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "Airtel Xstream, Wynk Music",
      "offer": "₹100 cashback from Amazon Pay",
      "price": "₹399",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "Airtel Xstream + Wynk Music + Free Fitness Plans",
      "offer": "Free 20 GB extra data on recharge",
      "price": "₹849",
    },
    {
      "company": "Airtel",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "Airtel Xstream, Wynk Music, ZEE5",
      "offer": "10% cashback on Airtel app recharges",
      "price": "₹479",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription":
          "Complimentary subscription to Airtel Xstream, Wynk Music",
      "offer": "Get 10% cashback on recharge via Airtel app",
      "price": "₹2399",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, and Amazon Prime Video",
      "offer": "Free 6 months access to ZEE5 and 5 GB bonus data",
      "price": "₹2999",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, and Disney+ Hotstar",
      "offer": "₹300 cashback on next recharge via Airtel app",
      "price": "₹3499",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, and ZEE5",
      "offer": "Get 100% cashback on the next recharge",
      "price": "₹3199",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, Free Fitness Plans",
      "offer": "Free Amazon Prime subscription for 1 year",
      "price": "₹3999",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music",
      "offer": "Free access to Airtel Books for 6 months",
      "price": "₹2099",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, ZEE5",
      "offer": "Exclusive 20% off on all recharges",
      "price": "₹2899",
    },
    {
      "company": "Airtel",
      "category": "Annual Plans",
      "data": "3.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, and Disney+ Hotstar",
      "offer": "Free 10 GB extra data for 1st month",
      "price": "₹3699",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription":
          "Complimentary subscription to Airtel Xstream, Wynk Music",
      "offer": "Live cricket streaming with free access to Hotstar",
      "price": "₹299",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "Airtel Xstream, Wynk Music, Disney+ Hotstar",
      "offer": "Free 5 GB extra data for cricket streaming",
      "price": "₹499",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "Airtel Xstream, Wynk Music, ZEE5",
      "offer":
          "Exclusive access to cricket updates and stats on Airtel Xstream",
      "price": "₹699",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "Airtel Xstream, Wynk Music, Disney+ Hotstar",
      "offer": "Free access to IPL matches on Hotstar",
      "price": "₹799",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "Airtel Xstream, Wynk Music",
      "offer": "20% cashback on next recharge for cricket lovers",
      "price": "₹249",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "Airtel Xstream, Wynk Music, ZEE5",
      "offer": "Free 3 months access to Hotstar for cricket streaming",
      "price": "₹999",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "Airtel Xstream, Wynk Music, Disney+ Hotstar",
      "offer": "Get ₹500 cashback on recharges for cricket lovers",
      "price": "₹1499",
    },
    {
      "company": "Airtel",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "180 days",
      "subscription": "Airtel Xstream, Wynk Music, ZEE5",
      "offer":
          "Access to live cricket streaming and highlights on Airtel Xstream",
      "price": "₹999",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "2 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "7 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹99",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "5 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "15 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹199",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "10 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "30 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹349",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "15 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "30 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹499",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "20 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "30 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹599",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "50 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "60 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹999",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "100 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "90 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹1499",
    },
    {
      "company": "Airtel",
      "category": "4G Data Voucher",
      "data": "200 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "180 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹2499",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription":
          "Complimentary subscription to VI Movies & TV, Wynk Music",
      "offer": "Free access to live cricket streaming on Disney+ Hotstar",
      "price": "₹249",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "VI Movies & TV, Wynk Music, Amazon Prime Video",
      "offer": "Get ₹50 cashback on the next recharge",
      "price": "₹299",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Free access to IPL matches on Disney+ Hotstar",
      "price": "₹399",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "VI Movies & TV, Wynk Music",
      "offer": "Exclusive access to Vi Sports and live updates",
      "price": "₹499",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "VI Movies & TV, Wynk Music",
      "offer": "20% off on recharges through Vi App",
      "price": "₹199",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "VI Movies & TV, Wynk Music, ZEE5",
      "offer": "Free 3 months of access to Hotstar and ZEE5",
      "price": "₹599",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "30 days",
      "subscription": "VI Movies & TV, Wynk Music",
      "offer": "Free 5 GB extra data for the first month",
      "price": "₹349",
    },
    {
      "company": "VI",
      "category": "Popular",
      "data": "5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music, Amazon Prime Video",
      "offer": "Get ₹100 cashback on recharge through the Vi App",
      "price": "₹999",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music, Amazon Prime Video",
      "offer": "Free 3-month access to Disney+ Hotstar",
      "price": "₹1999",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "1.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music",
      "offer": "Free 6 months of access to ZEE5",
      "price": "₹1799",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "2.5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music, Amazon Prime Video",
      "offer": "Get ₹500 cashback for using Vi App",
      "price": "₹2499",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Free 1 year of ZEE5 and Hotstar subscription",
      "price": "₹2999",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music",
      "offer": "Free 3 months of Vi Sports and live streaming of IPL",
      "price": "₹3499",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription":
          "VI Movies & TV, Wynk Music, Disney+ Hotstar, Amazon Prime Video",
      "offer": "Get ₹1000 cashback on your next recharge",
      "price": "₹4999",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "6 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music, ZEE5",
      "offer": "Free access to IPL matches and live cricket streaming",
      "price": "₹5999",
    },
    {
      "company": "VI",
      "category": "Annual Plans",
      "data": "10 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription":
          "VI Movies & TV, Wynk Music, Disney+ Hotstar, Amazon Prime Video",
      "offer": "Free 1 year subscription to ZEE5 and Hotstar",
      "price": "₹7999",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "1 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "28 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Free live cricket streaming on Disney+ Hotstar",
      "price": "₹299",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "2 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Free access to IPL matches on Disney+ Hotstar",
      "price": "₹599",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "3 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "56 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Get free cricket updates and live scores on the Vi app",
      "price": "₹799",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "4 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Free live cricket streaming of IPL and T20 matches",
      "price": "₹999",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "5 GB/day",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "84 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Get exclusive cricket match highlights on Disney+ Hotstar",
      "price": "₹1199",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "10 GB",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "180 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Get free access to live cricket streaming on Disney+ Hotstar",
      "price": "₹1499",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "15 GB",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription": "VI Movies & TV, Wynk Music, Disney+ Hotstar",
      "offer": "Get free 6-month subscription to Disney+ Hotstar",
      "price": "₹2499",
    },
    {
      "company": "VI",
      "category": "Cricket",
      "data": "20 GB",
      "voice": "Unlimited calls",
      "sms": "100 SMS/day",
      "validity": "365 days",
      "subscription":
          "VI Movies & TV, Wynk Music, Disney+ Hotstar, Amazon Prime Video",
      "offer":
          "Free access to IPL matches and cricket highlights on Disney+ Hotstar",
      "price": "₹2999",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "1 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "1 day",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹50",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "2 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "2 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹100",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "3 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "3 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹150",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "6 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "7 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹200",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "10 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "14 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹350",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "20 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "28 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹500",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "50 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "56 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹900",
    },
    {
      "company": "VI",
      "category": "4G Data Voucher",
      "data": "100 GB",
      "voice": "No calls",
      "sms": "No SMS",
      "validity": "84 days",
      "subscription": "No subscriptions",
      "offer": "No offers",
      "price": "₹1500",
    },
  ];

  List<ProductModel> dairyProductList = [
    ProductModel(
      quantity: "0",
      id: 1,
      name: "Milk",
      weight: "1 litre",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Whole cow’s milk contains about 87% water. The remaining 13% contains protein, fat, carbohydrates, vitamins, and minerals. "
          "Processing techniques remove fat to produce lower-fat varieties such as reduced-fat (2%), low-fat (1%), and nonfat milk.",
      rating: "4.7",
      category: "Dairy Product",
      image:
          "https://media.istockphoto.com/id/1398613299/photo/glass-of-milk-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=e0P8w4fVsPaQGpKEq9cnol0OJyXHrWJ6fGwV1saLCxc=",
      relatedImages: [
        "https://plus.unsplash.com/premium_photo-1683121595979-870ded53a3c8?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1529258283598-8d6fe60b27f4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1536238202089-6ce355328a96?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 2,
      name: "Milk",
      weight: "500 ml",
      price: "₹30.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Whole cow’s milk contains about 87% water. The remaining 13% contains protein, fat, carbohydrates, vitamins, and minerals. "
          "Processing techniques remove fat to produce lower-fat varieties such as reduced-fat (2%), low-fat (1%), and nonfat milk.",
      rating: "4.6",
      category: "Milk",
      image:
          "https://media.istockphoto.com/id/1398613299/photo/glass-of-milk-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=e0P8w4fVsPaQGpKEq9cnol0OJyXHrWJ6fGwV1saLCxc=",
      relatedImages: [
        "https://plus.unsplash.com/premium_photo-1683121595979-870ded53a3c8?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1529258283598-8d6fe60b27f4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1536238202089-6ce355328a96?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 3,
      name: "Milk",
      weight: "1 liter",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Whole cow’s milk contains about 87% water. The remaining 13% contains protein, fat, carbohydrates, vitamins, and minerals. "
          "Processing techniques remove fat to produce lower-fat varieties such as reduced-fat (2%), low-fat (1%), and nonfat milk.",
      rating: "4.7",
      category: "Milk",
      image:
          "https://media.istockphoto.com/id/1398613299/photo/glass-of-milk-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=e0P8w4fVsPaQGpKEq9cnol0OJyXHrWJ6fGwV1saLCxc=",
      relatedImages: [
        "https://plus.unsplash.com/premium_photo-1683121595979-870ded53a3c8?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1529258283598-8d6fe60b27f4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1536238202089-6ce355328a96?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 4,
      name: "Milk",
      weight: "2 liters",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Whole cow’s milk contains about 87% water. The remaining 13% contains protein, fat, carbohydrates, vitamins, and minerals. "
          "Processing techniques remove fat to produce lower-fat varieties such as reduced-fat (2%), low-fat (1%), and nonfat milk.",
      rating: "4.8",
      category: "Milk",
      image:
          "https://media.istockphoto.com/id/1398613299/photo/glass-of-milk-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=e0P8w4fVsPaQGpKEq9cnol0OJyXHrWJ6fGwV1saLCxc=",
      relatedImages: [
        "https://plus.unsplash.com/premium_photo-1683121595979-870ded53a3c8?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1529258283598-8d6fe60b27f4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1536238202089-6ce355328a96?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 5,
      name: "Milk",
      weight: "250 ml",
      price: "₹15.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Whole cow’s milk contains about 87% water. The remaining 13% contains protein, fat, carbohydrates, vitamins, and minerals. "
          "Processing techniques remove fat to produce lower-fat varieties such as reduced-fat (2%), low-fat (1%), and nonfat milk.",
      rating: "4.4",
      category: "Milk",
      image:
          "https://media.istockphoto.com/id/1398613299/photo/glass-of-milk-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=e0P8w4fVsPaQGpKEq9cnol0OJyXHrWJ6fGwV1saLCxc=",
      relatedImages: [
        "https://plus.unsplash.com/premium_photo-1683121595979-870ded53a3c8?q=80&w=2825&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1529258283598-8d6fe60b27f4?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1536238202089-6ce355328a96?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    ),
    ProductModel(
        quantity: "0",
        id: 6,
        name: "Butter",
        weight: "500 gm",
        price: "₹240.00",
        isFavourite: 0,
        isDaily: 0,
        description:
            "Butter is a dairy product made by churning cream to separate butterfat from buttermilk. It is rich in fats and often used in cooking and baking.",
        rating: "4.6",
        category: "Dairy Product",
        relatedImages: [
          "https://images.unsplash.com/photo-1603596311044-f19158b61f28?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnV0dGVyfGVufDB8fDB8fHww",
          "https://images.unsplash.com/photo-1617062598156-23596804ad6d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
          "https://media.istockphoto.com/id/1001502964/photo/image-of-white-butter-make-at-home-from-milk-and-its-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=VRJwhBTxN0-k-FSS6Gw-V_H23Vl0y9fwq5Dk5OkvVoo=",
        ],
        image:
            "https://plus.unsplash.com/premium_photo-1699651798312-dd6d2734b4fb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ProductModel(
      quantity: "0",
      id: 7,
      name: "Butter",
      weight: "250 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Butter is a dairy product made by churning cream to separate butterfat from buttermilk. It is rich in fats and often used in cooking and baking.",
      rating: "4.6",
      category: "Butter",
      relatedImages: [
        "https://images.unsplash.com/photo-1603596311044-f19158b61f28?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnV0dGVyfGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1617062598156-23596804ad6d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
        "https://media.istockphoto.com/id/1001502964/photo/image-of-white-butter-make-at-home-from-milk-and-its-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=VRJwhBTxN0-k-FSS6Gw-V_H23Vl0y9fwq5Dk5OkvVoo=",
      ],
      image:
          "https://plus.unsplash.com/premium_photo-1699651798312-dd6d2734b4fb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    ProductModel(
      quantity: "0",
      id: 8,
      name: "Butter",
      weight: "500 gm",
      price: "₹240.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Butter is a dairy product made by churning cream to separate butterfat from buttermilk. It is rich in fats and often used in cooking and baking.",
      rating: "4.8",
      category: "Butter",
      relatedImages: [
        "https://images.unsplash.com/photo-1603596311044-f19158b61f28?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnV0dGVyfGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1617062598156-23596804ad6d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
        "https://media.istockphoto.com/id/1001502964/photo/image-of-white-butter-make-at-home-from-milk-and-its-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=VRJwhBTxN0-k-FSS6Gw-V_H23Vl0y9fwq5Dk5OkvVoo=",
      ],
      image:
          "https://plus.unsplash.com/premium_photo-1699651798312-dd6d2734b4fb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    ProductModel(
      quantity: "0",
      id: 9,
      name: "Butter",
      weight: "1 kg",
      price: "₹480.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Butter is a dairy product made by churning cream to separate butterfat from buttermilk. It is rich in fats and often used in cooking and baking.",
      rating: "4.9",
      category: "Butter",
      relatedImages: [
        "https://images.unsplash.com/photo-1603596311044-f19158b61f28?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnV0dGVyfGVufDB8fDB8fHww",
        "https://images.unsplash.com/photo-1617062598156-23596804ad6d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1dHRlcnxlbnwwfHwwfHx8MA%3D%3D",
        "https://media.istockphoto.com/id/1001502964/photo/image-of-white-butter-make-at-home-from-milk-and-its-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=VRJwhBTxN0-k-FSS6Gw-V_H23Vl0y9fwq5Dk5OkvVoo=",
      ],
      image:
          "https://plus.unsplash.com/premium_photo-1699651798312-dd6d2734b4fb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    ProductModel(
        quantity: "0",
        id: 10,
        name: "Cheese",
        weight: "200 gm",
        price: "₹320.00",
        isFavourite: 0,
        isDaily: 0,
        description:
            "Cheese is made by curdling milk using rennet and an acid. It comes in various types, textures, and flavors, such as cheddar, mozzarella, and parmesan.",
        rating: "4.8",
        category: "Dairy Product",
        relatedImages: [
          "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
          "https://media.istockphoto.com/id/1369973042/photo/swiss-hard-cheese-piece-in-wooden-tray-black-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=b4G0kwTjCob_1xm061Rkcz08zNiFmajwPkriqvWe-7Q=",
          "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
        ],
        image:
            "https://plus.unsplash.com/premium_photo-1691939610797-aba18030c15f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2hlZXNlfGVufDB8fDB8fHww"),
    ProductModel(
      quantity: "0",
      id: 11,
      name: "Cheese",
      weight: "200 gm",
      price: "₹320.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cheese is made by curdling milk using rennet and an acid. It comes in various types, textures, and flavors, such as cheddar, mozzarella, and parmesan.",
      rating: "4.8",
      category: "Cheese",
      relatedImages: [
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
        "https://media.istockphoto.com/id/1369973042/photo/swiss-hard-cheese-piece-in-wooden-tray-black-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=b4G0kwTjCob_1xm061Rkcz08zNiFmajwPkriqvWe-7Q=",
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
      ],
      image:
          "https://plus.unsplash.com/premium_photo-1691939610797-aba18030c15f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2hlZXNlfGVufDB8fDB8fHww",
    ),
    ProductModel(
      quantity: "0",
      id: 12,
      name: "Cheese",
      weight: "500 gm",
      price: "₹800.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Cheese is made by curdling milk using rennet and an acid. It comes in various types, textures, and flavors, such as cheddar, mozzarella, and parmesan.",
      rating: "4.9",
      category: "Cheese",
      relatedImages: [
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
        "https://media.istockphoto.com/id/1369973042/photo/swiss-hard-cheese-piece-in-wooden-tray-black-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=b4G0kwTjCob_1xm061Rkcz08zNiFmajwPkriqvWe-7Q=",
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
      ],
      image:
          "https://plus.unsplash.com/premium_photo-1691939610797-aba18030c15f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2hlZXNlfGVufDB8fDB8fHww",
    ),
    ProductModel(
      quantity: "0",
      id: 13,
      name: "Cheese",
      weight: "1 kg",
      price: "₹1600.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Cheese is made by curdling milk using rennet and an acid. It comes in various types, textures, and flavors, such as cheddar, mozzarella, and parmesan.",
      rating: "5.0",
      category: "Cheese",
      relatedImages: [
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
        "https://media.istockphoto.com/id/1369973042/photo/swiss-hard-cheese-piece-in-wooden-tray-black-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=b4G0kwTjCob_1xm061Rkcz08zNiFmajwPkriqvWe-7Q=",
        "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Q2hlZXNlfGVufDB8fDB8fHww",
      ],
      image:
          "https://plus.unsplash.com/premium_photo-1691939610797-aba18030c15f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Q2hlZXNlfGVufDB8fDB8fHww",
    ),
    ProductModel(
      quantity: "0",
      id: 14,
      name: "Yogurt",
      weight: "500 gm",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Yogurt is a dairy product produced by fermenting milk with live bacteria cultures. It is rich in probiotics and often consumed as a healthy snack.",
      rating: "4.5",
      category: "Dairy Product",
      image:
          "https://images.unsplash.com/photo-1571212515416-fef01fc43637?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8WW9ndXJ0fGVufDB8fDB8fHww",
      relatedImages: [
        "https://plus.unsplash.com/premium_photo-1666262371155-346769c7d10e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fFlvZ3VydHxlbnwwfHwwfHx8MA%3D%3D",
        "https://images.unsplash.com/photo-1572041002237-762bdc102cf6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fFlvZ3VydHxlbnwwfHwwfHx8MA%3D%3D",
        "https://media.istockphoto.com/id/1601320501/photo/cucumber-raita.webp?a=1&b=1&s=612x612&w=0&k=20&c=Snn4T3TGiNwNoosElZY6do_SD1zX9I4NPypA9mxxsjE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 15,
      name: "Cream",
      weight: "300 ml",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cream is the fatty layer skimmed from milk. It is commonly used in desserts, sauces, and soups to add richness and flavor.",
      rating: "4.4",
      category: "Dairy Product",
      image:
          "https://plus.unsplash.com/premium_photo-1674949802338-f94005eb5b0a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Q3JlYW18ZW58MHx8MHx8fDA%3D",
      relatedImages: [
        "https://media.istockphoto.com/id/1343286165/photo/herbal-cream-cosmetic-in-a-container-on-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=osaXpvOcKtFvrXp2LPwEOOtJeI3JkQDMCQISROax3gE=",
        "https://media.istockphoto.com/id/1312358174/photo/smudged-make-up-gradient-texture-palette-creamy-matte-beige-concealer-foundation-cc-or-bb.webp?a=1&b=1&s=612x612&w=0&k=20&c=i9NAdTB2PxR3YGVYGkRLJLSQOfi3hBcIAEAjbR1zEsg=",
        "https://media.istockphoto.com/id/1389427229/photo/studio-shot-of-an-attractive-young-woman-posing-with-moisturiser-on-her-face-against-a-grey.webp?a=1&b=1&s=612x612&w=0&k=20&c=dQOuttQEjwd-3Y4a3wNqVPbLSupgA0G0nE_8su0LBvA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 16,
      name: "Ghee",
      weight: "500 gm",
      price: "₹550.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Ghee is clarified butter, commonly used in Indian cuisine. It has a high smoke point, making it ideal for frying and roasting.",
      rating: "4.7",
      category: "Dairy Product",
      image:
          "https://media.istockphoto.com/id/1147282998/photo/spoon-in-a-tub-of-ghee-or-clarified-butter-as-used-in-indian-cooking.webp?a=1&b=1&s=612x612&w=0&k=20&c=VhWeWrSp7iXpXtywB8wp3Jkfy0i9BEiLWBbgOdN-YgU=",
      relatedImages: [
        "https://media.istockphoto.com/id/2163076415/photo/drop-ghee-into-a-saute-pan.webp?a=1&b=1&s=612x612&w=0&k=20&c=4R806AqSxCc08mG76iBgo-tuDyPMbU6g93UeUX0qvQY=",
        "https://media.istockphoto.com/id/857450176/photo/ghee-or-clarified-butter-close-up-in-wooden-bowl-and-silver-spoon-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=n60RJg4OCMTlp8WtjSNFecj0grJswbBYZYLRRFoQgn4=",
        "https://media.istockphoto.com/id/1314481702/photo/frying-pan-and-bowl-with-ghee-butter-on-dark-wooden-table-flat-lay.webp?a=1&b=1&s=612x612&w=0&k=20&c=NKhQ2ClZZCwtxfERTXtppuKSZI6idczX6viKWVhlt80=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 17,
      name: "Ghee",
      weight: "250 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Ghee is clarified butter, commonly used in Indian cuisine. It has a high smoke point, making it ideal for frying and roasting.",
      rating: "4.6",
      category: "Ghee",
      image:
          "https://media.istockphoto.com/id/857450176/photo/ghee-or-clarified-butter-close-up-in-wooden-bowl-and-silver-spoon-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=n60RJg4OCMTlp8WtjSNFecj0grJswbBYZYLRRFoQgn4=",
      relatedImages: [
        "https://media.istockphoto.com/id/2163076415/photo/drop-ghee-into-a-saute-pan.webp?a=1&b=1&s=612x612&w=0&k=20&c=4R806AqSxCc08mG76iBgo-tuDyPMbU6g93UeUX0qvQY=",
        "https://media.istockphoto.com/id/857450176/photo/ghee-or-clarified-butter-close-up-in-wooden-bowl-and-silver-spoon-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=n60RJg4OCMTlp8WtjSNFecj0grJswbBYZYLRRFoQgn4=",
        "https://media.istockphoto.com/id/1314481702/photo/frying-pan-and-bowl-with-ghee-butter-on-dark-wooden-table-flat-lay.webp?a=1&b=1&s=612x612&w=0&k=20&c=NKhQ2ClZZCwtxfERTXtppuKSZI6idczX6viKWVhlt80=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 18,
      name: "Ghee",
      weight: "500 gm",
      price: "₹550.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Ghee is clarified butter, commonly used in Indian cuisine. It has a high smoke point, making it ideal for frying and roasting.",
      rating: "4.7",
      category: "Ghee",
      image:
          "https://media.istockphoto.com/id/1147282998/photo/spoon-in-a-tub-of-ghee-or-clarified-butter-as-used-in-indian-cooking.webp?a=1&b=1&s=612x612&w=0&k=20&c=VhWeWrSp7iXpXtywB8wp3Jkfy0i9BEiLWBbgOdN-YgU=",
      relatedImages: [
        "https://media.istockphoto.com/id/2163076415/photo/drop-ghee-into-a-saute-pan.webp?a=1&b=1&s=612x612&w=0&k=20&c=4R806AqSxCc08mG76iBgo-tuDyPMbU6g93UeUX0qvQY=",
        "https://media.istockphoto.com/id/857450176/photo/ghee-or-clarified-butter-close-up-in-wooden-bowl-and-silver-spoon-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=n60RJg4OCMTlp8WtjSNFecj0grJswbBYZYLRRFoQgn4=",
        "https://media.istockphoto.com/id/1314481702/photo/frying-pan-and-bowl-with-ghee-butter-on-dark-wooden-table-flat-lay.webp?a=1&b=1&s=612x612&w=0&k=20&c=NKhQ2ClZZCwtxfERTXtppuKSZI6idczX6viKWVhlt80=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 19,
      name: "Ghee",
      weight: "1 kg",
      price: "₹1,100.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Ghee is clarified butter, commonly used in Indian cuisine. It has a high smoke point, making it ideal for frying and roasting.",
      rating: "4.8",
      category: "Ghee",
      image:
          "https://media.istockphoto.com/id/1147282998/photo/spoon-in-a-tub-of-ghee-or-clarified-butter-as-used-in-indian-cooking.webp?a=1&b=1&s=612x612&w=0&k=20&c=VhWeWrSp7iXpXtywB8wp3Jkfy0i9BEiLWBbgOdN-YgU=",
      relatedImages: [
        "https://media.istockphoto.com/id/2163076415/photo/drop-ghee-into-a-saute-pan.webp?a=1&b=1&s=612x612&w=0&k=20&c=4R806AqSxCc08mG76iBgo-tuDyPMbU6g93UeUX0qvQY=",
        "https://media.istockphoto.com/id/857450176/photo/ghee-or-clarified-butter-close-up-in-wooden-bowl-and-silver-spoon-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=n60RJg4OCMTlp8WtjSNFecj0grJswbBYZYLRRFoQgn4=",
        "https://media.istockphoto.com/id/1314481702/photo/frying-pan-and-bowl-with-ghee-butter-on-dark-wooden-table-flat-lay.webp?a=1&b=1&s=612x612&w=0&k=20&c=NKhQ2ClZZCwtxfERTXtppuKSZI6idczX6viKWVhlt80=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 20,
      name: "Rice",
      weight: "1 kg",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Rice is a staple grain consumed worldwide. It is a rich source of carbohydrates, providing energy and essential nutrients like vitamins and minerals. Common varieties include basmati, jasmine, and brown rice.",
      rating: "4.6",
      category: "Staples & Grains",
      image:
          "https://plus.unsplash.com/premium_photo-1658527064466-df8ed3bbe6e7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHJpY2V8ZW58MHx8MHx8fDA%3D",
      relatedImages: [
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/609613988/photo/indian-food-rice-pilaf.webp?a=1&b=1&s=612x612&w=0&k=20&c=jLVFBB0nMXEIEYsYkjMna-d4LWlCrU4FiIPQjyeklXs=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 21,
      name: "Wheat Flour",
      weight: "1 kg",
      price: "₹55.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Wheat flour is a finely milled powder made from wheat grains. It is widely used to prepare bread, chapati, and other baked goods. It is a good source of fiber and essential nutrients.",
      rating: "4.7",
      category: "Staples & Grains",
      image:
          "https://media.istockphoto.com/id/172876049/photo/whole-wheat-flour.webp?a=1&b=1&s=612x612&w=0&k=20&c=gOKXB0fDqltQDZ1GKfBpHSit-T7J4_UnLc-bauq5c8w=",
      relatedImages: [
        "https://media.istockphoto.com/id/153162703/photo/flour-in-small-burlap-sack.webp?a=1&b=1&s=612x612&w=0&k=20&c=bCH_7QsksYjtiuDyOHTofu9HJCrhTfj-YJlE2aBXGcM=",
        "https://media.istockphoto.com/id/900229800/photo/indian-bread-chapati-fulka-gehu-roti-with-wheat-grains-in-background-its-a-healthy-fiber-rich.webp?a=1&b=1&s=612x612&w=0&k=20&c=JopFYzqqW8hhbv_HAeKnyXqd5hB1N9N7GX1Tz3H6Mhw=",
        "https://media.istockphoto.com/id/490885863/photo/flour-with-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=lD_FDamUyE_mPkQJwl25YqrjJT1yAqeEcA8sGeCTWDo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 22,
      name: "Wheat Flour",
      weight: "500 gm",
      price: "₹28.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Wheat flour is a finely milled powder made from wheat grains. It is widely used to prepare bread, chapati, and other baked goods. It is a good source of fiber and essential nutrients.",
      rating: "4.6",
      category: "Wheat Flour",
      image:
          "https://media.istockphoto.com/id/153162703/photo/flour-in-small-burlap-sack.webp?a=1&b=1&s=612x612&w=0&k=20&c=bCH_7QsksYjtiuDyOHTofu9HJCrhTfj-YJlE2aBXGcM=",
      relatedImages: [
        "https://media.istockphoto.com/id/153162703/photo/flour-in-small-burlap-sack.webp?a=1&b=1&s=612x612&w=0&k=20&c=bCH_7QsksYjtiuDyOHTofu9HJCrhTfj-YJlE2aBXGcM=",
        "https://media.istockphoto.com/id/900229800/photo/indian-bread-chapati-fulka-gehu-roti-with-wheat-grains-in-background-its-a-healthy-fiber-rich.webp?a=1&b=1&s=612x612&w=0&k=20&c=JopFYzqqW8hhbv_HAeKnyXqd5hB1N9N7GX1Tz3H6Mhw=",
        "https://media.istockphoto.com/id/490885863/photo/flour-with-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=lD_FDamUyE_mPkQJwl25YqrjJT1yAqeEcA8sGeCTWDo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 23,
      name: "Wheat Flour",
      weight: "1 kg",
      price: "₹55.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Wheat flour is a finely milled powder made from wheat grains. It is widely used to prepare bread, chapati, and other baked goods. It is a good source of fiber and essential nutrients.",
      rating: "4.7",
      category: "Wheat Flour",
      image:
          "https://media.istockphoto.com/id/172876049/photo/whole-wheat-flour.webp?a=1&b=1&s=612x612&w=0&k=20&c=gOKXB0fDqltQDZ1GKfBpHSit-T7J4_UnLc-bauq5c8w=",
      relatedImages: [
        "https://media.istockphoto.com/id/153162703/photo/flour-in-small-burlap-sack.webp?a=1&b=1&s=612x612&w=0&k=20&c=bCH_7QsksYjtiuDyOHTofu9HJCrhTfj-YJlE2aBXGcM=",
        "https://media.istockphoto.com/id/900229800/photo/indian-bread-chapati-fulka-gehu-roti-with-wheat-grains-in-background-its-a-healthy-fiber-rich.webp?a=1&b=1&s=612x612&w=0&k=20&c=JopFYzqqW8hhbv_HAeKnyXqd5hB1N9N7GX1Tz3H6Mhw=",
        "https://media.istockphoto.com/id/490885863/photo/flour-with-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=lD_FDamUyE_mPkQJwl25YqrjJT1yAqeEcA8sGeCTWDo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 24,
      name: "Wheat Flour",
      weight: "5 kg",
      price: "₹270.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Wheat flour is a finely milled powder made from wheat grains. It is widely used to prepare bread, chapati, and other baked goods. It is a good source of fiber and essential nutrients.",
      rating: "4.8",
      category: "Wheat Flour",
      image:
          "https://media.istockphoto.com/id/153162703/photo/flour-in-small-burlap-sack.webp?a=1&b=1&s=612x612&w=0&k=20&c=bCH_7QsksYjtiuDyOHTofu9HJCrhTfj-YJlE2aBXGcM=",
      relatedImages: [
        "https://media.istockphoto.com/id/153162703/photo/flour-in-small-burlap-sack.webp?a=1&b=1&s=612x612&w=0&k=20&c=bCH_7QsksYjtiuDyOHTofu9HJCrhTfj-YJlE2aBXGcM=",
        "https://media.istockphoto.com/id/900229800/photo/indian-bread-chapati-fulka-gehu-roti-with-wheat-grains-in-background-its-a-healthy-fiber-rich.webp?a=1&b=1&s=612x612&w=0&k=20&c=JopFYzqqW8hhbv_HAeKnyXqd5hB1N9N7GX1Tz3H6Mhw=",
        "https://media.istockphoto.com/id/490885863/photo/flour-with-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=lD_FDamUyE_mPkQJwl25YqrjJT1yAqeEcA8sGeCTWDo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 25,
      name: "Lentils",
      weight: "500 gm",
      price: "₹70.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Lentils are a rich source of protein, fiber, and essential minerals. They come in various types such as red, green, and black lentils, and are widely used in soups, curries, and salads.",
      rating: "4.8",
      category: "Staples & Grains",
      image:
          "https://media.istockphoto.com/id/538998894/photo/lentil-soup-with-crusty-bread.webp?a=1&b=1&s=612x612&w=0&k=20&c=zpEINXOUmUKZMqfQol1vVmTWQBlKbAB9UsRqJI9uSUs=",
      relatedImages: [
        "https://media.istockphoto.com/id/916928046/photo/butternuts-squash-and-red-lentils-soup.webp?a=1&b=1&s=612x612&w=0&k=20&c=cg9PyDjIhpmGl6198lQ2I-NU3EFAyTeMdE_94gCv05U=",
        "https://media.istockphoto.com/id/1217443344/photo/five-types-of-lentils-that-are-widely-consumed-in-india-these-are-mung-bean-chickpea-lentil.webp?a=1&b=1&s=612x612&w=0&k=20&c=U29uwSSl-dbBPR3vCYRXbcyFkdymUG5bbx4Hn7_FvV0=",
        "https://media.istockphoto.com/id/1143847451/photo/various-assortment-set-of-indian-legumes-in-bowls-on-wooden-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=FyYbOrk2LZ-gxNMktqZUvlaaPbpTnE-qFHBonUqp-s4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 26,
      name: "Sugar",
      weight: "1 kg",
      price: "₹40.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Sugar is a sweet crystalline substance derived from sugarcane or sugar beet. It is commonly used as a sweetener in various foods and beverages.",
      rating: "4.4",
      category: "Staples & Grains",
      image:
          "https://media.istockphoto.com/id/1405999259/photo/organic-jaggery.webp?a=1&b=1&s=612x612&w=0&k=20&c=b7cZfcYdQDPSgcsfG0mpbZOnF8-n3EyEcrAEnv1J-Hk=",
      relatedImages: [
        "https://media.istockphoto.com/id/598098222/photo/sugarcane-field.webp?a=1&b=1&s=612x612&w=0&k=20&c=rR_DGlsstMh69XTDBPrzZHcf6b1a9z3wjcpzcydolXE=",
        "https://media.istockphoto.com/id/2123913458/photo/sugarcane-cultivation-at-rural-farm-from-different-angle.webp?a=1&b=1&s=612x612&w=0&k=20&c=l7fGIWzSgURqeTW1hlSrmOVjHAs6OglpiQ3qwjjJzmk=",
        "https://media.istockphoto.com/id/688319174/photo/sugarcane-harvesting.webp?a=1&b=1&s=612x612&w=0&k=20&c=2GPfC2fSNcya5sx2dUpSlV2PPpTbMaNXizlocEZoGpk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 27,
      name: "Sugar",
      weight: "500 gm",
      price: "₹22.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Sugar is a sweet crystalline substance derived from sugarcane or sugar beet. It is commonly used as a sweetener in various foods and beverages.",
      rating: "4.5",
      category: "Sugar",
      image:
          "https://media.istockphoto.com/id/1405999259/photo/organic-jaggery.webp?a=1&b=1&s=612x612&w=0&k=20&c=b7cZfcYdQDPSgcsfG0mpbZOnF8-n3EyEcrAEnv1J-Hk=",
      relatedImages: [
        "https://media.istockphoto.com/id/598098222/photo/sugarcane-field.webp?a=1&b=1&s=612x612&w=0&k=20&c=rR_DGlsstMh69XTDBPrzZHcf6b1a9z3wjcpzcydolXE=",
        "https://media.istockphoto.com/id/2123913458/photo/sugarcane-cultivation-at-rural-farm-from-different-angle.webp?a=1&b=1&s=612x612&w=0&k=20&c=l7fGIWzSgURqeTW1hlSrmOVjHAs6OglpiQ3qwjjJzmk=",
        "https://media.istockphoto.com/id/688319174/photo/sugarcane-harvesting.webp?a=1&b=1&s=612x612&w=0&k=20&c=2GPfC2fSNcya5sx2dUpSlV2PPpTbMaNXizlocEZoGpk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 28,
      name: "Sugar",
      weight: "1 kg",
      price: "₹40.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Sugar is a sweet crystalline substance derived from sugarcane or sugar beet. It is commonly used as a sweetener in various foods and beverages.",
      rating: "4.4",
      category: "Sugar",
      image:
          "https://media.istockphoto.com/id/1405999259/photo/organic-jaggery.webp?a=1&b=1&s=612x612&w=0&k=20&c=b7cZfcYdQDPSgcsfG0mpbZOnF8-n3EyEcrAEnv1J-Hk=",
      relatedImages: [
        "https://media.istockphoto.com/id/598098222/photo/sugarcane-field.webp?a=1&b=1&s=612x612&w=0&k=20&c=rR_DGlsstMh69XTDBPrzZHcf6b1a9z3wjcpzcydolXE=",
        "https://media.istockphoto.com/id/2123913458/photo/sugarcane-cultivation-at-rural-farm-from-different-angle.webp?a=1&b=1&s=612x612&w=0&k=20&c=l7fGIWzSgURqeTW1hlSrmOVjHAs6OglpiQ3qwjjJzmk=",
        "https://media.istockphoto.com/id/688319174/photo/sugarcane-harvesting.webp?a=1&b=1&s=612x612&w=0&k=20&c=2GPfC2fSNcya5sx2dUpSlV2PPpTbMaNXizlocEZoGpk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 29,
      name: "Sugar",
      weight: "5 kg",
      price: "₹190.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Sugar is a sweet crystalline substance derived from sugarcane or sugar beet. It is commonly used as a sweetener in various foods and beverages.",
      rating: "4.6",
      category: "Sugar",
      image:
          "https://media.istockphoto.com/id/1405999259/photo/organic-jaggery.webp?a=1&b=1&s=612x612&w=0&k=20&c=b7cZfcYdQDPSgcsfG0mpbZOnF8-n3EyEcrAEnv1J-Hk=",
      relatedImages: [
        "https://media.istockphoto.com/id/598098222/photo/sugarcane-field.webp?a=1&b=1&s=612x612&w=0&k=20&c=rR_DGlsstMh69XTDBPrzZHcf6b1a9z3wjcpzcydolXE=",
        "https://media.istockphoto.com/id/2123913458/photo/sugarcane-cultivation-at-rural-farm-from-different-angle.webp?a=1&b=1&s=612x612&w=0&k=20&c=l7fGIWzSgURqeTW1hlSrmOVjHAs6OglpiQ3qwjjJzmk=",
        "https://media.istockphoto.com/id/688319174/photo/sugarcane-harvesting.webp?a=1&b=1&s=612x612&w=0&k=20&c=2GPfC2fSNcya5sx2dUpSlV2PPpTbMaNXizlocEZoGpk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 30,
      name: "Salt",
      weight: "1 kg",
      price: "₹20.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Salt is an essential mineral primarily composed of sodium chloride. It is used as a seasoning and preservative in cooking and has a vital role in maintaining bodily functions.",
      rating: "4.5",
      category: "Staples & Grains",
      image:
          "https://media.istockphoto.com/id/1051727580/photo/crystals-of-shallow-salt-in-a-scoop-spoon-on-a-dark-gray-table-background-for-advertising.webp?a=1&b=1&s=612x612&w=0&k=20&c=95mUU2y-pfS14A7uXuDVduAzm7FUo3PRHDr603d_wgY=",
      relatedImages: [
        "https://media.istockphoto.com/id/1005987174/photo/inscription-sugar-and-salt-on-grey-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=F2BlpPttDvaAOssyhX83xIDOVmD9QK8W7khWPIZcQYY=",
        "https://media.istockphoto.com/id/1372048548/photo/professional-cook-hold-saltcellar-and-add-salt-to-soup-against-kitchen-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=rOnmBF_rSmKzrEIbEWViVLxNxN0OWTaOzPbPe39b7b4=",
        "https://media.istockphoto.com/id/1125036641/photo/salt-large-sea-and-small-kitchen-in-silver-spoons-on-a-black-stone-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=0OqAw8KZK5I4bdWGHk4xzdiRtnp7e4qfkI2L-S4w9vk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 31,
      name: "Salt",
      weight: "500 gm",
      price: "₹12.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Salt is an essential mineral primarily composed of sodium chloride. It is used as a seasoning and preservative in cooking and has a vital role in maintaining bodily functions.",
      rating: "4.3",
      category: "Salt",
      image:
          "https://media.istockphoto.com/id/1051727580/photo/crystals-of-shallow-salt-in-a-scoop-spoon-on-a-dark-gray-table-background-for-advertising.webp?a=1&b=1&s=612x612&w=0&k=20&c=95mUU2y-pfS14A7uXuDVduAzm7FUo3PRHDr603d_wgY=",
      relatedImages: [
        "https://media.istockphoto.com/id/1005987174/photo/inscription-sugar-and-salt-on-grey-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=F2BlpPttDvaAOssyhX83xIDOVmD9QK8W7khWPIZcQYY=",
        "https://media.istockphoto.com/id/1372048548/photo/professional-cook-hold-saltcellar-and-add-salt-to-soup-against-kitchen-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=rOnmBF_rSmKzrEIbEWViVLxNxN0OWTaOzPbPe39b7b4=",
        "https://media.istockphoto.com/id/1125036641/photo/salt-large-sea-and-small-kitchen-in-silver-spoons-on-a-black-stone-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=0OqAw8KZK5I4bdWGHk4xzdiRtnp7e4qfkI2L-S4w9vk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 32,
      name: "Salt",
      weight: "1 kg",
      price: "₹20.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Salt is an essential mineral primarily composed of sodium chloride. It is used as a seasoning and preservative in cooking and has a vital role in maintaining bodily functions.",
      rating: "4.5",
      category: "Salt",
      image:
          "https://media.istockphoto.com/id/1051727580/photo/crystals-of-shallow-salt-in-a-scoop-spoon-on-a-dark-gray-table-background-for-advertising.webp?a=1&b=1&s=612x612&w=0&k=20&c=95mUU2y-pfS14A7uXuDVduAzm7FUo3PRHDr603d_wgY=",
      relatedImages: [
        "https://media.istockphoto.com/id/1005987174/photo/inscription-sugar-and-salt-on-grey-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=F2BlpPttDvaAOssyhX83xIDOVmD9QK8W7khWPIZcQYY=",
        "https://media.istockphoto.com/id/1372048548/photo/professional-cook-hold-saltcellar-and-add-salt-to-soup-against-kitchen-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=rOnmBF_rSmKzrEIbEWViVLxNxN0OWTaOzPbPe39b7b4=",
        "https://media.istockphoto.com/id/1125036641/photo/salt-large-sea-and-small-kitchen-in-silver-spoons-on-a-black-stone-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=0OqAw8KZK5I4bdWGHk4xzdiRtnp7e4qfkI2L-S4w9vk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 33,
      name: "Salt",
      weight: "2 kg",
      price: "₹38.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Salt is an essential mineral primarily composed of sodium chloride. It is used as a seasoning and preservative in cooking and has a vital role in maintaining bodily functions.",
      rating: "4.6",
      category: "Salt",
      image:
          "https://media.istockphoto.com/id/1051727580/photo/crystals-of-shallow-salt-in-a-scoop-spoon-on-a-dark-gray-table-background-for-advertising.webp?a=1&b=1&s=612x612&w=0&k=20&c=95mUU2y-pfS14A7uXuDVduAzm7FUo3PRHDr603d_wgY=",
      relatedImages: [
        "https://media.istockphoto.com/id/1005987174/photo/inscription-sugar-and-salt-on-grey-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=F2BlpPttDvaAOssyhX83xIDOVmD9QK8W7khWPIZcQYY=",
        "https://media.istockphoto.com/id/1372048548/photo/professional-cook-hold-saltcellar-and-add-salt-to-soup-against-kitchen-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=rOnmBF_rSmKzrEIbEWViVLxNxN0OWTaOzPbPe39b7b4=",
        "https://media.istockphoto.com/id/1125036641/photo/salt-large-sea-and-small-kitchen-in-silver-spoons-on-a-black-stone-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=0OqAw8KZK5I4bdWGHk4xzdiRtnp7e4qfkI2L-S4w9vk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 34,
      name: "Quinoa",
      weight: "500 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Quinoa is a gluten-free seed that is high in protein and contains all nine essential amino acids. It is often used as a substitute for rice and is popular in healthy diets.",
      rating: "4.6",
      category: "Staples & Grains",
      image:
          "https://media.istockphoto.com/id/488547660/photo/quinoa-and-quinoa-flour.webp?a=1&b=1&s=612x612&w=0&k=20&c=VEM-qDt5za9OBdMv10ZiQebW8sq5mL46A8A93Osc7xc=",
      relatedImages: [
        "https://media.istockphoto.com/id/172281994/photo/andean-cereal.webp?a=1&b=1&s=612x612&w=0&k=20&c=mvI976bjZ2ESgUnVolDwSoNFJHD88wKfQCD4qUpYvzY=",
        "https://media.istockphoto.com/id/857099258/photo/quinoa-salad.webp?a=1&b=1&s=612x612&w=0&k=20&c=WU-jl9IkNH5M45eksAUPiKOt4y2qsJ9nGTqB1gBLV6g=",
        "https://media.istockphoto.com/id/1308141143/photo/a-bowl-full-of-quinoa-khichdi-weight-loss-recepie.webp?a=1&b=1&s=612x612&w=0&k=20&c=Pp_TC-FvuhSaXlrXWgrJXxG-XYF3ALrQKZ2l977CBTY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 35,
      name: "Apple",
      weight: "1 kg",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Apples are crisp, juicy fruits that are rich in dietary fiber and vitamin C. They come in various varieties such as Fuji, Gala, and Granny Smith, making them a popular choice for snacks and desserts.",
      rating: "4.8",
      category: "Fruits",
      image:
          "https://media.istockphoto.com/id/1276397071/photo/juicy-apples-placed-on-a-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=jXly8GBW5DPeAuwNOs0JGbV4-4-vbQgUOgf3R6-rJvs=",
      relatedImages: [
        "https://media.istockphoto.com/id/1127731060/photo/healthy-eating-pretty-girl-biting-fresh-apple.webp?a=1&b=1&s=612x612&w=0&k=20&c=Biw1grE0yxt4L3hVrujcwZU8PQPEghXYiBuBO2k0f9s=",
        "https://media.istockphoto.com/id/1301325736/photo/portrait-of-young-woman-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=efBJOSxKUzTfrBPBQbJcNppFq4YcdgtajPyf-zWb7SY=",
        "https://media.istockphoto.com/id/1496340196/photo/apple.webp?a=1&b=1&s=612x612&w=0&k=20&c=NiDFmzxodZAJHG9N47owINkp27HB2hlyY8v98PJrf2c=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 36,
      name: "Banana",
      weight: "1 kg",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Bananas are a rich source of potassium and energy-boosting carbohydrates. They are widely consumed as a snack or added to smoothies and desserts.",
      rating: "4.7",
      category: "Fruits",
      image:
          "https://media.istockphoto.com/id/1494763483/photo/banana-concept.webp?a=1&b=1&s=612x612&w=0&k=20&c=NKgZvwkV4qwBdRPNyrUMVX2Xtczm65sT-_X5jEySQLg=",
      relatedImages: [
        "https://media.istockphoto.com/id/526766433/photo/peeling-a-banana-in-the-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=1JiZ9_NVMaOwII4R3tDDHLMaBPvxYnGXfVsVMYAQJ0k=",
        "https://media.istockphoto.com/id/1291625666/photo/banana-fruit-in-the-cart.webp?a=1&b=1&s=612x612&w=0&k=20&c=d33w7siMngaa8nsl7gB9zu0rRgNlAANgpYJv3QbFhkg=",
        "https://media.istockphoto.com/id/1341372419/photo/bunch-of-yellow-ripe-bananas-on-a-dark-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=_viq_mSKYos7XHyu1TX4hHGjRBC8VpfJwcPkiR9glgw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 37,
      name: "Orange",
      weight: "1 kg",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Oranges are citrus fruits known for their vibrant flavor and high vitamin C content. They are often eaten fresh or used in juices and desserts.",
      rating: "4.6",
      category: "Fruits",
      image:
          "https://media.istockphoto.com/id/923399162/photo/close-up-of-fresh-ripe-oranges-citrus-aurantium-without-peel-on-wooden-surface.webp?a=1&b=1&s=612x612&w=0&k=20&c=c-n_udq55V5PWNGrwO4wUd8dig6Uug_4AIat3gIOaQc=",
      relatedImages: [
        "https://media.istockphoto.com/id/1091565360/photo/bowl-of-fresh-orange-fruit-salad.webp?a=1&b=1&s=612x612&w=0&k=20&c=GIDBH3jghNz3UqvI2r7E9MKmaWBysKwRnMnmvYQJhsM=",
        "https://media.istockphoto.com/id/1207074330/photo/close-up-of-womans-hand-buying-fresh-oranges-from-fruit-shop.webp?a=1&b=1&s=612x612&w=0&k=20&c=Bozvcqmf9qv_TECp2kEIZIFzNIXVUTDJPEuhCWl6gxM=",
        "https://media.istockphoto.com/id/1249115936/photo/pretty-woman-holding-glass-with-tasty-juice.webp?a=1&b=1&s=612x612&w=0&k=20&c=NUhgW9H5aBlbJewScxsBdBhTu2m0VhtYzdp3YqpHjrM=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 38,
      name: "Grapes",
      weight: "500 gm",
      price: "₹90.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Grapes are sweet, juicy fruits available in green, red, or black varieties. They are rich in antioxidants and commonly consumed fresh or as raisins.",
      rating: "4.5",
      category: "Fruits",
      image:
          "https://media.istockphoto.com/id/952308852/photo/hand-of-farmer-in-september-check-and-collects-the-selected-grape-bunches-in-india-maharastra.webp?a=1&b=1&s=612x612&w=0&k=20&c=SdDnoAaj1hlc83U5Gmpmbh9RmggGMH3B1gVMRhQ1P8E=",
      relatedImages: [
        "https://media.istockphoto.com/id/489520104/photo/green-grape-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=wgd0VVD_5P7LNMmnstGQ4FaG1FsLaIwCSxkyfuxXsNo=",
        "https://media.istockphoto.com/id/514110388/photo/white-wine-grapes-wachau.webp?a=1&b=1&s=612x612&w=0&k=20&c=dPnhD5O1INa2R7o61mtDSd5GvYGfXl-HXDrqxRg2QCI=",
        "https://media.istockphoto.com/id/1790901317/photo/delicious-shine-muscat-on-jute-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2SfJOHz3lKsgq-eIZ61JIQcfTDiegyRM4jL5eW1KupM=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 39,
      name: "Mango",
      weight: "1 kg",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Mangoes are tropical fruits prized for their sweet, juicy flesh and distinct aroma. Known as the 'king of fruits,' they are rich in vitamins A and C.",
      rating: "4.9",
      category: "Fruits",
      image:
          "https://media.istockphoto.com/id/1018458760/photo/sliced-and-dried-mango.webp?a=1&b=1&s=612x612&w=0&k=20&c=pvx1424Wn9kJI-vVnCrfrwg_USYeQJJecwI22Dyz7x0=",
      relatedImages: [
        "https://media.istockphoto.com/id/688858728/photo/girl-eating-mango.webp?a=1&b=1&s=612x612&w=0&k=20&c=kWa4DnVfrKV7HrMDstbjvTrWcbeePcTTsWtCW4Dg72U=",
        "https://media.istockphoto.com/id/1318973540/photo/indian-alphonso-mango-fruits-in-grass-closeup.webp?a=1&b=1&s=612x612&w=0&k=20&c=wQWrNbWQgsJbWUSx3a7thHRVLld3DxrVWrTAcyf_dU0=",
        "https://media.istockphoto.com/id/1398814319/photo/indian-mangoes-in-basket-blue-dark-background-close-up-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=tbT1cRMy7dD6wU167vj39UuEA8FD78s8NgMZLbCY9ZU=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 40,
      name: "Pineapple",
      weight: "1 kg",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Pineapples are tropical fruits with a tangy, sweet flavor. They are rich in bromelain and vitamin C, making them a nutritious addition to salads and desserts.",
      rating: "4.7",
      category: "Fruits",
      image:
          "https://media.istockphoto.com/id/1217479737/photo/pineapple-with-slices-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=e0fBVPuUPeYveDcS5pP1K9CeXg7rRpdsdNxe22GtAGc=",
      relatedImages: [
        "https://media.istockphoto.com/id/1064819674/photo/whole-with-slice-ripe-pineapple-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=MGP1PF-OUPyORsilW7ijYXYQLgGXnPsjsKnnK-DYYl0=",
        "https://media.istockphoto.com/id/1681770441/photo/pineapple-fruits-in-the-market-for-sale-close-up-of-the-fruit.webp?a=1&b=1&s=612x612&w=0&k=20&c=lCo-RDoKMrBnBMxMLMEZ3AKG3vpWb057bp0gOZBPI0g=",
        "https://media.istockphoto.com/id/1297467444/photo/thai-red-curry-dinner.webp?a=1&b=1&s=612x612&w=0&k=20&c=J8XCwWoowOE4XC4dsZy_XJ7FPCj3qGMonJzWVFegy_A=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 41,
      name: "Potato",
      weight: "1 kg",
      price: "₹30.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Potatoes are versatile root vegetables rich in carbohydrates and essential nutrients like potassium and vitamin C. They are widely used in various cuisines worldwide.",
      rating: "4.7",
      category: "Vegetables",
      image:
          "https://media.istockphoto.com/id/486744244/photo/raw-potatoes-on-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=74xwz6i9OEy9ZKe_anieflxKwrVtBHh4NMTetU7ZR24=",
      relatedImages: [
        "https://media.istockphoto.com/id/1042509866/photo/potato-curry.webp?a=1&b=1&s=612x612&w=0&k=20&c=pMjs9ivx5fs-iKbTlOSSQ4a0u6Wf5eQhZxbbut2_BAE=",
        "https://media.istockphoto.com/id/1045012086/photo/fresh-potatoes-on-wooden-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=N089kEXbjwP5unjFY5kFIOGeY44rhY0bgyHeQ36u07M=",
        "https://media.istockphoto.com/id/173588803/photo/cooking-vegtables.webp?a=1&b=1&s=612x612&w=0&k=20&c=9CPOdzCFzZha5MqZv9djvmYrc4xWufqZpwFATrbdkBQ=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 42,
      name: "Tomato",
      weight: "1 kg",
      price: "₹40.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Tomatoes are juicy, red vegetables rich in antioxidants like lycopene. They are essential in salads, sauces, and numerous culinary dishes.",
      rating: "4.6",
      category: "Vegetables",
      image:
          "https://media.istockphoto.com/id/1095798054/photo/fresh-tomatoes-in-a-box.webp?a=1&b=1&s=612x612&w=0&k=20&c=UVnVRQ0TfdTL4Y_E5HVhpAJUxk4oZ1r9ny8atZbm-D8=",
      relatedImages: [
        "https://media.istockphoto.com/id/916607718/photo/cut-red-tomatoes-into-cubes.webp?a=1&b=1&s=612x612&w=0&k=20&c=kgaV81wYZwCnhl0x16DqFKBJkG3UrwfQwJZ7TUQCWE4=",
        "https://media.istockphoto.com/id/1026718000/photo/tomato-rasam-kerala-style-south-indian-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=IaczZvXCL2UkC9H6NR4VK3TiOtwJNVeUix-jg6XFkUE=",
        "https://media.istockphoto.com/id/916607718/photo/cut-red-tomatoes-into-cubes.webp?a=1&b=1&s=612x612&w=0&k=20&c=kgaV81wYZwCnhl0x16DqFKBJkG3UrwfQwJZ7TUQCWE4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 43,
      name: "Onion",
      weight: "1 kg",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Onions are aromatic bulbs used as a base ingredient in many dishes. They are rich in vitamins and antioxidants and enhance the flavor of meals.",
      rating: "4.8",
      category: "Vegetables",
      image:
          "https://media.istockphoto.com/id/1149368747/photo/close-up-of-glass-bowl-full-of-extracted-onion-pulp-in-it-and-raw-onions-or-pyaaj-or-allium.webp?a=1&b=1&s=612x612&w=0&k=20&c=-5YvNvp16gR7l4ns2bnXJBCc05vJcxzCSvoWTEPJOJ0=",
      relatedImages: [
        "https://media.istockphoto.com/id/1405409411/photo/glass-of-red-onion-juice.webp?a=1&b=1&s=612x612&w=0&k=20&c=9pGFLILo-nNYRbZoyUu_K-G28m4_9ZLpqAmH0rVItRM=",
        "https://media.istockphoto.com/id/174911843/photo/dambulla-sri-lanka.webp?a=1&b=1&s=612x612&w=0&k=20&c=YTTEFAqWmVwS7JBHMKR4Bq3WtER6GNkodxNqudGwKVA=",
        "https://media.istockphoto.com/id/857924860/photo/onion-and-garlic.webp?a=1&b=1&s=612x612&w=0&k=20&c=hQt9KiW35liBqNUr6C0gUqNJCG7VXSj_7uyAwY3IRAo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 44,
      name: "Carrot",
      weight: "500 gm",
      price: "₹35.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Carrots are crunchy root vegetables high in beta-carotene and vitamin A, making them excellent for eye health and overall nutrition.",
      rating: "4.5",
      category: "Vegetables",
      image:
          "https://media.istockphoto.com/id/917581076/photo/fresh-carrot-with-slice-on-wooden-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=QWE-oEX9KnEVIQl53bFNRBELK83DLsAianJLu04m_R4=",
      relatedImages: [
        "https://media.istockphoto.com/id/502447580/photo/pretty-young-woman-eating-carrot-in-the-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=fGSZn4t9fnDdE3cs-m6sglCzu2XYncRPBYORuLEHaGc=",
        "https://media.istockphoto.com/id/1196944815/photo/fresh-red-carrot-bunch-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=C_9kjIH-GVl0oehjd_DTxJ4EP2k_LV2HCQhTVHpAP8o=",
        "https://media.istockphoto.com/id/917581076/photo/fresh-carrot-with-slice-on-wooden-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=QWE-oEX9KnEVIQl53bFNRBELK83DLsAianJLu04m_R4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 45,
      name: "Cauliflower",
      weight: "1 kg",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cauliflower is a cruciferous vegetable packed with vitamins and fiber. It is a low-calorie option, often used in curries, stir-fries, and soups.",
      rating: "4.6",
      category: "Vegetables",
      image:
          "https://media.istockphoto.com/id/2076709341/photo/hand-holding-fresh-organic-cauliflower-with-the-blurry-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=bOOtTt_ydWeqXnfuqvEmGi0__aiLYBuV83JuT8M6Xf8=",
      relatedImages: [
        "https://media.istockphoto.com/id/1126852101/photo/dry-gobi-masala-cauliflower-sabzi-served-in-a-bowl-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=84oJHRB2IlH4fIaC7jUBMh6QYZGyhsOoswVVk387PZU=",
        "https://media.istockphoto.com/id/1069106302/photo/falling-cauliflower-isolated-on-white-background-clipping-path-full-depth-of-field.webp?a=1&b=1&s=612x612&w=0&k=20&c=eN2gt0Eg70UzW2qYblUkg-NVoWYB43IVXizuCrVI32w=",
        "https://media.istockphoto.com/id/1214565325/photo/mix-veg-sabji-or-sabzi.webp?a=1&b=1&s=612x612&w=0&k=20&c=sBIUdiVsH8x0Twt2tEJY5vKkPycHJ052zjFlBMCnYjo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 46,
      name: "Spinach",
      weight: "1 kg",
      price: "₹25.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Spinach is a leafy green vegetable rich in iron, calcium, and vitamins. It is commonly used in salads, smoothies, and cooked dishes for its nutritional benefits.",
      rating: "4.7",
      category: "Vegetables",
      image:
          "https://media.istockphoto.com/id/917210964/photo/fresh-spinach.webp?a=1&b=1&s=612x612&w=0&k=20&c=CUllVHunPyOz2KTyErLRDILNUzcc-06_yZEstwWBrHQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/1221628521/photo/spinach-and-green-pea-soup-with-grilled-corn.webp?a=1&b=1&s=612x612&w=0&k=20&c=Ft0qaAIvr1FI7QlO8tTZJJHVIXXwzbbEXD2GTKME4c4=",
        "https://media.istockphoto.com/id/1076496922/photo/malabar-spinach-or-ceylon-spinach-isolated-fresh-green-vegetable.webp?a=1&b=1&s=612x612&w=0&k=20&c=jWPcrPVN3cuJ7rdKs8iN4iHk9T-qhUuh2hN9ih-Zz5Y=",
        "https://media.istockphoto.com/id/1221628521/photo/spinach-and-green-pea-soup-with-grilled-corn.webp?a=1&b=1&s=612x612&w=0&k=20&c=Ft0qaAIvr1FI7QlO8tTZJJHVIXXwzbbEXD2GTKME4c4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 47,
      name: "Chips",
      weight: "200 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Chips are thinly sliced, fried, or baked snacks, usually made from potatoes. They come in a variety of flavors, such as salted, spicy, and tangy.",
      rating: "4.5",
      category: "Snacks",
      image:
          "https://media.istockphoto.com/id/1426270938/photo/potato-wafer-aloo-chips.webp?a=1&b=1&s=612x612&w=0&k=20&c=AqOgnWxRFXpF8QEGJEJ140dfomz3vwSwm8Sz4mdbhrE=",
      relatedImages: [
        "https://media.istockphoto.com/id/1464171102/photo/bowl-of-crispy-wavy-potato-chips-or-crisps-with-chili-pepper-flavor.webp?a=1&b=1&s=612x612&w=0&k=20&c=gi967Bh_Hr2ACl7qC9iLOD-h9vd2E5ZOvrMo891ga8M=",
        "https://media.istockphoto.com/id/899662866/photo/potato-chips-in-an-open-bag.webp?a=1&b=1&s=612x612&w=0&k=20&c=LNBus8nUcOKHjzUd0qxpb3QoWzxzGpJql62fY557WyU=",
        "https://media.istockphoto.com/id/1652886461/photo/pile-of-fresh-potato-chips-isolated-close-up-on-a-white-background-isolated-potato-chips.webp?a=1&b=1&s=612x612&w=0&k=20&c=COA8zhhrqpMH5GCpKCSTLSreCQ3cc9-sG7XMvqUM2zo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 48,
      name: "Cookies",
      weight: "150 gm",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cookies are sweet baked snacks made with flour, sugar, and butter. Often enhanced with chocolate chips, nuts, or raisins, they are a popular treat.",
      rating: "4.7",
      category: "Snacks",
      image:
          "https://media.istockphoto.com/id/2019988723/photo/ragi-cookies-or-finger-millet-cookies-delight-in-wholesome-goodness-with-these-delectable.webp?a=1&b=1&s=612x612&w=0&k=20&c=OJLg40-enyiFdGPVh6UP0xFNQQZfv0pgUqYHb2XyBb0=",
      relatedImages: [
        "https://media.istockphoto.com/id/1196704286/photo/glucose-biscuits-with-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=euVgJERu5ChnBZUakFfFa7tteeBoXj2zfOon1A7tspw=",
        "https://media.istockphoto.com/id/1764794643/photo/generic-brandless-sandwich-cookies-with-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=nGc6UbKAchioizjmRPsztAsATBH4YCQBZB_nbXyjIuA=",
        "https://media.istockphoto.com/id/941695046/photo/danish-butter-cookies-butter-cookies-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=E10CsCNHkbIjZPKrdGjT-rq1Nge8HVC0Ac0h2ak7KLw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 49,
      name: "Namkeen",
      weight: "250 gm",
      price: "₹40.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Namkeen refers to a variety of savory Indian snacks made from ingredients like gram flour, spices, and nuts. Popular types include sev, bhujiya, and chivda.",
      rating: "4.6",
      category: "Snacks",
      image:
          "https://media.istockphoto.com/id/2171070237/photo/spicy-bhujia-crispy-snack-on-a-white-plate-on-light-wooden-surface-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=FIdg4nEzUI7yX47LYnHVvBWP_xHTQmQuaeeEHBvW7JA=",
      relatedImages: [
        "https://media.istockphoto.com/id/1794777266/photo/crispy-and-crunchy-methi-mathri-is-a-popular-tea-time-snack-in-north-india-its-especially.webp?a=1&b=1&s=612x612&w=0&k=20&c=5jT2Hjmzjk8GtiTm7IHYTsqwNtpyAuvuicGF6IwOwYA=",
        "https://media.istockphoto.com/id/1156130293/photo/group-of-gujarati-snacks-like-jalebi-fafda-thepla-khaman-dhokla-aloo-bhujiya-khandvi-khakra.webp?a=1&b=1&s=612x612&w=0&k=20&c=7SgQryng4KNiZ7h_5dhQVhp4_Vph8U9a1Z9s2JJEfwg=",
        "https://media.istockphoto.com/id/1603554458/photo/close-up-of-rich-and-spicy-makhana-mix-indian-namkeen.webp?a=1&b=1&s=612x612&w=0&k=20&c=nOyiHJ7jVDDXvZ2oA0AGzFTnSvb5jBcmSOPV0LvNRtw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 50,
      name: "Popcorn",
      weight: "100 gm",
      price: "₹30.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Popcorn is a light and fluffy snack made from heated corn kernels. Often enjoyed in salted, buttery, or caramelized flavors, it is a favorite at movie nights.",
      rating: "4.8",
      category: "Snacks",
      image:
          "https://media.istockphoto.com/id/1097126662/photo/a-wooden-bowl-of-salted-popcorn-at-the-old-wooden-table-dark-background-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=r59WwLlLDnRHVuJ-oWR0wlrCkN_Arbr-27po41x9WEU=",
      relatedImages: [
        "https://media.istockphoto.com/id/613134972/photo/chicken-delicious-homemade-popcorn.webp?a=1&b=1&s=612x612&w=0&k=20&c=OrVmJpu3qomZdBD4s49uTDEawmnmREewYoR3Up7vuio=",
        "https://media.istockphoto.com/id/2068529080/photo/popcorn.webp?a=1&b=1&s=612x612&w=0&k=20&c=9DP_pDK62cJxJ9XoaBgewFX_u1exI3dSkUQ4NVlo6Yk=",
        "https://media.istockphoto.com/id/1343136275/photo/young-woman-watching-tv-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=WUP1vYNoKpfQdZ6ZC6bst4A14hao28xyfO5x4fBoJd8=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 51,
      name: "Biscuits",
      weight: "200 gm",
      price: "₹25.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Biscuits are crisp baked snacks, often enjoyed with tea or coffee. They come in sweet and savory varieties, suitable for all age groups.",
      rating: "4.4",
      category: "Snacks",
      image:
          "https://media.istockphoto.com/id/1196704286/photo/glucose-biscuits-with-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=euVgJERu5ChnBZUakFfFa7tteeBoXj2zfOon1A7tspw=",
      relatedImages: [
        "https://media.istockphoto.com/id/1196704286/photo/glucose-biscuits-with-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=euVgJERu5ChnBZUakFfFa7tteeBoXj2zfOon1A7tspw=",
        "https://media.istockphoto.com/id/1764794643/photo/generic-brandless-sandwich-cookies-with-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=nGc6UbKAchioizjmRPsztAsATBH4YCQBZB_nbXyjIuA=",
        "https://media.istockphoto.com/id/941695046/photo/danish-butter-cookies-butter-cookies-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=E10CsCNHkbIjZPKrdGjT-rq1Nge8HVC0Ac0h2ak7KLw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 52,
      name: "Chocolates",
      weight: "100 gm",
      price: "₹70.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Chocolates are sweet confections made from cacao. They come in various forms such as milk chocolate, dark chocolate, and white chocolate, loved by all ages.",
      rating: "4.9",
      category: "Snacks",
      image:
          "https://media.istockphoto.com/id/1276645382/photo/chocolate-assortment-background-top-view-of-different-kinds-of-chocolate.webp?a=1&b=1&s=612x612&w=0&k=20&c=6dlz_FpuIBFgvo9f8rtNQkzMcbdPT1ALIHEr8lhc6j0=",
      relatedImages: [
        "https://media.istockphoto.com/id/1880291935/photo/blueberry-vanilla-ice-cream-chocolate-shake-served-in-glass-isolated-on-table-side-view-of.webp?a=1&b=1&s=612x612&w=0&k=20&c=Wh9hQJV-jyO__Bid44zVAvM9NP_-Pl4Lhi-Qg6CrMYU=",
        "https://media.istockphoto.com/id/1301349141/photo/chocolate-dripping-on-a-chocolate-bar.webp?a=1&b=1&s=612x612&w=0&k=20&c=FKq5UE7puvxg9E5qcT21x811tCefuveKdZw7Xfps_X0=",
        "https://media.istockphoto.com/id/1273256770/photo/girl-eating-chocolate-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=JQR5nRTNxk5hTUC5DZXBFYeo7ReEpDfS46_JNQjMV-A=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 53,
      name: "Tea",
      weight: "500 gm",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Tea is a popular beverage made by steeping cured leaves of the Camellia sinensis plant in hot water. It is available in various types such as black, green, and herbal tea.",
      rating: "4.6",
      category: "Beverages",
      image:
          "https://media.istockphoto.com/id/1346551687/photo/wheat-biscuits.webp?a=1&b=1&s=612x612&w=0&k=20&c=0C9SNHZt2zo0VQQ7rSUdVd0SnkGyXuhBPkRro5cFaMY=",
      relatedImages: [
        "https://media.istockphoto.com/id/180727475/photo/cup-of-english-breakfast-tea-and-leaves-overhead.webp?a=1&b=1&s=612x612&w=0&k=20&c=BNhS7rMGsyO0FSzjnuvVui-nY6OBioJe6l1C_5crApU=",
        "https://media.istockphoto.com/id/1293325385/photo/healthy-green-tea-with-ingredients-cloves.webp?a=1&b=1&s=612x612&w=0&k=20&c=yLk6ZjwyED84UW5v-7fiZ0WtqmxojRU3mac-S3fP2Go=",
        "https://media.istockphoto.com/id/170488043/photo/ginger-tea.webp?a=1&b=1&s=612x612&w=0&k=20&c=HceAg151AVHnjkC61ZKt5awh8tpW1Z-35wOO1B_x68A=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 54,
      name: "Coffee",
      weight: "250 gm",
      price: "₹400.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Coffee is a brewed beverage made from roasted coffee beans. Known for its rich aroma and caffeine content, it is a staple for energy and refreshment.",
      rating: "4.8",
      category: "Beverages",
      image:
          "https://media.istockphoto.com/id/1145612951/photo/how-to-make-coffee-latte-art.webp?a=1&b=1&s=612x612&w=0&k=20&c=naAe7fACi95VeG3Vdw9RTTScyKmk2deUOKJce4Y4xss=",
      relatedImages: [
        "https://media.istockphoto.com/id/1090012772/photo/ground-coffee-in-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=qaAjv1M-S9gQbFldZUraL-NqAe8MQpPs77E1tIFTQKE=",
        "https://media.istockphoto.com/id/1201485546/photo/homemade-coffee-scrub-face-mask-in-wooden-bowl-with-spoon-on-coffee-beans.webp?a=1&b=1&s=612x612&w=0&k=20&c=VuHclysEnX3ZzCfrKIBDFeYEjNzvVYJOzJsqC68zRLg=",
        "https://media.istockphoto.com/id/1293484335/photo/hot-coffee.webp?a=1&b=1&s=612x612&w=0&k=20&c=XLYBdu4wxeRgvq63wY2Gw_WRO4_szp5mefS3qbw_B6M=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 55,
      name: "Juice",
      weight: "1 litre",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Juice is a refreshing drink made by extracting natural liquids from fruits or vegetables. It is rich in vitamins and often consumed for its health benefits.",
      rating: "4.5",
      category: "Beverages",
      image:
          "https://media.istockphoto.com/id/854321024/photo/fresh-beet-juice-in-glass-with-a-straw-on-a-wooden-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=gwAmo_QaKVVuD-U2Hu0jWCSlInHibXApMg2o-feSYDU=",
      relatedImages: [
        "https://media.istockphoto.com/id/2088134477/photo/tropical-breakfast-on-outdoor-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=hl_pVKPelP19Y-C6MljfyLMIJvPjnWLb1aTQ_yHIsoI=",
        "https://media.istockphoto.com/id/942773920/photo/aloe-vera-or-cactus-juice.webp?a=1&b=1&s=612x612&w=0&k=20&c=MmJ35FQAxLtrHvlVElBz6I65DMuv-yI5WrgY5YCALow=",
        "https://media.istockphoto.com/id/1405409411/photo/glass-of-red-onion-juice.webp?a=1&b=1&s=612x612&w=0&k=20&c=9pGFLILo-nNYRbZoyUu_K-G28m4_9ZLpqAmH0rVItRM=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 56,
      name: "Soft Drink",
      weight: "1.25 litre",
      price: "₹90.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Soft drinks are carbonated beverages available in various flavors such as cola, lemon-lime, and orange. They are popular refreshers, especially in social gatherings.",
      rating: "4.3",
      category: "Beverages",
      image:
          "https://media.istockphoto.com/id/1395240880/photo/a-well-chilled-and-delicious-drink.webp?a=1&b=1&s=612x612&w=0&k=20&c=aiQLDIzsCV5w_RdlvSECYF81ytS_EGOOw10DkIh4j2I=",
      relatedImages: [
        "https://media.istockphoto.com/id/2155699418/photo/watermelon-fresh-juice-with-mint-closeup-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=ihQ-uhHieKI5sY-A-Z3TuI0b1jBLNyHXmwffg0d1bTc=",
        "https://media.istockphoto.com/id/1449487502/photo/pouring-cold-drink-into-glass-from-plastic-bottle.webp?a=1&b=1&s=612x612&w=0&k=20&c=k8w54Ld6FQVKiG_woIVBxPn0FFLLSO74dXZjv-8Thwc=",
        "https://media.istockphoto.com/id/1560730907/photo/beautiful-young-woman-enjoys-her-summer-holiday-in-the-hills.webp?a=1&b=1&s=612x612&w=0&k=20&c=cbJ3nY7908Zeuf14w_fL2EAAQDbUH-Mm3oG8Sbwryy8=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 57,
      name: "Energy Drink",
      weight: "500 ml",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Energy drinks are functional beverages designed to boost energy and mental alertness. They typically contain caffeine, taurine, and other stimulants.",
      rating: "4.4",
      category: "Beverages",
      image:
          "https://media.istockphoto.com/id/153767348/photo/energy-drink-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=R_BLGZJanxyT8z8OhVBXMdSuna1COzEKap_SR9jRQCc=",
      relatedImages: [
        "https://media.istockphoto.com/id/1447457942/photo/close-up-of-many-colorful-cans-standing-in-a-rows.webp?a=1&b=1&s=612x612&w=0&k=20&c=kmH8Dh8kiHoOQ5fXWTxjCC-XZoQ8Xr-lquRkUbxC6OI=",
        "https://media.istockphoto.com/id/1138121584/photo/young-athletic-couple-hydrating-themselves-while-taking-a-break-after-exercising-in-a-city.webp?a=1&b=1&s=612x612&w=0&k=20&c=809n-GwXbt-lDWZbhT4F_JkxJ94rnbFlfOcFKrjn6QU=",
        "https://media.istockphoto.com/id/1488244539/photo/headshot-of-young-fitness-woman-drinking-energy-drink-outdoors.webp?a=1&b=1&s=612x612&w=0&k=20&c=6zz2Zye9uD6xRTM2xveV6d8qYNRovejnyvUkLuOFwZk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 58,
      name: "Milkshake",
      weight: "300 ml",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Milkshakes are creamy beverages made by blending milk, ice cream, and flavorings such as chocolate, strawberry, or vanilla. They are a favorite treat for all age groups.",
      rating: "4.7",
      category: "Beverages",
      image:
          "https://media.istockphoto.com/id/1286336843/photo/image-of-knickerbocker-glass-of-strawberry-milkshake-smoothie-topped-with-whipped-cream-and.webp?a=1&b=1&s=612x612&w=0&k=20&c=sQubKQ414YaB9KzvrZ2EEc2Lya-5UNeatcxsu5-gz9Y=",
      relatedImages: [
        "https://media.istockphoto.com/id/1150000171/photo/mango-smoothie-in-a-bottle-with-slices-of-mango-fruit.webp?a=1&b=1&s=612x612&w=0&k=20&c=3XxypAIzOvPZICYrTUju67QkWbfwfLpFKUD8Zmh7vlM=",
        "https://media.istockphoto.com/id/513590204/photo/caramel-cappuccino-hits-coffee.webp?a=1&b=1&s=612x612&w=0&k=20&c=CZF4j9Ar0g1gjaNKTzIc2lOGdhLI0kzqj54l8EYYMlE=",
        "https://media.istockphoto.com/id/1880291935/photo/blueberry-vanilla-ice-cream-chocolate-shake-served-in-glass-isolated-on-table-side-view-of.webp?a=1&b=1&s=612x612&w=0&k=20&c=Wh9hQJV-jyO__Bid44zVAvM9NP_-Pl4Lhi-Qg6CrMYU=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 59,
      name: "Bread",
      weight: "400 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Bread is a staple food prepared from flour and water, typically baked. It comes in various types such as white, whole wheat, and multigrain.",
      rating: "4.5",
      category: "Bakery",
      image:
          "https://media.istockphoto.com/id/1289368014/photo/cut-of-loaf-bread-on-white-against-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2AEuphizc4w8lBJHeW-eNLSXe5lkcINJHumXUqV-9p8=",
      relatedImages: [
        "https://media.istockphoto.com/id/667841478/photo/bread-and-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=L4Vw5bdOM8FqKyMNyJK9KDw6qZH2p6qdyJ-9Pyd5-AY=",
        "https://media.istockphoto.com/id/1004827186/photo/sliced-bread-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=qdJbCASXgv4W-koz6L9fiG32JYOQiILpua68R8Wyr5M=",
        "https://media.istockphoto.com/id/1085139228/photo/paneer-tikka-sandwich-is-a-popular-indian-version-of-sandwich-using-cottage-cheese-curry-with.webp?a=1&b=1&s=612x612&w=0&k=20&c=gOlul1WNGJqjf-zaEOa1SyF52pFWPI8XHro7aSWi75g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 60,
      name: "Bread",
      weight: "400 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Bread is a staple food prepared from flour and water, typically baked. It comes in various types such as white, whole wheat, and multigrain.",
      rating: "4.5",
      category: "Bread",
      image:
          "https://media.istockphoto.com/id/1289368014/photo/cut-of-loaf-bread-on-white-against-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2AEuphizc4w8lBJHeW-eNLSXe5lkcINJHumXUqV-9p8=",
      relatedImages: [
        "https://media.istockphoto.com/id/667841478/photo/bread-and-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=L4Vw5bdOM8FqKyMNyJK9KDw6qZH2p6qdyJ-9Pyd5-AY=",
        "https://media.istockphoto.com/id/1004827186/photo/sliced-bread-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=qdJbCASXgv4W-koz6L9fiG32JYOQiILpua68R8Wyr5M=",
        "https://media.istockphoto.com/id/1085139228/photo/paneer-tikka-sandwich-is-a-popular-indian-version-of-sandwich-using-cottage-cheese-curry-with.webp?a=1&b=1&s=612x612&w=0&k=20&c=gOlul1WNGJqjf-zaEOa1SyF52pFWPI8XHro7aSWi75g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 61,
      name: "Multigrain Bread",
      weight: "500 gm",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Multigrain bread is made with a variety of grains such as wheat, oats, barley, and corn. It is a healthier option with more fiber and nutrients compared to regular white bread.",
      rating: "4.7",
      category: "Bread",
      image:
          "https://media.istockphoto.com/id/1289368014/photo/cut-of-loaf-bread-on-white-against-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2AEuphizc4w8lBJHeW-eNLSXe5lkcINJHumXUqV-9p8=",
      relatedImages: [
        "https://media.istockphoto.com/id/667841478/photo/bread-and-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=L4Vw5bdOM8FqKyMNyJK9KDw6qZH2p6qdyJ-9Pyd5-AY=",
        "https://media.istockphoto.com/id/1004827186/photo/sliced-bread-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=qdJbCASXgv4W-koz6L9fiG32JYOQiILpua68R8Wyr5M=",
        "https://media.istockphoto.com/id/1085139228/photo/paneer-tikka-sandwich-is-a-popular-indian-version-of-sandwich-using-cottage-cheese-curry-with.webp?a=1&b=1&s=612x612&w=0&k=20&c=gOlul1WNGJqjf-zaEOa1SyF52pFWPI8XHro7aSWi75g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 62,
      name: "Whole Wheat Bread",
      weight: "400 gm",
      price: "₹55.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Whole wheat bread is made from whole wheat flour, which contains the entire grain, making it more nutritious and high in fiber compared to white bread.",
      rating: "4.6",
      category: "Bread",
      image:
          "https://media.istockphoto.com/id/1289368014/photo/cut-of-loaf-bread-on-white-against-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2AEuphizc4w8lBJHeW-eNLSXe5lkcINJHumXUqV-9p8=",
      relatedImages: [
        "https://media.istockphoto.com/id/667841478/photo/bread-and-wheat.webp?a=1&b=1&s=612x612&w=0&k=20&c=L4Vw5bdOM8FqKyMNyJK9KDw6qZH2p6qdyJ-9Pyd5-AY=",
        "https://media.istockphoto.com/id/1004827186/photo/sliced-bread-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=qdJbCASXgv4W-koz6L9fiG32JYOQiILpua68R8Wyr5M=",
        "https://media.istockphoto.com/id/1085139228/photo/paneer-tikka-sandwich-is-a-popular-indian-version-of-sandwich-using-cottage-cheese-curry-with.webp?a=1&b=1&s=612x612&w=0&k=20&c=gOlul1WNGJqjf-zaEOa1SyF52pFWPI8XHro7aSWi75g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 63,
      name: "Cake",
      weight: "500 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cakes are sweet baked desserts made from flour, sugar, eggs, and butter. They are available in flavors like chocolate, vanilla, and red velvet.",
      rating: "4.7",
      category: "Bakery",
      image:
          "https://media.istockphoto.com/id/1278918978/photo/choco-chips-cake.webp?a=1&b=1&s=612x612&w=0&k=20&c=fHFG4DQzS4NfQ--ICnvbHKvUqigTM7MMMAma0UNb41A=",
      relatedImages: [
        "https://media.istockphoto.com/id/683023940/photo/berry-layer-cake-with-whipped-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=UVZEz7qY9y7oTFoi_e83TKpZG_E9qhM_zkT-n2yELbk=",
        "https://media.istockphoto.com/id/1890043696/photo/ragi-plantain-cake-gluten-free-tea-cake-made-of-finger-millet-flour-and-pureed-ripe-plantain.webp?a=1&b=1&s=612x612&w=0&k=20&c=s5Edt9qUeFxaKoIiOm44-zSAUlH5vDKPfK0DqB6aKZc=",
        "https://media.istockphoto.com/id/1497707612/photo/birthday-cake-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=Cy-GhMmx9u1wWGLsMODYeQ0J1TYVJ-2dEL_1kpWDFGw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 64,
      name: "Choco Chip Cake",
      weight: "500 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A rich and moist cake filled with choco chips, offering a delightful chocolate flavor.",
      rating: "4.7",
      category: "Cake",
      image:
          "https://media.istockphoto.com/id/1278918978/photo/choco-chips-cake.webp?a=1&b=1&s=612x612&w=0&k=20&c=fHFG4DQzS4NfQ--ICnvbHKvUqigTM7MMMAma0UNb41A=",
      relatedImages: [
        "https://media.istockphoto.com/id/683023940/photo/berry-layer-cake-with-whipped-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=UVZEz7qY9y7oTFoi_e83TKpZG_E9qhM_zkT-n2yELbk=",
        "https://media.istockphoto.com/id/1497707612/photo/birthday-cake-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=Cy-GhMmx9u1wWGLsMODYeQ0J1TYVJ-2dEL_1kpWDFGw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 65,
      name: "Red Velvet Cake",
      weight: "500 gm",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A luscious red velvet cake with a smooth cream cheese frosting, rich in flavor.",
      rating: "4.8",
      category: "Cake",
      image:
          "https://images.pexels.com/photos/17289681/pexels-photo-17289681/free-photo-of-still-life-with-a-layered-fruit-cake.jpeg?auto=compress&cs=tinysrgb&w=800",
      relatedImages: [
        "https://images.pexels.com/photos/17112299/pexels-photo-17112299/free-photo-of-cake-with-strawberries.jpeg?auto=compress&cs=tinysrgb&w=800",
        "https://images.pexels.com/photos/10520115/pexels-photo-10520115.jpeg?auto=compress&cs=tinysrgb&w=800",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 66,
      name: "Vanilla Sponge Cake",
      weight: "500 gm",
      price: "₹200.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A light and fluffy vanilla sponge cake, perfect for any occasion, topped with whipped cream.",
      rating: "4.6",
      category: "Cake",
      image:
          "https://images.pexels.com/photos/4040692/pexels-photo-4040692.jpeg?auto=compress&cs=tinysrgb&w=800",
      relatedImages: [
        "https://images.pexels.com/photos/7810774/pexels-photo-7810774.jpeg?auto=compress&cs=tinysrgb&w=800",
        "https://images.pexels.com/photos/8250151/pexels-photo-8250151.jpeg?auto=compress&cs=tinysrgb&w=800",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 67,
      name: "Carrot Cake",
      weight: "500 gm",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A moist and spiced carrot cake topped with a creamy cheese frosting, perfect for dessert lovers.",
      rating: "4.9",
      category: "Cake",
      image:
          "https://images.pexels.com/photos/1055271/pexels-photo-1055271.jpeg?auto=compress&cs=tinysrgb&w=800",
      relatedImages: [
        "https://images.pexels.com/photos/5594495/pexels-photo-5594495.jpeg?auto=compress&cs=tinysrgb&w=800",
        "https://images.pexels.com/photos/6061394/pexels-photo-6061394.jpeg?auto=compress&cs=tinysrgb&w=800",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 68,
      name: "Lemon Cake",
      weight: "500 gm",
      price: "₹280.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A zesty lemon cake with a light, fluffy texture, drizzled with a sweet lemon glaze.",
      rating: "4.6",
      category: "Cake",
      image:
          "https://images.pexels.com/photos/264939/pexels-photo-264939.jpeg?auto=compress&cs=tinysrgb&w=800",
      relatedImages: [
        "https://images.pexels.com/photos/20819946/pexels-photo-20819946/free-photo-of-cake-with-icing-in-overhead-view.jpeg?auto=compress&cs=tinysrgb&w=800",
        "https://images.pexels.com/photos/1098592/pexels-photo-1098592.jpeg?auto=compress&cs=tinysrgb&w=800",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 69,
      name: "Cookies",
      weight: "250 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cookies are small, flat baked treats made with flour, sugar, and butter. Varieties include chocolate chip, oatmeal, and peanut butter cookies.",
      rating: "4.6",
      category: "Bakery",
      image:
          "https://media.istockphoto.com/id/2019988723/photo/ragi-cookies-or-finger-millet-cookies-delight-in-wholesome-goodness-with-these-delectable.webp?a=1&b=1&s=612x612&w=0&k=20&c=OJLg40-enyiFdGPVh6UP0xFNQQZfv0pgUqYHb2XyBb0=",
      relatedImages: [
        "https://media.istockphoto.com/id/1196704286/photo/glucose-biscuits-with-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=euVgJERu5ChnBZUakFfFa7tteeBoXj2zfOon1A7tspw=",
        "https://media.istockphoto.com/id/1764794643/photo/generic-brandless-sandwich-cookies-with-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=nGc6UbKAchioizjmRPsztAsATBH4YCQBZB_nbXyjIuA=",
        "https://media.istockphoto.com/id/941695046/photo/danish-butter-cookies-butter-cookies-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=E10CsCNHkbIjZPKrdGjT-rq1Nge8HVC0Ac0h2ak7KLw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 70,
      name: "Pastries",
      weight: "200 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Pastries are flaky and rich baked goods often filled with cream, jam, or chocolate. Popular options include croissants, danishes, and éclairs.",
      rating: "4.8",
      category: "Bakery",
      image:
          "https://media.istockphoto.com/id/1263842540/photo/belgian-pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=1Mr0dZ-0-KxwHUE3FZgxxlQCtDzDWcoIJtZPGjBLMHQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/179640507/photo/strawberry-cheesecake.webp?a=1&b=1&s=612x612&w=0&k=20&c=nmEKULFhM9ktAs4_cvWksd1flmy1UESWIAbgX0jwSLQ=",
        "https://media.istockphoto.com/id/1607382510/photo/pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=z1QMsZW2qCLxnoabxdqbiQw0UOlH4voc5BvLoru0tJY=",
        "https://media.istockphoto.com/id/503135405/photo/mix-pastries.webp?a=1&b=1&s=612x612&w=0&k=20&c=kCjySexFZ6Ar8Muo2RDCQEyxzd8kUgdBYloLVBQdKVI=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 71,
      name: "Chocolate Eclair",
      weight: "150 gm",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A delicious eclair filled with rich chocolate cream and topped with a chocolate glaze.",
      rating: "4.9",
      category: "Pastries",
      image:
          "https://media.istockphoto.com/id/1263842540/photo/belgian-pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=1Mr0dZ-0-KxwHUE3FZgxxlQCtDzDWcoIJtZPGjBLMHQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/179640507/photo/strawberry-cheesecake.webp?a=1&b=1&s=612x612&w=0&k=20&c=nmEKULFhM9ktAs4_cvWksd1flmy1UESWIAbgX0jwSLQ=",
        "https://media.istockphoto.com/id/1607382510/photo/pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=z1QMsZW2qCLxnoabxdqbiQw0UOlH4voc5BvLoru0tJY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 72,
      name: "Strawberry Danish",
      weight: "200 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A flaky pastry with a sweet strawberry filling and a light glaze for a perfect treat.",
      rating: "4.7",
      category: "Pastries",
      image:
          "https://media.istockphoto.com/id/179640507/photo/strawberry-cheesecake.webp?a=1&b=1&s=612x612&w=0&k=20&c=nmEKULFhM9ktAs4_cvWksd1flmy1UESWIAbgX0jwSLQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/1607382510/photo/pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=z1QMsZW2qCLxnoabxdqbiQw0UOlH4voc5BvLoru0tJY=",
        "https://media.istockphoto.com/id/503135405/photo/mix-pastries.webp?a=1&b=1&s=612x612&w=0&k=20&c=kCjySexFZ6Ar8Muo2RDCQEyxzd8kUgdBYloLVBQdKVI=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 73,
      name: "Almond Croissant",
      weight: "180 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A buttery croissant filled with almond paste and topped with sliced almonds and sugar.",
      rating: "4.8",
      category: "Pastries",
      image:
          "https://media.istockphoto.com/id/1607382510/photo/pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=z1QMsZW2qCLxnoabxdqbiQw0UOlH4voc5BvLoru0tJY=",
      relatedImages: [
        "https://media.istockphoto.com/id/503135405/photo/mix-pastries.webp?a=1&b=1&s=612x612&w=0&k=20&c=kCjySexFZ6Ar8Muo2RDCQEyxzd8kUgdBYloLVBQdKVI=",
        "https://media.istockphoto.com/id/179640507/photo/strawberry-cheesecake.webp?a=1&b=1&s=612x612&w=0&k=20&c=nmEKULFhM9ktAs4_cvWksd1flmy1UESWIAbgX0jwSLQ=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 74,
      name: "Fruit Tart",
      weight: "250 gm",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A pastry filled with a rich custard and topped with a variety of fresh fruits like berries, kiwi, and mango.",
      rating: "4.7",
      category: "Pastries",
      image:
          "https://media.istockphoto.com/id/503135405/photo/mix-pastries.webp?a=1&b=1&s=612x612&w=0&k=20&c=kCjySexFZ6Ar8Muo2RDCQEyxzd8kUgdBYloLVBQdKVI=",
      relatedImages: [
        "https://media.istockphoto.com/id/179640507/photo/strawberry-cheesecake.webp?a=1&b=1&s=612x612&w=0&k=20&c=nmEKULFhM9ktAs4_cvWksd1flmy1UESWIAbgX0jwSLQ=",
        "https://media.istockphoto.com/id/1607382510/photo/pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=z1QMsZW2qCLxnoabxdqbiQw0UOlH4voc5BvLoru0tJY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 75,
      name: "Lemon Meringue Tart",
      weight: "220 gm",
      price: "₹160.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A tangy lemon custard topped with a light, fluffy meringue, encased in a buttery tart shell.",
      rating: "4.9",
      category: "Pastries",
      image:
          "https://media.istockphoto.com/id/179640507/photo/strawberry-cheesecake.webp?a=1&b=1&s=612x612&w=0&k=20&c=nmEKULFhM9ktAs4_cvWksd1flmy1UESWIAbgX0jwSLQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/503135405/photo/mix-pastries.webp?a=1&b=1&s=612x612&w=0&k=20&c=kCjySexFZ6Ar8Muo2RDCQEyxzd8kUgdBYloLVBQdKVI=",
        "https://media.istockphoto.com/id/1607382510/photo/pastry.webp?a=1&b=1&s=612x612&w=0&k=20&c=z1QMsZW2qCLxnoabxdqbiQw0UOlH4voc5BvLoru0tJY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 76,
      name: "Muffins",
      weight: "200 gm",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Muffins are small, cupcake-like baked goods made with a variety of ingredients like fruits, nuts, and chocolate chips.",
      rating: "4.4",
      category: "Bakery",
      image:
          "https://media.istockphoto.com/id/1607379778/photo/cup-cake.webp?a=1&b=1&s=612x612&w=0&k=20&c=R_8-Q-9hfSvnG0wui7CUOhyUpoDJUA54ELH579JF3iM=",
      relatedImages: [
        "https://media.istockphoto.com/id/183824656/photo/three-blueberry-muffins-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=Iuxly_0310zYWzdDOBSWKwmquJlV2388CMzfNDM-c_Q=",
        "https://media.istockphoto.com/id/1407174902/photo/double-chocolate-muffin-served-in-a-dish-side-view-on-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=cGkuQnEnIrRjzYfWVL3L2mQl0XnhO-tgQmH_OXb0pDA=",
        "https://media.istockphoto.com/id/155099605/photo/overcooked-cinnamon-and-sugar-muffin.webp?a=1&b=1&s=612x612&w=0&k=20&c=BAq2z_IYQBsOtq8XFZOR9wlaHEoKcfj4Ig89oOiRL-w=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 77,
      name: "Puff",
      weight: "150 gm",
      price: "₹40.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Puffs are savory baked pastries with a crispy outer layer and fillings such as vegetables, meat, or cheese. A popular snack option.",
      rating: "4.3",
      category: "Bakery",
      image:
          "https://media.istockphoto.com/id/1320806261/photo/close-up-of-cheese-potato-puff-snacks-ball-and-buds-popular-ready-to-eat-crunchy-and-puffed.webp?a=1&b=1&s=612x612&w=0&k=20&c=OAOVanmr1drd9e8oumTuR6HbPXyA7pr8c3qZ6epw60A=",
      relatedImages: [
        "https://media.istockphoto.com/id/1196704286/photo/glucose-biscuits-with-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=euVgJERu5ChnBZUakFfFa7tteeBoXj2zfOon1A7tspw=",
        "https://media.istockphoto.com/id/1764794643/photo/generic-brandless-sandwich-cookies-with-cream.webp?a=1&b=1&s=612x612&w=0&k=20&c=nGc6UbKAchioizjmRPsztAsATBH4YCQBZB_nbXyjIuA=",
        "https://media.istockphoto.com/id/941695046/photo/danish-butter-cookies-butter-cookies-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=E10CsCNHkbIjZPKrdGjT-rq1Nge8HVC0Ac0h2ak7KLw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 78,
      name: "Dishwashing Liquid",
      weight: "500 ml",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Dishwashing liquid is a detergent used to clean dishes, glasses, pots, and pans. It removes grease and food residue to make dishes sparkling clean.",
      rating: "4.6",
      category: "Household Cleaning",
      image:
          "https://media.istockphoto.com/id/1150794815/photo/washing-dishes.webp?a=1&b=1&s=612x612&w=0&k=20&c=GsldTGS2H_h19TVUdu4RpqZEO_94V1vLLjnMUQMqMgs=",
      relatedImages: [
        "https://media.istockphoto.com/id/1368046747/photo/a-woman-holding-a-bottle-of-dish-detergent-in-her-hand.webp?a=1&b=1&s=612x612&w=0&k=20&c=a95ngMNXB0hwHS6Id8AlBmjKiSHeEVFAtwqoa5e5Pbw=",
        "https://media.istockphoto.com/id/157189160/photo/dish-soap.webp?a=1&b=1&s=612x612&w=0&k=20&c=Qc2IfL1o0skSI_cSjg_fWL8wXvlZH8GSP-kZWtU5Jnk=",
        "https://media.istockphoto.com/id/167172953/photo/dishwashing.webp?a=1&b=1&s=612x612&w=0&k=20&c=L-hZxPkyP8iwMGPkrKA4vCYPbUL1Kus9GxHt977t3D4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 79,
      name: "Floor Cleaner",
      weight: "1 litre",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Floor cleaner is a liquid cleaner used to remove dirt and stains from floors. It leaves the floor smelling fresh and shiny after use.",
      rating: "4.5",
      category: "Household Cleaning",
      image:
          "https://media.istockphoto.com/id/1055225650/photo/young-woman-cleaning-house.webp?a=1&b=1&s=612x612&w=0&k=20&c=95ksgr1fR3hTdK8IJcO-2IHM37TmeSuixXjNGPQpwjs=",
      relatedImages: [
        "https://media.istockphoto.com/id/1252949432/photo/barefoot-woman-cleaning-floor-with-wet-mop-pad-cropped-image.webp?a=1&b=1&s=612x612&w=0&k=20&c=7uky3J9DNyywe1ED8jYqvVoHW_aaOjwYQWoKfVzMLh0=",
        "https://media.istockphoto.com/id/1480372898/photo/housekeeping-cleaning-and-woman-maid-with-a-mop-to-clean-the-living-room-floor-at-a-house.webp?a=1&b=1&s=612x612&w=0&k=20&c=MUAormkncH2G31BVaKvNPavFiWxBpIBPZEOvxeX4ZAE=",
        "https://media.istockphoto.com/id/1252949432/photo/barefoot-woman-cleaning-floor-with-wet-mop-pad-cropped-image.webp?a=1&b=1&s=612x612&w=0&k=20&c=7uky3J9DNyywe1ED8jYqvVoHW_aaOjwYQWoKfVzMLh0=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 80,
      name: "Glass Cleaner",
      weight: "500 ml",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Glass cleaner is a liquid that helps in cleaning glass surfaces, leaving them streak-free and sparkling. It removes dust, smudges, and fingerprints.",
      rating: "4.7",
      category: "Household Cleaning",
      image:
          "https://media.istockphoto.com/id/665514702/photo/worker-cleans-the-windows-with-spray.webp?a=1&b=1&s=612x612&w=0&k=20&c=9q-U8TGh1uDPsg7LewAuaXDT9ETz2gCBAhPHOE-8rIc=",
      relatedImages: [
        "https://media.istockphoto.com/id/155379613/photo/domestic-window-cleaner.webp?a=1&b=1&s=612x612&w=0&k=20&c=4Qo8y_UcPIKdhQZ9CVYGRqvKPqbDReNEcxOwZ3-EsnU=",
        "https://media.istockphoto.com/id/628517790/photo/young-woman-cleaning-windows.webp?a=1&b=1&s=612x612&w=0&k=20&c=y9SmRPODIQG6tdSXzPgDI2Jjk60cqVY4IJ460wEOhTI=",
        "https://media.istockphoto.com/id/509535718/photo/car-care.webp?a=1&b=1&s=612x612&w=0&k=20&c=aQuEMdH4H2Nbl0Nr7IsJZq9UmxQf9tSfr_887PxOoZs=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 81,
      name: "Toilet Cleaner",
      weight: "500 ml",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Toilet cleaner is a powerful cleaner designed to disinfect and remove stains in the toilet bowl. It eliminates germs and leaves the area smelling fresh.",
      rating: "4.8",
      category: "Household Cleaning",
      image:
          "https://media.istockphoto.com/id/851802322/photo/scrubbing-toilet.webp?a=1&b=1&s=612x612&w=0&k=20&c=W3C-q0DKdZqlde_k1cma4RpnBpLJlWGU8PhOkEBatis=",
      relatedImages: [
        "https://media.istockphoto.com/id/939318210/photo/hand-with-glove-showing-thumb-up.webp?a=1&b=1&s=612x612&w=0&k=20&c=qq4RML0KE4ZPH-xm1fP2g5BUbuC5KqPdro-blaSYJlg=",
        "https://media.istockphoto.com/id/538478022/photo/woman-in-yellow-rubber-gloves-cleaning-toilet.webp?a=1&b=1&s=612x612&w=0&k=20&c=X5N8_04UEKvoaof5W5HkJFtBBuoq7u0tX8zAzAovslw=",
        "https://media.istockphoto.com/id/1196421953/photo/janitorial-car-preparing-for-cleaning-in-front-of-toilets.webp?a=1&b=1&s=612x612&w=0&k=20&c=HTqrxAxvVunTkXYcnkEhA0f6P71qjz9xbWrVEmCP5tk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 82,
      name: "Multi-Purpose Cleaner",
      weight: "1 litre",
      price: "₹200.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "A versatile cleaner suitable for use on various surfaces like countertops, sinks, and appliances. It disinfects and removes dirt, grime, and stains.",
      rating: "4.6",
      category: "Household Cleaning",
      image:
          "https://media.istockphoto.com/id/639346300/photo/dishwasher-tablet.webp?a=1&b=1&s=612x612&w=0&k=20&c=0R-_4EzB67Tzap6pL9-LaXF5fzZPQN2VjKDygnpLe0c=",
      relatedImages: [
        "https://media.istockphoto.com/id/1267141805/photo/the-process-of-cleaning-a-room-with-a-vacuum-cleaner-with-an-aquafilter-vacuum-cleaner-with.webp?a=1&b=1&s=612x612&w=0&k=20&c=CTCfSyjeWXLm59M14WDi93W609_o7dSvmB0KamwaJOs=",
        "https://media.istockphoto.com/id/117684376/photo/spray-bottle-with-clipping-path.webp?a=1&b=1&s=612x612&w=0&k=20&c=HOHUfvmBck6A1N2DbtUKyO3iW1nGmGBijengRZt9S3o=",
        "https://media.istockphoto.com/id/1218390412/photo/all-purpose-cleaner-made-of-natural-ingredients.webp?a=1&b=1&s=612x612&w=0&k=20&c=NZSnGBo6F7hUxdnnWNeG1Y1Nz_nxPnam9LkyXGJwj-k=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 83,
      name: "Laundry Detergent",
      weight: "1 kg",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Laundry detergent is a cleaning agent used for washing clothes. It helps in removing stains, dirt, and odors from fabrics, leaving clothes fresh and clean.",
      rating: "4.5",
      category: "Household Cleaning",
      image:
          "https://media.istockphoto.com/id/1413851648/photo/woman-adding-fabric-softener-or-detergent-to-a-washing-machine.webp?a=1&b=1&s=612x612&w=0&k=20&c=4ovZMUMjVyoevdmP_nbzPpyg_LjpAeYDvsp8HYWpfcE=",
      relatedImages: [
        "https://media.istockphoto.com/id/1297415755/photo/pouring-washing-liquid-in-washing-machine.webp?a=1&b=1&s=612x612&w=0&k=20&c=VcTgq6yoUmA39RpcSlW-bwkApIyV9UGWRQgm0w3cFMs=",
        "https://media.istockphoto.com/id/1413851648/photo/woman-adding-fabric-softener-or-detergent-to-a-washing-machine.webp?a=1&b=1&s=612x612&w=0&k=20&c=4ovZMUMjVyoevdmP_nbzPpyg_LjpAeYDvsp8HYWpfcE=",
        "https://media.istockphoto.com/id/1419454071/photo/household-chemical-plastic-bottle-isolated.webp?a=1&b=1&s=612x612&w=0&k=20&c=YUrVuMG6n7TkIHFDGRTwQoU0Y4gCw9fiH4qSO_ZeMo0=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 84,
      name: "Shampoo",
      weight: "500 ml",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Shampoo is a hair care product used to clean the scalp and hair. It removes dirt, oils, and sweat, leaving the hair fresh and manageable.",
      rating: "4.7",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/1213680761/photo/washing-hair-with-shampoo.webp?a=1&b=1&s=612x612&w=0&k=20&c=1zt4H9ZotTpjFZxDjVjjYUkQh-JPwO7CC_CZ2FS9wvA=",
      relatedImages: [
        "https://media.istockphoto.com/id/1349897515/photo/beauty-woman-wash-her-hair.webp?a=1&b=1&s=612x612&w=0&k=20&c=MWZwDQM1jQXp2dWpbN012xZVkfWVNRLfLf5oYkM5SF4=",
        "https://media.istockphoto.com/id/1159101586/photo/homemade-hair-conditioner-on-wooden-surface-of-devils-dung-powder-or-hing-powder-well-mixed.webp?a=1&b=1&s=612x612&w=0&k=20&c=V89G4bR7VYbNEwlWCbx_PPmu7-MYMsLOS6GJbaW8dJQ=",
        "https://media.istockphoto.com/id/1401000613/photo/bath-accessories-for-body-care-spa-beauty-treatment-and-skincare-concep.webp?a=1&b=1&s=612x612&w=0&k=20&c=to4L8M5ndhtobFzh0jubKCrOxv-_YEMiLfDhEmFsvZ4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 85,
      name: "Toothpaste",
      weight: "150 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Toothpaste is a gel or paste used with a toothbrush to clean and maintain the health of teeth. It helps in preventing cavities, plaque buildup, and bad breath.",
      rating: "4.8",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/950351556/photo/toothpaste-squeezed-out-from-a-toothpaste-tube.webp?a=1&b=1&s=612x612&w=0&k=20&c=NSb6ykrWGgbW4asIjXDKfQAi4jGs8JUGL8ceK54mSlI=",
      relatedImages: [
        "https://media.istockphoto.com/id/1289220935/photo/woman-applying-toothpaste-on-bamboo-toothbrush.webp?a=1&b=1&s=612x612&w=0&k=20&c=A2vpSWnM8syMoM_Tq6vTQHTnC5Sm_rOqAInz19gJcmQ=",
        "https://media.istockphoto.com/id/529417276/photo/ready-for-clening-teeth.webp?a=1&b=1&s=612x612&w=0&k=20&c=a0_5fa8Mq1_Baak5d06DNPrdFUsWgdnsnsbOe2B_txc=",
        "https://media.istockphoto.com/id/910543228/photo/toothpaste.webp?a=1&b=1&s=612x612&w=0&k=20&c=XMT-kZQl25sx5OMefnNXGRjp9hR2-soA68HvtNjOz0k=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 86,
      name: "Body Lotion",
      weight: "200 ml",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Body lotion is a moisturizer that helps hydrate and soften the skin. It is applied after showering to lock in moisture and keep skin smooth and healthy.",
      rating: "4.6",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/1343286165/photo/herbal-cream-cosmetic-in-a-container-on-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=osaXpvOcKtFvrXp2LPwEOOtJeI3JkQDMCQISROax3gE=",
      relatedImages: [
        "https://media.istockphoto.com/id/1312358174/photo/smudged-make-up-gradient-texture-palette-creamy-matte-beige-concealer-foundation-cc-or-bb.webp?a=1&b=1&s=612x612&w=0&k=20&c=i9NAdTB2PxR3YGVYGkRLJLSQOfi3hBcIAEAjbR1zEsg=",
        "https://media.istockphoto.com/id/1290731550/photo/portrait-of-a-young-woman-with-a-beautiful-smile-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=MymxqYfTsWdn3irIxLowTX8l7MhigFDau_pY2fCaTEY=",
        "https://media.istockphoto.com/id/1500186838/photo/young-woman-putting-on-makeup-while-looking-in-a-mirror-at-home.webp?a=1&b=1&s=612x612&w=0&k=20&c=fwEklEXaMf9YIM6GIliP6juyA1uA_nRjvsEVoXT2k6A=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 87,
      name: "Face Cream",
      weight: "50 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Face cream is a skincare product used to hydrate and nourish the skin. It helps improve skin texture and reduce signs of aging and dryness.",
      rating: "4.5",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/1207674159/photo/beauty-and-fashion.webp?a=1&b=1&s=612x612&w=0&k=20&c=EMt0ersrZVupmbrhnX5kBSbN-AT2ExCgYzLWbmYpD78=",
      relatedImages: [
        "https://media.istockphoto.com/id/1188193143/photo/close-up-of-a-woman-pouring-body-care-lotion-into-her-hand.webp?a=1&b=1&s=612x612&w=0&k=20&c=85jI30ND_LENzrIyoBvMovLqqPPs0hfIsrKOaBQG5FQ=",
        "https://media.istockphoto.com/id/1290579053/photo/beautiful-woman-with-towel-on-hair-and-cosmetic-cream-on-face-isolated-on-pink.webp?a=1&b=1&s=612x612&w=0&k=20&c=kbe0cIhOHtD56eVTfIyfEvqNH7bxuoI9A25CIJbKsBQ=",
        "https://media.istockphoto.com/id/1218975837/photo/moisturizing-is-what-keeps-your-skin-happy.webp?a=1&b=1&s=612x612&w=0&k=20&c=oi7BkhVpdTj13rpDRm69N9R0WKcPasSGhrqA-BP2P5o=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 88,
      name: "Shaving Cream",
      weight: "200 ml",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Shaving cream is a foam or gel used to soften the hair and provide a smooth surface for shaving. It helps reduce razor burn and irritation.",
      rating: "4.6",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/1471775793/photo/unrecognizable-man-applying-shave-foam-on-hand-standing-in-bathroom-and-preparing-for-shaving.webp?a=1&b=1&s=612x612&w=0&k=20&c=jBus9JuwgX19YzvO88c4yShqTZUCEAZO-cwA-YxNp9M=",
      relatedImages: [
        "https://media.istockphoto.com/id/163650844/photo/shaving-foam-on-the-hand-against-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=uGJnfsdWfcHCy5GXgnXo_MjKgwMHZkC7zA-_3Tw8RVU=",
        "https://media.istockphoto.com/id/2170491504/photo/portraits-of-a-young-women-holding-razor-for-hair-removal.webp?a=1&b=1&s=612x612&w=0&k=20&c=TDvp7UgI2HI-e97aECIb6QGYoZ7f3K3Vv4j9JZ-VjwU=",
        "https://media.istockphoto.com/id/918616408/photo/father-and-son-having-fun-while-shaving-in-bathroom.webp?a=1&b=1&s=612x612&w=0&k=20&c=0lnfGPkHqMAVy_BXU4GF0g2XNwbODT4MEV00W7_gxfQ=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 89,
      name: "Deodorant",
      weight: "150 ml",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Deodorant is a product used to mask or eliminate body odor. It helps keep you fresh and confident throughout the day, often with pleasant fragrances.",
      rating: "4.7",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/899104660/photo/beautiful-woman-in-bathroom.webp?a=1&b=1&s=612x612&w=0&k=20&c=t24VamtJicyo3VxeNtY5bJePxf7ZurJE2HH7eU41OGI=",
      relatedImages: [
        "https://media.istockphoto.com/id/1141996556/photo/this-will-leave-me-smelling-fresh-all-day.webp?a=1&b=1&s=612x612&w=0&k=20&c=iY-AC2-GyrgXdUfBh3x8IGucR2mD3b3nh4Xv-LpZqjs=",
        "https://media.istockphoto.com/id/1223318446/photo/hands-holding-natural-mineral-antiperspirant-deodorant-on-nature-green-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=3svRdntG70I1vyCL9dFmrPMKVjYUvZWJGiz1U5WBJwY=",
        "https://media.istockphoto.com/id/1145766371/photo/because-body-odour-should-be-the-least-of-your-concerns.webp?a=1&b=1&s=612x612&w=0&k=20&c=lupg-3CjjeqULUVO4v5GhLFcu8hf02jlPGNfYMveAzo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 90,
      name: "Hair Oil",
      weight: "100 ml",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Hair oil is a product used to nourish and strengthen hair. It helps in reducing dryness, frizz, and split ends, leaving hair soft and shiny.",
      rating: "4.5",
      category: "Personal Care",
      image:
          "https://media.istockphoto.com/id/1331239123/photo/shot-of-a-beautiful-teenage-girl-showing-hair-oil-bottle-at-home.webp?a=1&b=1&s=612x612&w=0&k=20&c=JV0bw70cMt36Y7oeeFTwbfIJvz23v-JkqcexSbUXgzk=",
      relatedImages: [
        "https://media.istockphoto.com/id/1470878463/photo/hair-oil-for-healthy-hair.webp?a=1&b=1&s=612x612&w=0&k=20&c=wSl40JeFbb67qw1djcuuQtUSKzQJfsXGpNykWseBORc=",
        "https://media.istockphoto.com/id/1175291197/photo/studio-shot-of-woman-applying-hair-oil-with-her-fingers.webp?a=1&b=1&s=612x612&w=0&k=20&c=KTj9LfPaAJTi0BiU8bzy8csN2rC5-dEafL_rNArpo1Y=",
        "https://media.istockphoto.com/id/1332134214/photo/pouring-hair-oil-on-hand-close-up.webp?a=1&b=1&s=612x612&w=0&k=20&c=IIJwL-Jm6lZ8-QTfFUCMjt3Ak4sbcfXZT-EaWxy3GX8=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 91,
      name: "Frozen French Fries",
      weight: "500 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen French fries are pre-cut, pre-cooked, and frozen for easy preparation. Simply fry or bake them to enjoy crispy and delicious fries.",
      rating: "4.6",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/1495638137/photo/french-fries-in-pot-on-table-in-front-of-brick-wall.webp?a=1&b=1&s=612x612&w=0&k=20&c=jQDemQvMFw4G_8orDvSNEZvfPHb0bg96ZJjdXXi_A-Y=",
      relatedImages: [
        "https://media.istockphoto.com/id/1337508008/photo/frozen-crinkle-french-fries-potatoes-sticks-white-background-top-view-copy-space.webp?a=1&b=1&s=612x612&w=0&k=20&c=-EB33A03Kowlwx2PEASAuWsW1Tl8RxTZI-ikcdnSEzM=",
        "https://media.istockphoto.com/id/2149691041/photo/woman-setting-air-fryer-to-cook-french-fries.webp?a=1&b=1&s=612x612&w=0&k=20&c=uWyuS4EaEoCS1haPUperwhqIhycHPICBHxoiWOneDKE=",
        "https://media.istockphoto.com/id/470468073/photo/french-fries-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=jSy7ckmPSXBZm2X5R993AMVdSSrrC5gr7vMIuBLjc0I=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 92,
      name: "Frozen Vegetables",
      weight: "400 gm",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen vegetables retain their nutrients and flavors and are perfect for a quick meal. Includes peas, carrots, beans, and more.",
      rating: "4.5",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/1365990731/photo/a-young-mother-woman-packs-frozen-raspberries-and-fresh-food-into-clear-storage-bags-in-a.webp?a=1&b=1&s=612x612&w=0&k=20&c=yof3LrwKsrtAuXbhn5g5lRYsXr4cLq8WHWZjpVDl64E=",
      relatedImages: [
        "https://media.istockphoto.com/id/465096873/photo/frozen-broccoli-carrots-peas-cauliflower-and-green-beans.webp?a=1&b=1&s=612x612&w=0&k=20&c=dpP-p4tMg0yYkxKcuv-gbjch5nQEsQX6Fh0n2imDQzs=",
        "https://media.istockphoto.com/id/625601698/photo/cut-vegetables.webp?a=1&b=1&s=612x612&w=0&k=20&c=fmq9NKzNhvD79poQ9-Sxbpd59Se67hEPRsYEMiv8Ij4=",
        "https://media.istockphoto.com/id/157190823/photo/frozen-broccoli-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=6UWe95y_6ahcRrFTx23P6QLn0-5RyLOXbgQSt-9M1lA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 93,
      name: "Frozen Pizza",
      weight: "300 gm",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen pizza is a ready-to-bake meal with a variety of toppings, from classic Margherita to delicious pepperoni, all pre-cooked and frozen for convenience.",
      rating: "4.7",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/1290540551/photo/ordinary-woman-and-man-buying-frozen-pizza.webp?a=1&b=1&s=612x612&w=0&k=20&c=Bs6IYOKPxrc8gU1rjfJP_qOcyynQtcfGA_ylgWClqAE=",
      relatedImages: [
        "https://media.istockphoto.com/id/1153949338/photo/blurry-background-frozen-pizza-in-freezer-at-american-supermarket.webp?a=1&b=1&s=612x612&w=0&k=20&c=CFL1x86tYUaDgYN7j0pYJC_KR1jtSJuw8eyJXITQqm8=",
        "https://media.istockphoto.com/id/1214471467/photo/close-up-pizza.webp?a=1&b=1&s=612x612&w=0&k=20&c=9YDUbzg3_42TXLi-GYBFbsk9LyBa0cW2qOWL2SHgAi8=",
        "https://media.istockphoto.com/id/1253329732/photo/freshly-baked-pepperoni-pizza-made-at-home.webp?a=1&b=1&s=612x612&w=0&k=20&c=DDjrnL6pELOiVA8o2zFO3dk4pkaRhmERYeng7SReuT0=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 94,
      name: "Frozen Chicken Nuggets",
      weight: "400 gm",
      price: "₹220.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen chicken nuggets are quick and easy to prepare. They are perfect for snacking or serving as a side dish with your favorite sauce.",
      rating: "4.5",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/176788274/photo/chicken-nuggets-arranged-on-oven-tray.webp?a=1&b=1&s=612x612&w=0&k=20&c=i7giGG9PuLVwgb77rvnWdooy29nIcO7sEuP-psng1EM=",
      relatedImages: [
        "https://media.istockphoto.com/id/2158162971/photo/raw-and-frozen-chicken-nuggets-frozen-convenience-foods.webp?a=1&b=1&s=612x612&w=0&k=20&c=DkFy3Z-DtoH7u4ZN8KLtS-T0P0-1sptR98Ti4M8eQ-I=",
        "https://media.istockphoto.com/id/1054871292/photo/frozen-food-chicken-nuggets-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=yE9zpuM3RcEHXFlE1TA9Yq24oAZ3B-7gxphiXYjnZxU=",
        "https://media.istockphoto.com/id/1391823162/photo/bulk-frozen-chicken-nuggets-for-sale-at-the-supermarket.webp?a=1&b=1&s=612x612&w=0&k=20&c=RT4z3rr-BTgnsZLrv65Udj5Hd8gjp_RbP4exWzfjM5g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 95,
      name: "Frozen Dumplings",
      weight: "300 gm",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen dumplings are a quick and delicious meal. Made with dough filled with meat or vegetables, they are easy to steam or fry.",
      rating: "4.8",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/849801576/photo/frozen-dumplings.webp?a=1&b=1&s=612x612&w=0&k=20&c=zbWia8W-phYMq-PFgemF6IZzOGy_bTzyCOK4oIdDgt8=",
      relatedImages: [
        "https://media.istockphoto.com/id/1359736571/photo/set-of-uncooked-dumplings-isolated-on-white.webp?a=1&b=1&s=612x612&w=0&k=20&c=2eQv044d9DI1ot6BWaOxi6n5jeoepNmIdhQxixWgwAs=",
        "https://media.istockphoto.com/id/1141288545/photo/three-frozen-dumplings-on-a-white-background-isolated-dumplings.webp?a=1&b=1&s=612x612&w=0&k=20&c=hVOSxpXPswuuuw-MCBStlPF_HXM86TXiZJTQSxEL9do=",
        "https://media.istockphoto.com/id/2152315325/photo/frozen-gluten-free-dumplings.webp?a=1&b=1&s=612x612&w=0&k=20&c=8YQxIipMIwfkAf3mPWV0Fo1ghCAZNt4QEfyGT-gjiew=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 96,
      name: "Frozen Fish Fillets",
      weight: "500 gm",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen fish fillets are ready to cook and perfect for a nutritious meal. Choose from varieties like salmon, tilapia, or basa.",
      rating: "4.6",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/1720509600/photo/raw-fish-for-sell.webp?a=1&b=1&s=612x612&w=0&k=20&c=FKm5iJI18RXFflpj3SvMPIc72JIQFqgzqQYw-1K5r_k=",
      relatedImages: [
        "https://media.istockphoto.com/id/1360370218/photo/red-snapper-frozen-pack-fish-meat-with-herbs-on-black-dark-stone-table-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=eKqSqlB6UaNyYyvpEEVX6cTZ40wQO9HctiJ4jhtM2SU=",
        "https://media.istockphoto.com/id/518087608/photo/salmon-slices-on-ice.webp?a=1&b=1&s=612x612&w=0&k=20&c=k3H0z7PnyvuIKssZ2LmD6mfQFNxLnIChU2DGmh7GUyU=",
        "https://media.istockphoto.com/id/1281099786/photo/fresh-fish-and-seafood-arrangement-on-plate-fish-seafood-fishing-industry-raw-fish-fillet-raw.webp?a=1&b=1&s=612x612&w=0&k=20&c=SzQWDRr_jzbJrd2jWkeuQwF45aRNJBOz9J4Fo4c-fPk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 97,
      name: "Frozen Ice Cream",
      weight: "1 L",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Frozen ice cream is a delightful treat available in various flavors like chocolate, vanilla, and strawberry. Enjoy a cool and creamy dessert.",
      rating: "4.9",
      category: "Frozen & Ready-to-Eat",
      image:
          "https://media.istockphoto.com/id/930933962/photo/colorful-ice-cream-border.webp?a=1&b=1&s=612x612&w=0&k=20&c=BgNEpQ7LOibFAVCTgQQAoae7QTRyDS_ENbhuM6KgcjM=",
      relatedImages: [
        "https://media.istockphoto.com/id/1222009180/photo/ice-cream-scoops-in-cones-with-copy-space-on-blue.webp?a=1&b=1&s=612x612&w=0&k=20&c=7kH2xjgaDYTMOWNsXCemxWFXnEVc8CWmtZ2kN9RNcqo=",
        "https://media.istockphoto.com/id/688900810/photo/strawberry-ice-cream-ball-on-ice-cream-container-top-detail.webp?a=1&b=1&s=612x612&w=0&k=20&c=N8E_9B4oDGyXXBgye2tCiw_iXIlX1uOKH4vEYyLYbY8=",
        "https://media.istockphoto.com/id/1239504808/photo/various-colorful-ice-cream-sorts-with-fruits-in-paper-cups.webp?a=1&b=1&s=612x612&w=0&k=20&c=bJuaXSUNnJsGomy8zeo1hKyVx5dlcYZjG6blD6ta-I8=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 98,
      name: "Black Pepper",
      weight: "200 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Black pepper is a popular spice used to add heat and flavor to dishes. It is often ground and sprinkled on food for seasoning.",
      rating: "4.7",
      category: "Condiments & Spices",
      image:
          "https://media.istockphoto.com/id/979264404/photo/ground-black-pepper.webp?a=1&b=1&s=612x612&w=0&k=20&c=VT7S3Vj7CDVI2UwPhqZqWOtsQaoZr97avKhUQxxd57E=",
      relatedImages: [
        "https://media.istockphoto.com/id/506317306/photo/turmeric-roots-and-black-pepper-combination-enhances-curcumin-ab.webp?a=1&b=1&s=612x612&w=0&k=20&c=GMHJsIvxFVckRCUrN1oBvJDNndGPs5iu28vKPleHnmU=",
        "https://media.istockphoto.com/id/923799874/photo/black-pepper-piper-nigrum-and-its-tea-with-powder-of-black-pepper-on-wooden-surface.webp?a=1&b=1&s=612x612&w=0&k=20&c=q6IupOY7YjeYTvXE0YvHZC470GAWNSTQTXaoWrCEZEc=",
        "https://media.istockphoto.com/id/923398574/photo/tea-of-black-pepper-piper-nigrum-with-raw-black-pepper-and-powdered-black-pepper.webp?a=1&b=1&s=612x612&w=0&k=20&c=ypDgr_u5jz9Bp6Sq9j2McyxXzFXLPt5tKb5B5c9VF9Q=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 99,
      name: "Turmeric Powder",
      weight: "250 gm",
      price: "₹90.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Turmeric is a bright yellow spice commonly used in Indian cuisine. It has anti-inflammatory properties and is often used in curries, soups, and stews.",
      rating: "4.6",
      category: "Condiments & Spices",
      image:
          "https://media.istockphoto.com/id/1164067237/photo/turmeric-roots-and-powder-in-wood-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=C-L8mmrsnh1yk4ttp2XEKXE6zN0HXGdjRQFRiq-lB-Q=",
      relatedImages: [
        "https://media.istockphoto.com/id/950749440/photo/turmeric-powder-in-wood-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=QItU-QzrNGUaNPlUyz2L92rFZTgV0FHeg0_YxRm6vCg=",
        "https://media.istockphoto.com/id/894172672/photo/turmeric-powder-in-ceramic-bowl-with-raw-dried-turmeric-over-plain-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=gYUwp6rkRGru410zsM8IlOweWHV5NwJkr5WbJJid1PY=",
        "https://media.istockphoto.com/id/537623430/photo/turmeric-powder-with-roots-or-barks-on-black-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=1JEiGGKHuJpRBv_av5dGrIrVhQesGJ05xuNXeuoaEFA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 100,
      name: "Chili Powder",
      weight: "200 gm",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Chili powder adds a fiery, spicy kick to dishes. It is commonly used in various cuisines to add heat to curries, sauces, and snacks.",
      rating: "4.5",
      category: "Condiments & Spices",
      image:
          "https://media.istockphoto.com/id/1306148433/photo/chilli-peppers.webp?a=1&b=1&s=612x612&w=0&k=20&c=eey8uLF6ZIT_bY9wcH8LXEkHBwzpbpngctQ7wTCqTas=",
      relatedImages: [
        "https://media.istockphoto.com/id/917777672/photo/red-chili-pepper-in-a-wooden-bowl-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=PvTBZoT3ueWLnhgfxW4qSKmoCPaLK-4mGdyfiQjVjZA=",
        "https://media.istockphoto.com/id/1357848115/photo/flying-hot-red-chili-peppers-with-paprika-powder-against-black-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=24HIrKobwM-uAHzHryC_Pq1jFoNCk62z6eAM9j4Xpig=",
        "https://media.istockphoto.com/id/1307887691/photo/green-chili-agriculture-field-in-india.webp?a=1&b=1&s=612x612&w=0&k=20&c=knbm4zMZOPxuKl2l6ioDlU4lg4logIRSxR8bmEMHnMk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 101,
      name: "Garam Masala",
      weight: "100 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Garam masala is a blend of ground spices, commonly used in Indian cooking. It includes cinnamon, cloves, cardamom, cumin, and coriander, giving dishes a rich, aromatic flavor.",
      rating: "4.7",
      category: "Condiments & Spices",
      image:
          "https://media.istockphoto.com/id/1158646949/photo/garam-masala-powder.webp?a=1&b=1&s=612x612&w=0&k=20&c=g9unGfCgmxlFvBLEXcwObtU22xdtDs2jISXViTPspBY=",
      relatedImages: [
        "https://media.istockphoto.com/id/1215706003/photo/indian-cuisine-food-ingredients.webp?a=1&b=1&s=612x612&w=0&k=20&c=AJphN6rZ5gN5mKsbY9Ahh_oFEfibCnrkVDet8X13fEs=",
        "https://media.istockphoto.com/id/1372079144/photo/many-colorful-organic-dried-vibrant-indian-food-spices-in-metal-measuring-dried-food-scoops.webp?a=1&b=1&s=612x612&w=0&k=20&c=UIAo9MpKgaP0ICqCApF9KQ-OjvL_nUW8bFGdvz_aCpY=",
        "https://media.istockphoto.com/id/1213880990/photo/bowl-of-garam-masala-ready-as-ingredient-towards-gourmet-recipe.webp?a=1&b=1&s=612x612&w=0&k=20&c=lBNcithW_Dp1PoTBssZfUjDKTIMqHqYx3AgWRRZzJVw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 102,
      name: "Cumin Seeds",
      weight: "150 gm",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cumin seeds are aromatic seeds often used in Indian, Middle Eastern, and Mexican cuisines. They add an earthy flavor to dishes and are often used in tempering.",
      rating: "4.6",
      category: "Condiments & Spices",
      image:
          "https://media.istockphoto.com/id/1346906247/photo/cumin-seeds-called-jeera-in-clay-bowl-and-its-powder-in-white-bowl-on-dark-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=4LfQOPtE0FLEjTM1BNfxOIEGp2Yzw4_YM_TMKQN-CN8=",
      relatedImages: [
        "https://media.istockphoto.com/id/1152072821/photo/fennel-seeds-in-a-bowl-on-a-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=TQj4yFfYH-Je9st5n5Avy48yDueJQo4sbHWX_rcpZWY=",
        "https://media.istockphoto.com/id/474577579/photo/nigella-sativa-oil.webp?a=1&b=1&s=612x612&w=0&k=20&c=q_7v18MiMeF_uFtvvfalG4hMi8twW7aWFwRA89p3UGs=",
        "https://media.istockphoto.com/id/643760614/photo/variety-of-herbs-and-spices-on-slate-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=wOYJyb6pDf-mcJ391ic7u3d0MqQpv3N9qX7DRHT39UI=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 103,
      name: "Mustard Seeds",
      weight: "200 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Mustard seeds are small seeds used in cooking to add a tangy flavor. They are used in tempering and pickles, and they can be yellow, brown, or black.",
      rating: "4.5",
      category: "Condiments & Spices",
      image:
          "https://media.istockphoto.com/id/1196080218/photo/brown-mustard-seeds-in-wooden-spoon-on-a-textured-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=W7WAqJwuEq4fj8TzfNUSTcA2rw8ZBGVrhAqHEzcXpNI=",
      relatedImages: [
        "https://media.istockphoto.com/id/1593333096/photo/mustard-seeds-on-white-bowl-with-wooden-spoon-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=U44YY-Q3Ttf-lWuNMmfTUuvD5QMYKfPc15oGyyhfpSY=",
        "https://media.istockphoto.com/id/2154837059/photo/top-view-of-black-mustard-seed-background-with-copy-space-in-vertical-orientation.webp?a=1&b=1&s=612x612&w=0&k=20&c=CLwsZ3iqmuE1PLYVQCMnSZP2eBDT_fK1QtqL8jFqMe4=",
        "https://media.istockphoto.com/id/1347023436/photo/close-up-of-mustard-seeds-rai-or-brown-mustard-seeds-in-a-small-white-plate.webp?a=1&b=1&s=612x612&w=0&k=20&c=6hsFQeri2xz6yZqMuunG1F74JKN4-agYZJI3iPgkQmE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 104,
      name: "Chicken Breast",
      weight: "500 gm",
      price: "₹220.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Chicken breast is a lean source of protein, widely used in various cuisines. It is versatile, can be grilled, roasted, or added to curries and salads.",
      rating: "4.8",
      category: "Meat & Seafood",
      image:
          "https://media.istockphoto.com/id/157501914/photo/grilled-chicken.webp?a=1&b=1&s=612x612&w=0&k=20&c=Y6hUtM9h73fI7TJduAo161ID6ePRn6tfYX-pvUREums=",
      relatedImages: [
        "https://media.istockphoto.com/id/1249944527/photo/image-of-bowl-filled-with-homemade-chicken-biryani-garnished-with-coriander-leaves-and-served.webp?a=1&b=1&s=612x612&w=0&k=20&c=ksFTazr8115YCWCjFY3k1tqH8zZ-6u54fJYjAbAR10Y=",
        "https://media.istockphoto.com/id/1078027368/photo/baked-chicken-thighs.webp?a=1&b=1&s=612x612&w=0&k=20&c=lslozzWHnNBeLfzU2r3rbmQlTPIYDWl1aVNls9ms7_E=",
        "https://media.istockphoto.com/id/1162537177/photo/grilled-chicken-breast-with-oregano-and-lemon.webp?a=1&b=1&s=612x612&w=0&k=20&c=Evvxtzq9q9tp9oUkO9MjEwNguHMaLj4gcb5PAVbImHU=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 105,
      name: "Pork Ribs",
      weight: "800 gm",
      price: "₹550.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Pork ribs are a delicious cut of meat, known for their tenderness and flavor. They are perfect for grilling, smoking, or slow-cooking in barbecue sauce.",
      rating: "4.7",
      category: "Meat & Seafood",
      image:
          "https://media.istockphoto.com/id/666367844/photo/roasted-pork-ribs.webp?a=1&b=1&s=612x612&w=0&k=20&c=a7XCXUVPfRZZf2vVirsZWhDppr5kGYMSl0CA7Pkjfi8=",
      relatedImages: [
        "https://media.istockphoto.com/id/609829104/photo/grilled-pork-ribs.webp?a=1&b=1&s=612x612&w=0&k=20&c=8_QJS4TCc60T56yLuS_uYvD4yEFNVZNJyipjfCUL9eQ=",
        "https://media.istockphoto.com/id/666367844/photo/roasted-pork-ribs.webp?a=1&b=1&s=612x612&w=0&k=20&c=a7XCXUVPfRZZf2vVirsZWhDppr5kGYMSl0CA7Pkjfi8=",
        "https://media.istockphoto.com/id/1196529669/photo/grilled-spare-ribs.webp?a=1&b=1&s=612x612&w=0&k=20&c=6asX4LdISVYLe9w8gp2J1aBYAjv3k4ivonM_NsLWxIA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 106,
      name: "Beef Steak",
      weight: "250 gm",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Beef steak is a rich, flavorful cut of beef, often grilled or pan-seared. It’s best served medium-rare to medium, preserving its tender texture and taste.",
      rating: "4.6",
      category: "Meat & Seafood",
      image:
          "https://media.istockphoto.com/id/1454160404/photo/hotplate-rice-with-onsen-tamago-and-beef.webp?a=1&b=1&s=612x612&w=0&k=20&c=2UxociKRCL5sAow93tt95Ks69oNJpIxwW_Wy1E0aJu4=",
      relatedImages: [
        "https://media.istockphoto.com/id/1349021216/photo/man-taking-out-frozen-meat-from-freezer.webp?a=1&b=1&s=612x612&w=0&k=20&c=rLNkNJC4npo1FF6dIcbovXnTJOSoEanSaNAupIUtbic=",
        "https://media.istockphoto.com/id/1322311130/photo/kerala-cuisine-beef-fry.webp?a=1&b=1&s=612x612&w=0&k=20&c=kbFPjxgINErTil6wSDJw_LE0ZoXdggDh6ruC466uDvk=",
        "https://media.istockphoto.com/id/1397328185/photo/chopped-raw-meat-on-black-background-top-view-raw-lamb-and-mutton-meat-isolated.webp?a=1&b=1&s=612x612&w=0&k=20&c=RnxC1_wF7WB5SIAwPy4kVzDe0zQD_jwKGkMGGziDfuE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 107,
      name: "Salmon Fish",
      weight: "400 gm",
      price: "₹650.00",
      isFavourite: 0,
      isDaily: 0,
      image:
          "https://media.istockphoto.com/id/1071096328/photo/fresh-salmon-fillets.webp?a=1&b=1&s=612x612&w=0&k=20&c=0u-rWN-ghvNZJSTWKJPYEXTvOQpMuloQtAe0bxJtZVc=",
      description:
          "Salmon fish is known for its rich omega-3 fatty acids and robust flavor. It can be grilled, baked, or used in sushi and salads.",
      rating: "4.9",
      category: "Meat & Seafood",
      relatedImages: [
        "https://media.istockphoto.com/id/532571540/photo/raw-salmon-on-baking-paper.webp?a=1&b=1&s=612x612&w=0&k=20&c=v5oHy3XBCY6hB5D84xq5PzYyUSdsnTqkG5rBIKDivtY=",
        "https://media.istockphoto.com/id/1739096465/photo/salmon-fish-with-ingredients-at-white-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=Mskgz7NQY_eep7_-HCL4fhejlXfZZ9VM862MsE9U_p8=",
        "https://media.istockphoto.com/id/846068022/photo/baked-salmon-steak-with-tomato-onion-mix-of-green-leaves-salad-in-a-plate-healthy-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=z7nynAJPysVKeFYlxPgtAL5oAZeG1WuGSalL_zO_CEE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 108,
      name: "Shrimp",
      weight: "200 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Shrimp are small, flavorful seafood that can be grilled, sautéed, or added to pastas, salads, and seafood boils. They are rich in protein and low in fat.",
      rating: "4.8",
      category: "Meat & Seafood",
      image:
          "https://media.istockphoto.com/id/180719949/photo/frozen-shrimp.webp?a=1&b=1&s=612x612&w=0&k=20&c=e7Vf1cdhhQexgPVpgb-sWApGztwEzSOUhynnoCdk-GY=",
      relatedImages: [
        "https://media.istockphoto.com/id/2120533021/photo/fish-market-where-various-types-of-fresh-fish-and-seafood.webp?a=1&b=1&s=612x612&w=0&k=20&c=1C8qzL1rZjZTRtWAMbo9fEhAfeKUm4gTcjc8mZyjpLM=",
        "https://media.istockphoto.com/id/619524014/photo/shrimp-korma.webp?a=1&b=1&s=612x612&w=0&k=20&c=dk4TkLSYHbvZEKjLyulHWG34Wc9phMfHdCgiZ8EqeHM=",
        "https://media.istockphoto.com/id/1031737122/photo/big-shrimps-in-fishing-net-prawns-are-a-common-name-for-small-aquatic-crustaceans-with-an.webp?a=1&b=1&s=612x612&w=0&k=20&c=I5pDFM3RNsIz5nTTG9pqjWTKUBq4FH7pfnw27WCMbFw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 109,
      name: "Lamb Chops",
      weight: "600 gm",
      price: "₹800.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Lamb chops are tender cuts of meat from lamb, often grilled or roasted. They have a distinct flavor and are a delicacy in many cuisines worldwide.",
      rating: "4.7",
      category: "Meat & Seafood",
      image:
          "https://media.istockphoto.com/id/1909454054/photo/lamb-chops.webp?a=1&b=1&s=612x612&w=0&k=20&c=Cd5KBMOGGWjXJ2XELTOn7SO8Z0dt3HqG2cGb0He6Uv8=",
      relatedImages: [
        "https://media.istockphoto.com/id/1911704119/photo/lamb-chops.webp?a=1&b=1&s=612x612&w=0&k=20&c=9PFtPix81Ypc8XGDXt4iPCHasAQnjsBGwOdgQrHOYWQ=",
        "https://media.istockphoto.com/id/1396611600/photo/bbq-grilled-lamb-chops-steaks-in-a-plate-dark-background-top-view-copy-space.webp?a=1&b=1&s=612x612&w=0&k=20&c=HhXHPrb4XHHapks6AYKmx7QX0J9JaGUeX72LFGeh7zM=",
        "https://media.istockphoto.com/id/1909454054/photo/lamb-chops.webp?a=1&b=1&s=612x612&w=0&k=20&c=Cd5KBMOGGWjXJ2XELTOn7SO8Z0dt3HqG2cGb0He6Uv8=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 110,
      name: "Crab",
      weight: "500 gm",
      price: "₹1200.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Crab is a popular seafood known for its sweet, delicate meat. It can be boiled, steamed, or served in soups, pastas, and salads.",
      rating: "4.9",
      category: "Meat & Seafood",
      image:
          "https://media.istockphoto.com/id/536381178/photo/crab-curry-in-coconut-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=iiMZ6DdPuafkGUVZFEXoEL0kcgJ1MbePGgMlOLKtbLU=",
      relatedImages: [
        "https://media.istockphoto.com/id/1502795593/photo/close-up-of-crab-sticks-on-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=PVn4MupyJXOs3mkhId5v-Ml5UroHYFwOOr4JiktdM8E=",
        "https://media.istockphoto.com/id/1181075259/photo/large-red-kamchatka-crab-claws-phalanx-legs-tentacles-lies-on-ice-cherry-slices-of-lemon-and.webp?a=1&b=1&s=612x612&w=0&k=20&c=LGyBWYtYzOAY6XyDjd6qlrN6Jt5qEJN8AgImRfnOzTY=",
        "https://media.istockphoto.com/id/172216520/photo/crab.webp?a=1&b=1&s=612x612&w=0&k=20&c=7OivfZ1hIKahNtZvGGHb4q2K-vTDsPJ94g44EDPK8iE="
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 111,
      name: "Canned Tuna",
      weight: "185 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned tuna is a versatile and convenient source of protein. It’s perfect for sandwiches, salads, pasta dishes, or as a snack. It’s packed in oil or water.",
      rating: "4.6",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/1541869925/photo/spoon-pick-canned-tuna-closeup.webp?a=1&b=1&s=612x612&w=0&k=20&c=8HrzdprQ2ZpsUYDeGSyEu10g7f_kVruJc1ZYTt5GccM=",
      relatedImages: [
        "https://media.istockphoto.com/id/512336488/photo/fresh-raw-tuna-fish-in-market.webp?a=1&b=1&s=612x612&w=0&k=20&c=wtnDBndBBl5NNcOS-cNhoR_JlnNQb9a1b52Xmes9LXQ=",
        "https://media.istockphoto.com/id/1907045200/photo/roast-pork-tebasaki.webp?a=1&b=1&s=612x612&w=0&k=20&c=_7kyCcwV4QrxjRxTfF5VjG3yy0WNPrxZcsPITUQ7HfA=",
        "https://media.istockphoto.com/id/1917158681/photo/fresh-sushi.webp?a=1&b=1&s=612x612&w=0&k=20&c=BA_ONkJi5rs7p8RY1uVPeg8PhSc-8dWwH3TIdVBBKao=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 112,
      name: "Canned Sweet Corn",
      weight: "400 gm",
      price: "₹90.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned sweet corn is a quick and easy ingredient to add to soups, salads, or side dishes. It’s sweet, tender, and a great addition to any meal.",
      rating: "4.7",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/1152321642/photo/baby-corn.webp?a=1&b=1&s=612x612&w=0&k=20&c=1KlxxUB036wYj-YUnaaQb0ERBo9YhdBg2utUNWZsnf4=",
      relatedImages: [
        "https://media.istockphoto.com/id/178812286/photo/news-can.webp?a=1&b=1&s=612x612&w=0&k=20&c=l__WNverWFHB9JzH6DkNMarI8QTWplS2c_Ov6AlUtS8=",
        "https://media.istockphoto.com/id/186555186/photo/portion-of-preserved-sweetcorn.webp?a=1&b=1&s=612x612&w=0&k=20&c=15ys3vC0uEU0KGB4w7MQ9JAsj3Q3it5pdMIuTgDzzy0=",
        "https://media.istockphoto.com/id/637797476/photo/tinned-corn-isolated.webp?a=1&b=1&s=612x612&w=0&k=20&c=LI6Uey4Zv1fK113Ss8-kHIZGGR-8eMbvyCOv5s1Vy1E=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 113,
      name: "Canned Tomatoes",
      weight: "400 gm",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned tomatoes are a pantry staple. They’re perfect for making sauces, soups, stews, or adding a rich, tangy flavor to any dish.",
      rating: "4.8",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/1258230267/photo/homemade-canned-tomatoes.webp?a=1&b=1&s=612x612&w=0&k=20&c=pCV7A07Z8quBKHgnQXMqOhi3wu_X-Apu7sUwp9ioi1M=",
      relatedImages: [
        "https://media.istockphoto.com/id/1168900649/photo/preparing-homemade-tomato-sauce.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBRmoxZ-Cc3C-WFfRSiQpsUgojZCVfkPufClv5rRxJE=",
        "https://media.istockphoto.com/id/1211358446/photo/juicy-canned-tomatoes-on-wooden-rustic-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=1dgtJUN9Z20rSKIbBJfOfxKcjUC1YcTIOaoeXETMi0w=",
        "https://media.istockphoto.com/id/1128106031/photo/bowl-of-canned-tomatoes.webp?a=1&b=1&s=612x612&w=0&k=20&c=tS6G2B77JRJLUB_4GVehi8-4MUvnhbawlFspvTxlYeE="
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 114,
      name: "Canned Beans",
      weight: "400 gm",
      price: "₹60.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned beans are a great source of protein and fiber. They’re perfect for making chili, soups, or adding to salads for a healthy, quick meal.",
      rating: "4.5",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/155740358/photo/opened-tin-with-red-beans.webp?a=1&b=1&s=612x612&w=0&k=20&c=2cnKC2tTflMZfApfW6hpXphRF_TLDWQetou85NTG4ZQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/453985903/photo/kidney-beans-on-a-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=JKRYXRR9OVJGefbelSpkXvD1ng3eges-aX2n4cDzokc=",
        "https://media.istockphoto.com/id/1294705921/photo/pouring-a-can-of-organic-garbanzo-beans-over-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=RLh_fBRuYCg6wF5CduPezOf7myZ-nWbsLP1AFVFuD9c=",
        "https://media.istockphoto.com/id/1348369752/photo/seamless-food-background-made-of-opened-canned-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=3Ey6r4--Cni2K5SVuXfb6aI8BhI_vpQYWvP7KH-Muh0=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 115,
      name: "Canned Pineapple",
      weight: "450 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned pineapple is a sweet and juicy fruit that’s perfect for desserts, smoothies, or adding to savory dishes like sweet and sour chicken.",
      rating: "4.6",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/1715623252/photo/slices-of-pineapple.webp?a=1&b=1&s=612x612&w=0&k=20&c=aDr6FDU5aqmyN3iX56FAJuvtPBTScDP0O4u4zIssH7M=",
      relatedImages: [
        "https://media.istockphoto.com/id/840373368/photo/preserved-pineapple-rings-close-up-shot-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=l6dkIgm2LtU8uCX2OlcEqObJTGzksCIuO8PVTA5wlY4=",
        "https://media.istockphoto.com/id/1346140660/photo/flat-lay-composition-with-canned-pineapple-pieces-on-white-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=gWke_s0nZ62-mA-C7GnLZeoEwXGCAcItBU1HCbugq_M=",
        "https://media.istockphoto.com/id/1346140387/photo/fork-with-canned-pineapple-piece-over-bowl-on-table-closeup.webp?a=1&b=1&s=612x612&w=0&k=20&c=fFbTMPcQ53f0WuqZWQ4ALoDmHN8JpMKJpYk4ujIhlss=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 116,
      name: "Canned Peas",
      weight: "400 gm",
      price: "₹70.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned peas are a quick and convenient vegetable option. They can be added to stews, casseroles, or simply served as a side dish.",
      rating: "4.4",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/116777811/photo/green-peas.webp?a=1&b=1&s=612x612&w=0&k=20&c=g3UY9vQBznIzL5lBPamJQ-4TuIBy0rtuwtYbySkCn8w=",
      relatedImages: [
        "https://media.istockphoto.com/id/168715602/photo/canned-green-pea.webp?a=1&b=1&s=612x612&w=0&k=20&c=Q7oXP_tg4TvO3c9NW4-s84l_jXXSGSJX5nAXaYK9jro=",
        "https://media.istockphoto.com/id/1249106881/photo/green-peas-in-a-can-close-up-isolated-on-a-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=LMYfWGoy4cNthdNR63LvUZ5SdnWnnBnUP0BFozB6LGQ=",
        "https://media.istockphoto.com/id/1225404909/photo/canned-food-isolated-on-white-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=7pHOxDAUnC29dbA9MucJrglclrkp8ZI51YFeqiO6YB4=c",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 117,
      name: "Canned Mushrooms",
      weight: "400 gm",
      price: "₹110.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Canned mushrooms are a flavorful addition to soups, sauces, and stir-fries. They are a convenient way to enjoy mushrooms year-round.",
      rating: "4.7",
      category: "Canned Goods",
      image:
          "https://media.istockphoto.com/id/157428888/photo/canned-mushrooms.webp?a=1&b=1&s=612x612&w=0&k=20&c=KIknkefzHT2SFBPGbSfwQ1rFPJZsiQ4uizuhbTyFYvk=",
      relatedImages: [
        "https://media.istockphoto.com/id/1286182499/photo/marinated-mushrooms-in-hands-canned-mushroom-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=zQZ02xrlHwh1WnZceerxcDMvFSg8n3YOiGI0RKJDOxs=",
        "https://media.istockphoto.com/id/1276596631/photo/button-mushrooms.webp?a=1&b=1&s=612x612&w=0&k=20&c=_f0Rroonx9jPKnyId61HnEVx9B7eF3DEFgiepTXuIrE=",
        "https://media.istockphoto.com/id/178472640/photo/plate-with-canned-mushrooms.webp?a=1&b=1&s=612x612&w=0&k=20&c=7hoOcz2wP_bOFAtla9KsRNkoQnHJI59amprBPz_GWgI=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 118,
      name: "Cornflakes",
      weight: "500 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Cornflakes are a popular breakfast cereal made from toasted corn. They are often eaten with milk and sugar, and provide a quick and easy start to the day.",
      rating: "4.5",
      category: "Breakfast Items",
      image:
          "https://media.istockphoto.com/id/604383524/photo/bowl-of-cornflakes-in-milk-isolated-on-white-from-above.webp?a=1&b=1&s=612x612&w=0&k=20&c=kbNd81_Yn-M7YYieP7mj90_hi4D1wrj8kXuat62e6vA=",
      relatedImages: [
        "https://media.istockphoto.com/id/1309973879/photo/indian-snacks-cornflakes-namkeen-food-in-an-antique-brass-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=azBrnII2mDnxb9pfMU7GrmVCQkZqHOe_0i47w8axBvY=",
        "https://media.istockphoto.com/id/182190208/photo/corn-flaked-breakfast-cereal.webp?a=1&b=1&s=612x612&w=0&k=20&c=hE3_KfbO0s4r1dggwjAT7TnaNEkTEDWKYXR6qeA59UM=",
        "https://media.istockphoto.com/id/882670038/photo/milk-stream-pouring-into-a-bowl-with-%D1%81ornflakes-close-up-milk-splash-on-a-cup-with-flakes.webp?a=1&b=1&s=612x612&w=0&k=20&c=qfvkBjhcNAjYIkQlDxmncJAmsGW3-EgI3rYfcqLXL5g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 119,
      name: "Oats",
      weight: "500 gm",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Oats are a nutritious and hearty breakfast option, rich in fiber and great for heart health. They can be cooked with milk or water and topped with fruits, nuts, or honey.",
      rating: "4.8",
      category: "Breakfast Items",
      image:
          "https://media.istockphoto.com/id/1387640186/photo/masala-oats-in-a-bowl-directly-above-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=8Gvki012c0cdtzcAdKJv5On8uYVtmumrBBTalPWcwUc=",
      relatedImages: [
        "https://media.istockphoto.com/id/1408374876/photo/oatmeal-porridge-bowl-with-berry-fruits-in-female-hands.webp?a=1&b=1&s=612x612&w=0&k=20&c=ZF1u-1os1UjQtwAgsd1jnYkgx7XBteS3HSJijzLpvvo=",
        "https://media.istockphoto.com/id/1191001663/photo/vegetable-masala-oats-khichadi-served-in-a-bowl-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=QnCPLwPBPrFEpZ0qCg5OKe-i_doQilN-ZWZAsWoHpm0=",
        "https://media.istockphoto.com/id/1364757288/photo/overnight-oats-with-apple-and-almonds-made-by-soaking-rolled-oats-and-chia-seeds-in-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=Hx8MKBumvoY6QJSYtcFgt7cjsFTt8_uK7vC0COFD_No=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 120,
      name: "Peanut Butter",
      weight: "300 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Peanut butter is a spread made from ground dry roasted peanuts. It’s a great addition to your breakfast, perfect on toast, sandwiches, or pancakes.",
      rating: "4.7",
      category: "Breakfast Items",
      image:
          "https://media.istockphoto.com/id/1206661928/photo/peanut-butter-sandwich.webp?a=1&b=1&s=612x612&w=0&k=20&c=kc3XQdIpLUDNkjhcKA6fHKhRIaefiPEp_j6UW9e9kIQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/1365142070/photo/female-hands-spread-peanut-butter-on-toast-close-up.webp?a=1&b=1&s=612x612&w=0&k=20&c=WD4y_WGgeMk_t-jOBcGi4neOrn86EcxUifdsqP12KSs=",
        "https://media.istockphoto.com/id/1177706596/photo/dried-cranberry-and-oat-energy-balls.webp?a=1&b=1&s=612x612&w=0&k=20&c=_Z9QEyBCKk2QaOSAUECNooUy_G5G3KoNnWn-DXWyb0A=",
        "https://media.istockphoto.com/id/1206661928/photo/peanut-butter-sandwich.webp?a=1&b=1&s=612x612&w=0&k=20&c=kc3XQdIpLUDNkjhcKA6fHKhRIaefiPEp_j6UW9e9kIQ=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 121,
      name: "Jam",
      weight: "250 gm",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Jam is a sweet spread made from fruits and sugar, perfect for adding to toast or bread. Available in various flavors like strawberry, mango, and mixed fruits.",
      rating: "4.4",
      category: "Breakfast Items",
      image:
          "https://media.istockphoto.com/id/1181341175/photo/morning-routine.webp?a=1&b=1&s=612x612&w=0&k=20&c=5pu0aealkd7yYScL3fq1nwzbF3cLeyew6hkJCFFZlZw=",
      relatedImages: [
        "https://media.istockphoto.com/id/902659410/photo/peanut-butter-and-heart-shaped-jelly-sandwich.webp?a=1&b=1&s=612x612&w=0&k=20&c=xM67z6aCe6Pl3V9YfdOroYLzk_OTPpJNhZhGdiED91U=",
        "https://media.istockphoto.com/id/1032161820/photo/jars-of-a-variety-of-homemade-jam.webp?a=1&b=1&s=612x612&w=0&k=20&c=d4-u7KJMqmFnGOgmQyzL91nL7EwxY9NUyHULgr_SUHY=",
        "https://media.istockphoto.com/id/534539975/photo/shelves-of-canned-goods.webp?a=1&b=1&s=612x612&w=0&k=20&c=nAFf5wA912Gy29O4l_qhQIL1x1Jhs9EKqQBZV6nMDOs=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 122,
      name: "Honey",
      weight: "250 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Honey is a natural sweetener produced by bees. It’s great for adding sweetness to breakfast items like oats, toast, or tea. It also has numerous health benefits.",
      rating: "4.8",
      category: "Breakfast Items",
      image:
          "https://media.istockphoto.com/id/520733611/photo/jar-of-honey-with-honeycomb.webp?a=1&b=1&s=612x612&w=0&k=20&c=1so2qQeNP-ddlrpVzWERgpYEyAjSGhv3gLnozxbVzjs=",
      relatedImages: [
        "https://media.istockphoto.com/id/1171918046/photo/child-a-plate-of-honey-in-the-hands-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=DOD0pqSg2Y9NGlAIxmCvRLrNm0K3FzJhdFfMkY22Li4=",
        "https://media.istockphoto.com/id/1211111663/photo/honey.webp?a=1&b=1&s=612x612&w=0&k=20&c=A2CuFJ0cMshpmYntHfhATDBrDTtDxGGLjfw3fPvqHBU=",
        "https://media.istockphoto.com/id/1146323945/photo/woman-holding-jar-of-honey-in-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=J74YMyZKYSHnN9fQfr1I1EYFoJvvJrTQ_V5KYhZscVM=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 123,
      name: "Eggs",
      weight: "12 ml",
      price: "₹70.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Eggs are a versatile and protein-packed breakfast item. They can be boiled, scrambled, or fried, and are often eaten with toast or in sandwiches.",
      rating: "4.7",
      category: "Breakfast Items",
      image:
          "https://media.istockphoto.com/id/520889612/photo/boiled-eggs-in-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=gct393x2UpZ04yeIrxVQRqUheM22qxK5T2kJGSsUx0Q=",
      relatedImages: [
        "https://media.istockphoto.com/id/1129381764/photo/frying-egg-in-a-cooking-pan-in-domestic-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=9baP4WephXhoisOJqG7Xl9Jd97USZRWf1A6sW5GaJiE=",
        "https://media.istockphoto.com/id/1340214083/photo/child-holding-sliced-boiled-chicken-egg-black-isolated-background-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=Ez1-SplDsIYG6jVHhkY0niRhgKTVAfMCJTjTD8X0UH4=",
        "https://media.istockphoto.com/id/924202150/photo/white-eggs.webp?a=1&b=1&s=612x612&w=0&k=20&c=C2_rH1jK93o4JvlWcsWxh4uv7plDrxGr6WXv_4iPOSg=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 124,
      name: "Gulab Jamun",
      weight: "250 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Gulab Jamun is a popular Indian dessert made from deep-fried dough balls soaked in sugary syrup, often flavored with cardamom or rose water.",
      rating: "4.8",
      category: "Desserts & Sweets",
      image:
          "https://media.istockphoto.com/id/1194662949/photo/indian-dessert-or-sweet-dish-gulab-jamun-in-white-bowl-on-yellow-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=30gPokUxWD4D5rYgAEXrLSSKuCLvvmeEd_FLNwZ8HdM=",
      relatedImages: [
        "https://media.istockphoto.com/id/163064596/photo/gulab-jamun.webp?a=1&b=1&s=612x612&w=0&k=20&c=F_5_AgCdrsecO13W-wiuCZAwYZPBpN3UETTyYtQQlLM=",
        "https://media.istockphoto.com/id/521802535/photo/gulab-jamun-12.webp?a=1&b=1&s=612x612&w=0&k=20&c=Mri9HwChsS3eLZYXOMVHGL49Y3gLNhD-Ez-QIYeEfwQ=",
        "https://media.istockphoto.com/id/1340664725/photo/gulab-jamun.webp?a=1&b=1&s=612x612&w=0&k=20&c=YqkZQZy7RjDu3GISTi3OB0sPN7KKVhrlSXuk9z2KUQw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 125,
      name: "Rasgulla",
      weight: "300 gm",
      price: "₹130.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Rasgulla is a Bengali sweet made from chhena (cottage cheese) and semolina, soaked in a light sugar syrup. It is soft and spongy.",
      rating: "4.7",
      category: "Desserts & Sweets",
      image:
          "https://media.istockphoto.com/id/1756748995/photo/indian-traditional-sweet-rasgulla-with-alpona-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=83-yggfeHgmtwa3dnGYLpZ1ZfgJH51dR-R6zrcmdjgg=",
      relatedImages: [
        "https://media.istockphoto.com/id/1324070683/photo/indiafood.webp?a=1&b=1&s=612x612&w=0&k=20&c=7STEgQ9drzuTx2OqsiCnCXSA3MezvvQr3a8OqWKnVbs=",
        "https://media.istockphoto.com/id/495022082/photo/indian-sweet-rasgulla-is-a-syrupy-dessert-indian-cottage-cheese.webp?a=1&b=1&s=612x612&w=0&k=20&c=sc-KrQb5Y1rP2PhBGujLOic2bXC9SOmppVzr-SL57CA=",
        "https://media.istockphoto.com/id/1024534546/photo/raksha-bandhan-festival-conceptual-rakhi-made-using-plate-full-of-rasgulla-sweet-with-band-a.webp?a=1&b=1&s=612x612&w=0&k=20&c=Pa5LWOK3OzVoYI7GrTtby6n1YB8HDSvghpu3n7QuXzA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 126,
      name: "Jalebi",
      weight: "250 gm",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Jalebi is a crispy, sweet, and deep-fried dessert, often served hot and soaked in sugar syrup. It's a beloved snack and dessert across India.",
      rating: "4.5",
      category: "Desserts & Sweets",
      image:
          "https://media.istockphoto.com/id/1159362251/photo/jilebi.webp?a=1&b=1&s=612x612&w=0&k=20&c=1LM-7Th82oGTQ_rMrL1T6fP3jN0uaVG62yIILPrmkJQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/2094596044/photo/traditional-jalebi-indian-desserts-in-pastry-shop-and-street-food-on-markets.webp?a=1&b=1&s=612x612&w=0&k=20&c=uUs-wpqtKRlSdWkt9zYE9S3hojV1AXqM0bFWM07iK74=",
        "https://media.istockphoto.com/id/1311477883/photo/delicious-indian-delicacy-poha-jalebi-famous-in-madhya-pradesh.webp?a=1&b=1&s=612x612&w=0&k=20&c=B8u1vWwuALB4scVft4RH5FrML022Z9WZdYKimfvyvfw=",
        "https://media.istockphoto.com/id/178835774/photo/jalebi.webp?a=1&b=1&s=612x612&w=0&k=20&c=4uiIN7TlWgdkr57py6FDVOitlp64QNQMLp_SrVDG0Do=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 127,
      name: "Kheer",
      weight: "500 gm",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Kheer is a traditional Indian rice pudding made by boiling rice with milk and sugar, often flavored with cardamom, saffron, and garnished with nuts.",
      rating: "4.6",
      category: "Desserts & Sweets",
      image:
          "https://media.istockphoto.com/id/1307741167/photo/choshir-payesh-or-chushi-pitha.webp?a=1&b=1&s=612x612&w=0&k=20&c=N3TqLte-dnjzv9bjIqAzx_H1M1wvLi57ImSvXPnBBBM=",
      relatedImages: [
        "https://media.istockphoto.com/id/1480827583/photo/rice-pudding-served-in-clay-bowl-indian-rice-kheer-with-nuts-on-a-wooden-background-popular.webp?a=1&b=1&s=612x612&w=0&k=20&c=bfzo9QG6cVivIOLBI10Cyxi-MfGTq0E8tQbpEZvglLM=",
        "https://media.istockphoto.com/id/1319252912/photo/mango-flavored-phirni-served-in-metal-antique-plates.webp?a=1&b=1&s=612x612&w=0&k=20&c=v25GvjOn_LOg7PVHy5YF8_s4DCFJkgI2OLAiTDPPlw0=",
        "https://media.istockphoto.com/id/1317649946/photo/close-up-of-creamy-sabudana-kheer-garnished-with-dry-fruits-indian-delicious-dessert-served.webp?a=1&b=1&s=612x612&w=0&k=20&c=gQH9Udr6d53RJ52MCSI7MhB3XVN3uALe6G2IY6MEtF4=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 128,
      name: "Ladoo",
      weight: "250 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Ladoo is a round-shaped sweet made from flour, sugar, and ghee. It is often prepared during festivals and celebrations.",
      rating: "4.7",
      category: "Desserts & Sweets",
      image:
          "https://media.istockphoto.com/id/1660962945/photo/close-up-of-an-indian-sweet-motichoor-ladoo-also-called-boondi-ladoo.webp?a=1&b=1&s=612x612&w=0&k=20&c=iLjDrhdsFID7TKveLBCMrbX2fSfN6Y_43W4NOPPkTK0=",
      relatedImages: [
        "https://media.istockphoto.com/id/1660962945/photo/close-up-of-an-indian-sweet-motichoor-ladoo-also-called-boondi-ladoo.webp?a=1&b=1&s=612x612&w=0&k=20&c=iLjDrhdsFID7TKveLBCMrbX2fSfN6Y_43W4NOPPkTK0=",
        "https://media.istockphoto.com/id/1658875101/photo/close-up-of-an-indian-sweet-motichoor-ladoo-also-called-boondi-ladoo.webp?a=1&b=1&s=612x612&w=0&k=20&c=iNlgwZqgdonGdL3COr9XAL7payuhPN2t2lRHVbgqSeg=",
        "https://media.istockphoto.com/id/1054228718/photo/indian-sweets-in-a-plate-includes-gulab-jamun-rasgulla-kaju-katli-morichoor-bundi-laddu.webp?a=1&b=1&s=612x612&w=0&k=20&c=i_eG_hiRCHa1evPiSHYauXWHVSQ5LZ893QrdAlKB_vE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 129,
      name: "Barfi",
      weight: "200 gm",
      price: "₹200.00",
      isFavourite: 0,
      isDaily: 0,
      image:
          "https://media.istockphoto.com/id/1513617593/photo/sweets.webp?a=1&b=1&s=612x612&w=0&k=20&c=P9Vr1qn2JmXfSc5z0Sijv-zAIdDcx5cYubdn94jtsZM=",
      description:
          "Barfi is a dense, milk-based sweet, often flavored with cardamom, pistachios, and other nuts. It’s typically cut into square pieces.",
      rating: "4.8",
      category: "Desserts & Sweets",
      relatedImages: [
        "https://media.istockphoto.com/id/1433316355/photo/white-coconut-fudge-in-a-shell-of-coconut.webp?a=1&b=1&s=612x612&w=0&k=20&c=7nkKeBD6B5d8WvU-QOYxmy7KWfonswB1DRO3fCmsioQ=",
        "https://media.istockphoto.com/id/1264007265/photo/sweet-milk-peda-with-pistachio-garnishing-is-traditional-indian-sweet.webp?a=1&b=1&s=612x612&w=0&k=20&c=oZh5QecC3NmHzKQNdGORWPC-Afixjwq-l_aBSDFqaa0=",
        "https://media.istockphoto.com/id/1441889014/photo/festival-celebration-with-traditional-north-indian-burfi-made-with-mawa-almonds-and-cashew.webp?a=1&b=1&s=612x612&w=0&k=20&c=YVkS0bPzpFxLqXexw4fyLvWr5a3-VC_HD17HuAG3vHY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 130,
      name: "Chocolate Truffles",
      weight: "150 gm",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Chocolate truffles are rich, bite-sized chocolate confections made from a ganache center and coated in cocoa powder, chocolate, or nuts.",
      rating: "4.9",
      category: "Desserts & Sweets",
      image:
          "https://media.istockphoto.com/id/1141560948/photo/various-chocolate-pralines.webp?a=1&b=1&s=612x612&w=0&k=20&c=9qjksGmKHm4ShjPgBtajm3EZDyKftuygwC4GD9MupyU=",
      relatedImages: [
        "https://media.istockphoto.com/id/2153676695/photo/chocolate-sprinkles-coming-in-the-air-and-stops-on-brigadeiro-brazilian-dessert-ball-3d.webp?a=1&b=1&s=612x612&w=0&k=20&c=HhbLqPiC-n5TVjaL9cW0wwH0z4CTMEsANEur47xVGu8=",
        "https://media.istockphoto.com/id/519166564/photo/homemade-chocolate-sweets-and-green-tea-brewed-in-china-teapot.webp?a=1&b=1&s=612x612&w=0&k=20&c=6ZOIOR6Rat1riivbZ_Ry1gPeNufBBunRsYYEnDcElyg=",
        "https://media.istockphoto.com/id/1292450226/photo/freshly-made-chocolate-truffle-cream-cake-on-wooden-table-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=HwRE59djFY0QuiJ4rhLo9xM6Mt7VpiwLSR1jXqg-kbc=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 131,
      name: "Cooking Oil",
      weight: "1 Litre",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Cooking oil is used to fry, bake, and sauté foods. It helps in achieving the desired texture and flavor of various dishes. Options include vegetable oil, olive oil, and sunflower oil.",
      rating: "4.6",
      category: "Cooking Essentials",
      image:
          "https://media.istockphoto.com/id/1407936398/photo/assorted-healthy-vegetable-oil-bottle-collection-on-wooden-table-in-a-old-fashioned-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=NqkF2OMpxwOcsCzFfR-b4cuGpJ6vRfM_mTIEzhgfsnU=",
      relatedImages: [
        "https://media.istockphoto.com/id/1213567268/photo/frying-onions-and-chop-and-before-cooking.webp?a=1&b=1&s=612x612&w=0&k=20&c=rh5pJTjxzDfWpXxeixp4nh66Np-ywMVNRtjDkaDeLSQ=",
        "https://media.istockphoto.com/id/1943024532/photo/women-hand-using-serum-dropper.webp?a=1&b=1&s=612x612&w=0&k=20&c=1BcBzDR8FoclgmqIuUgc6AOsvq8bS14RU4wM2Gpcg-U=",
        "https://media.istockphoto.com/id/1250580614/photo/garlic-oil.webp?a=1&b=1&s=612x612&w=0&k=20&c=bcHmI5h2O7fOp6Pa2aWWAo4r-Z3te-doS_KG3yVpNvE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 132,
      name: "Ginger-Garlic Paste",
      weight: "200 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Ginger-Garlic paste is a common base for many Indian curries and dishes. It imparts a robust flavor and aroma and is often used as a cooking shortcut.",
      rating: "4.7",
      category: "Cooking Essentials",
      image:
          "https://media.istockphoto.com/id/1175229412/photo/closeup-of-ginger-bulb-isolated-in-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=2SM6_-1N9eRPPPCAs6-zgV96fMEwl8kv_PHAbLIMlX8=",
      relatedImages: [
        "https://media.istockphoto.com/id/481237804/photo/indian-masala-fried-bhindi-or-ladyfinger.webp?a=1&b=1&s=612x612&w=0&k=20&c=STUdmRzZtxNfe-N8LzwTK2p-9IJfsGrXX3i6iECM5Ag=",
        "https://media.istockphoto.com/id/480941212/photo/fried-masala-bhindi-or-ladyfinger-retro-style.webp?a=1&b=1&s=612x612&w=0&k=20&c=3dYwDUTAzm43etoaL_EL5PCowSedaoDJn9R016TCLxQ=",
        "https://media.istockphoto.com/id/1144202804/photo/authentic-thai-red-curry-past-recipe-with-ingredients-in-coconut-shells.webp?a=1&b=1&s=612x612&w=0&k=20&c=Tc5L1dkLSvJFwD_8UlDsA7tb-1WRm_0bm47UXF52C3k=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 133,
      name: "Turmeric Powder",
      weight: "100 gm",
      price: "₹30.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Turmeric powder is made from the dried root of the turmeric plant. It’s known for its golden color and is used for flavoring and coloring in cooking.",
      rating: "4.8",
      category: "Cooking Essentials",
      image:
          "https://media.istockphoto.com/id/1164067237/photo/turmeric-roots-and-powder-in-wood-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=C-L8mmrsnh1yk4ttp2XEKXE6zN0HXGdjRQFRiq-lB-Q=",
      relatedImages: [
        "https://media.istockphoto.com/id/950749440/photo/turmeric-powder-in-wood-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=QItU-QzrNGUaNPlUyz2L92rFZTgV0FHeg0_YxRm6vCg=",
        "https://media.istockphoto.com/id/894172672/photo/turmeric-powder-in-ceramic-bowl-with-raw-dried-turmeric-over-plain-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=gYUwp6rkRGru410zsM8IlOweWHV5NwJkr5WbJJid1PY=",
        "https://media.istockphoto.com/id/537623430/photo/turmeric-powder-with-roots-or-barks-on-black-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=1JEiGGKHuJpRBv_av5dGrIrVhQesGJ05xuNXeuoaEFA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 134,
      name: "Chili Powder",
      weight: "100 gm",
      price: "₹45.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Chili powder is ground dried chili peppers, used to add heat and spice to dishes. It's often used in curries, stews, and as a seasoning for various recipes.",
      rating: "4.7",
      category: "Cooking Essentials",
      image:
          "https://media.istockphoto.com/id/1306148433/photo/chilli-peppers.webp?a=1&b=1&s=612x612&w=0&k=20&c=eey8uLF6ZIT_bY9wcH8LXEkHBwzpbpngctQ7wTCqTas=",
      relatedImages: [
        "https://media.istockphoto.com/id/917777672/photo/red-chili-pepper-in-a-wooden-bowl-isolated-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=PvTBZoT3ueWLnhgfxW4qSKmoCPaLK-4mGdyfiQjVjZA=",
        "https://media.istockphoto.com/id/1357848115/photo/flying-hot-red-chili-peppers-with-paprika-powder-against-black-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=24HIrKobwM-uAHzHryC_Pq1jFoNCk62z6eAM9j4Xpig=",
        "https://media.istockphoto.com/id/1307887691/photo/green-chili-agriculture-field-in-india.webp?a=1&b=1&s=612x612&w=0&k=20&c=knbm4zMZOPxuKl2l6ioDlU4lg4logIRSxR8bmEMHnMk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 135,
      name: "Cumin Seeds",
      weight: "100 gm",
      price: "₹35.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Cumin seeds are small, aromatic seeds used to flavor a variety of dishes. They are commonly used in Indian, Middle Eastern, and Mexican cooking.",
      rating: "4.6",
      category: "Cooking Essentials",
      image:
          "https://media.istockphoto.com/id/1346906247/photo/cumin-seeds-called-jeera-in-clay-bowl-and-its-powder-in-white-bowl-on-dark-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=4LfQOPtE0FLEjTM1BNfxOIEGp2Yzw4_YM_TMKQN-CN8=",
      relatedImages: [
        "https://media.istockphoto.com/id/1152072821/photo/fennel-seeds-in-a-bowl-on-a-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=TQj4yFfYH-Je9st5n5Avy48yDueJQo4sbHWX_rcpZWY=",
        "https://media.istockphoto.com/id/474577579/photo/nigella-sativa-oil.webp?a=1&b=1&s=612x612&w=0&k=20&c=q_7v18MiMeF_uFtvvfalG4hMi8twW7aWFwRA89p3UGs=",
        "https://media.istockphoto.com/id/643760614/photo/variety-of-herbs-and-spices-on-slate-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=wOYJyb6pDf-mcJ391ic7u3d0MqQpv3N9qX7DRHT39UI=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 136,
      name: "Rice",
      weight: "1 kg",
      price: "₹70.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Rice is a staple food in many parts of the world, particularly in Asia. It’s often used as a side dish or the base of various recipes, including biryani, pulao, and fried rice.",
      rating: "4.9",
      category: "Cooking Essentials",
      image:
          "https://media.istockphoto.com/id/1480393747/photo/homemade-cosmetic-rice-water-with-ingredients-and-beauty-kit-on-beige-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=HBZow5YC36il4boGwjcU-wnL7kLtNQShoXd5Loadvpg=",
      relatedImages: [
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/2164241818/photo/chilli-garlic-fried-rice.webp?a=1&b=1&s=612x612&w=0&k=20&c=mT__UIxdyeWVqijLsOpp0jtf15Ohb9CIHjBSVmzUs-o=",
        "https://media.istockphoto.com/id/609613988/photo/indian-food-rice-pilaf.webp?a=1&b=1&s=612x612&w=0&k=20&c=jLVFBB0nMXEIEYsYkjMna-d4LWlCrU4FiIPQjyeklXs=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 137,
      name: "Basmati Rice",
      weight: "1 kg",
      price: "₹80.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Basmati rice is a long-grain rice variety known for its aromatic fragrance and fluffy texture. It is ideal for dishes like biryani, pulao, and pilaf.",
      rating: "4.8",
      category: "Rice",
      image:
          "https://media.istockphoto.com/id/1480393747/photo/homemade-cosmetic-rice-water-with-ingredients-and-beauty-kit-on-beige-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=HBZow5YC36il4boGwjcU-wnL7kLtNQShoXd5Loadvpg=",
      relatedImages: [
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/2164241818/photo/chilli-garlic-fried-rice.webp?a=1&b=1&s=612x612&w=0&k=20&c=mT__UIxdyeWVqijLsOpp0jtf15Ohb9CIHjBSVmzUs-o=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 138,
      name: "Jasmine Rice",
      weight: "500 gm",
      price: "₹50.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Jasmine rice is a fragrant rice variety with a soft and sticky texture. It is commonly used in Southeast Asian cuisine.",
      rating: "4.7",
      category: "Rice",
      image:
          "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
      relatedImages: [
        "https://media.istockphoto.com/id/2164241818/photo/chilli-garlic-fried-rice.webp?a=1&b=1&s=612x612&w=0&k=20&c=mT__UIxdyeWVqijLsOpp0jtf15Ohb9CIHjBSVmzUs-o=",
        "https://media.istockphoto.com/id/609613988/photo/indian-food-rice-pilaf.webp?a=1&b=1&s=612x612&w=0&k=20&c=jLVFBB0nMXEIEYsYkjMna-d4LWlCrU4FiIPQjyeklXs=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 139,
      name: "Brown Rice",
      weight: "2 kg",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Brown rice is a whole grain rice that retains the bran layer, making it rich in fiber. It's a healthier alternative to white rice.",
      rating: "4.6",
      category: "Rice",
      image:
          "https://media.istockphoto.com/id/2164241818/photo/chilli-garlic-fried-rice.webp?a=1&b=1&s=612x612&w=0&k=20&c=mT__UIxdyeWVqijLsOpp0jtf15Ohb9CIHjBSVmzUs-o=",
      relatedImages: [
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/609613988/photo/indian-food-rice-pilaf.webp?a=1&b=1&s=612x612&w=0&k=20&c=jLVFBB0nMXEIEYsYkjMna-d4LWlCrU4FiIPQjyeklXs=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 140,
      name: "Sona Masoori Rice",
      weight: "5 kg",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Sona Masoori rice is a medium-grain rice, popular in South India, known for its soft texture and mild aroma.",
      rating: "4.5",
      category: "Rice",
      image:
          "https://media.istockphoto.com/id/609613988/photo/indian-food-rice-pilaf.webp?a=1&b=1&s=612x612&w=0&k=20&c=jLVFBB0nMXEIEYsYkjMna-d4LWlCrU4FiIPQjyeklXs=",
      relatedImages: [
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/2164241818/photo/chilli-garlic-fried-rice.webp?a=1&b=1&s=612x612&w=0&k=20&c=mT__UIxdyeWVqijLsOpp0jtf15Ohb9CIHjBSVmzUs-o=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 141,
      name: "Wild Rice",
      weight: "1.5 kg",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Wild rice is a nutrient-dense rice variety known for its chewy texture and earthy flavor. It’s often used in salads, soups, and as a side dish.",
      rating: "4.6",
      category: "Rice",
      image:
          "https://media.istockphoto.com/id/1480393747/photo/homemade-cosmetic-rice-water-with-ingredients-and-beauty-kit-on-beige-background-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=HBZow5YC36il4boGwjcU-wnL7kLtNQShoXd5Loadvpg=",
      relatedImages: [
        "https://media.istockphoto.com/id/1165114438/photo/boiled-rice-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=nBdF05OTB0oS90cR7_34b8qEUCIRSWpGEXgeHRXcAws=",
        "https://media.istockphoto.com/id/2164241818/photo/chilli-garlic-fried-rice.webp?a=1&b=1&s=612x612&w=0&k=20&c=mT__UIxdyeWVqijLsOpp0jtf15Ohb9CIHjBSVmzUs-o=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 142,
      name: "Almonds",
      weight: "200 gm",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Almonds are rich in healthy fats, fiber, protein, magnesium, and vitamin E. They promote heart health and help with weight management.",
      rating: "4.8",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/1277000254/photo/top-view-of-almonds-on-dark-stone-table-with-wood-spoon-or-scoop-almond-in-wooden-bowl-nuts.webp?a=1&b=1&s=612x612&w=0&k=20&c=CnGyousXFcgCSCqLIQ08oYKhFxfNo-2KxKx8VK8LZd0=",
      relatedImages: [
        "https://media.istockphoto.com/id/1746319717/photo/soaked-almonds-in-bowl-good-source-for-protein-and-fiber.webp?a=1&b=1&s=612x612&w=0&k=20&c=5MSpYbc-JGfBOVfeHZ2hrraS3ZO8b1ukD-Ac5Es5dqQ=",
        "https://media.istockphoto.com/id/153711056/photo/almonds.webp?a=1&b=1&s=612x612&w=0&k=20&c=9GynO0KDFHgWN2JEUfV_AcGYbxtKjj0kueB-QBhRMdc=",
        "https://media.istockphoto.com/id/1338470396/photo/young-man-hand-hold-a-bowl-of-almond-nut-white-sited.webp?a=1&b=1&s=612x612&w=0&k=20&c=kcr7L4dDEKMsp-0TE6Xhp1KRxoLVwBQJ55w5CmIQbDY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 143,
      name: "Flax Seeds",
      weight: "100 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Flax seeds are rich in Omega-3 fatty acids, antioxidants, and fiber. They are beneficial for digestion, heart health, and reducing inflammation.",
      rating: "4.7",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/1391657458/photo/grains-of-flaxseed-are-poured-into-the-wooden-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=Ms9ZSh70lMzlM9FBfLTTwWZKkKnzvRWpzgoMWTxzCLA=",
      relatedImages: [
        "https://media.istockphoto.com/id/917390154/photo/brown-flax-seed-person-with-grains-in-hand-macro-whole-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=vbqV-5LXZ8DWuBsVTfiqNc2tUxewHt7ZB0_WvgFnocs=",
        "https://media.istockphoto.com/id/1384856847/photo/flaxseed-meal-in-a-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=dTntBfAtGBa6hdL1QnH2-QEWI_QgHQKdtu3Bc8Dew3c=",
        "https://media.istockphoto.com/id/482445000/photo/flax-powder-and-seeds.webp?a=1&b=1&s=612x612&w=0&k=20&c=ssm49FcyN7LhX6AIs8UTkOwZZJSqvgY3Hdc7BMKSDwU=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 144,
      name: "Chia Seeds",
      weight: "150 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Chia seeds are a powerhouse of nutrients, including Omega-3 fatty acids, fiber, antioxidants, and protein. They support healthy digestion and weight loss.",
      rating: "4.9",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/1309990810/photo/chia-lemon-water-in-glass-cup-with-slice-of-lemon-drinking-straw-and-spoon.webp?a=1&b=1&s=612x612&w=0&k=20&c=NfdyqVIElTFWCTEHHeBOwafl4JXO_DxJGxMbH_Ru2dQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/1126016819/photo/chia-seed-pudding-with-fresh-berries-for-the-breakfast.webp?a=1&b=1&s=612x612&w=0&k=20&c=RBnDHfAKeVy5S5MwHpxqxh7Vpx_eQavmB8FZWsi5H6g=",
        "https://media.istockphoto.com/id/1046872380/photo/glass-bowl-with-milk-chia-seed-pudding-on-dark-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=8O3FQFkoeA5-G_Um8YivePf_p4dviR8JJlL52IoyRgg=",
        "https://media.istockphoto.com/id/886500980/photo/healthy-chia-seeds-in-a-glass-jar.webp?a=1&b=1&s=612x612&w=0&k=20&c=b2Ry4hInDd6s3D2j9NJidlaqza1CDhbJRo31uiSV_Mw=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 145,
      name: "Quinoa",
      weight: "500 gm",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Quinoa is a gluten-free, high-protein grain that contains all nine essential amino acids. It is great for muscle repair, weight loss, and improving digestion.",
      rating: "4.6",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/638197896/photo/healthy-organic-quinoa-tabouli-salad.webp?a=1&b=1&s=612x612&w=0&k=20&c=y2B_h4wplQvpjxnohz36a6oe9c-xlTWua-AuSN6L7gM=",
      relatedImages: [
        "https://media.istockphoto.com/id/1308142612/photo/a-bowl-full-of-quinoa-khichdi-weight-loss-recepie.webp?a=1&b=1&s=612x612&w=0&k=20&c=gl77rwPAPfdNegGE3AcrYBcocf5SZL_w85XpnBbLRF8=",
        "https://media.istockphoto.com/id/476257600/photo/quinoa-pilaf-with-chicken-and-vegetables.webp?a=1&b=1&s=612x612&w=0&k=20&c=d-2R0bvQqym4mAC0k5vkrmzNA-PqFpJVXnONVDaAugk=",
        "https://media.istockphoto.com/id/1308141143/photo/a-bowl-full-of-quinoa-khichdi-weight-loss-recepie.webp?a=1&b=1&s=612x612&w=0&k=20&c=Pp_TC-FvuhSaXlrXWgrJXxG-XYF3ALrQKZ2l977CBTY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 146,
      name: "Oats",
      weight: "500 gm",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Oats are a great source of fiber and protein. They help in lowering cholesterol, improving digestion, and keeping you full longer. Perfect for breakfast!",
      rating: "4.7",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/1387640186/photo/masala-oats-in-a-bowl-directly-above-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=8Gvki012c0cdtzcAdKJv5On8uYVtmumrBBTalPWcwUc=",
      relatedImages: [
        "https://media.istockphoto.com/id/1408374876/photo/oatmeal-porridge-bowl-with-berry-fruits-in-female-hands.webp?a=1&b=1&s=612x612&w=0&k=20&c=ZF1u-1os1UjQtwAgsd1jnYkgx7XBteS3HSJijzLpvvo=",
        "https://media.istockphoto.com/id/1191001663/photo/vegetable-masala-oats-khichadi-served-in-a-bowl-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=QnCPLwPBPrFEpZ0qCg5OKe-i_doQilN-ZWZAsWoHpm0=",
        "https://media.istockphoto.com/id/1364757288/photo/overnight-oats-with-apple-and-almonds-made-by-soaking-rolled-oats-and-chia-seeds-in-milk.webp?a=1&b=1&s=612x612&w=0&k=20&c=Hx8MKBumvoY6QJSYtcFgt7cjsFTt8_uK7vC0COFD_No=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 147,
      name: "Honey",
      weight: "250 gm",
      price: "₹200.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Honey is a natural sweetener that provides antioxidants, vitamins, and minerals. It can soothe sore throats, boost immunity, and act as a natural energy booster.",
      rating: "4.8",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/520733611/photo/jar-of-honey-with-honeycomb.webp?a=1&b=1&s=612x612&w=0&k=20&c=1so2qQeNP-ddlrpVzWERgpYEyAjSGhv3gLnozxbVzjs=",
      relatedImages: [
        "https://media.istockphoto.com/id/1171918046/photo/child-a-plate-of-honey-in-the-hands-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=DOD0pqSg2Y9NGlAIxmCvRLrNm0K3FzJhdFfMkY22Li4=",
        "https://media.istockphoto.com/id/1211111663/photo/honey.webp?a=1&b=1&s=612x612&w=0&k=20&c=A2CuFJ0cMshpmYntHfhATDBrDTtDxGGLjfw3fPvqHBU=",
        "https://media.istockphoto.com/id/1146323945/photo/woman-holding-jar-of-honey-in-kitchen.webp?a=1&b=1&s=612x612&w=0&k=20&c=J74YMyZKYSHnN9fQfr1I1EYFoJvvJrTQ_V5KYhZscVM=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 148,
      name: "Green Tea",
      weight: "100 gm",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Green tea is packed with antioxidants and nutrients that promote brain function, fat burning, and overall health. It is great for boosting metabolism.",
      rating: "4.7",
      category: "Health Foods",
      image:
          "https://media.istockphoto.com/id/614992478/photo/like-tea.webp?a=1&b=1&s=612x612&w=0&k=20&c=qWxCooOWwtVt0bgNk051bAvaOyXnDmG2J_6PGh9IXP0=",
      relatedImages: [
        "https://media.istockphoto.com/id/628986454/photo/glass-cup-with-fresh-green-tea.webp?a=1&b=1&s=612x612&w=0&k=20&c=xOm46CPzgp5-gOOjLI1QNOlvowQE9FcqKo129YEjg8Y=",
        "https://media.istockphoto.com/id/1290341896/photo/young-woman-at-home-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=RcFur0AP8i_clVXryee6McEuhxD2gqoBunerey1mnXI=",
        "https://media.istockphoto.com/id/1355137149/photo/smiling-housewife-with-long-wavy-hair-at-home-in-sunny-day.webp?a=1&b=1&s=612x612&w=0&k=20&c=lOcGaNV9j9t6ZamN2Tj8lR5fji5LY24IePjM119MRiU=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 149,
      name: "Baby Lotion",
      weight: "200 ml",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Baby lotion is designed to gently moisturize and protect your baby's delicate skin. It is enriched with natural ingredients like aloe vera and shea butter.",
      rating: "4.8",
      category: "Baby Products",
      image:
          "https://media.istockphoto.com/id/1161825366/photo/mother-applying-sunscreen-protection-creme-on-cute-little-toddler-boy-face-mom-using.webp?a=1&b=1&s=612x612&w=0&k=20&c=l9pDo9MwkORRCtfTqyQv9M7YCmGZJFUDt9hohuJxVEo=",
      relatedImages: [
        "https://media.istockphoto.com/id/1255246280/photo/father-applying-body-cream-on-his-baby.webp?a=1&b=1&s=612x612&w=0&k=20&c=g8yeIqDA7RafR9fLB4_Z_Iy19Z0vwWvNmpD8lF71oDc=",
        "https://media.istockphoto.com/id/1253473636/photo/young-mother-fingers-applying-white-moisturizing-cream-on-baby-shoulder-care-about-children.webp?a=1&b=1&s=612x612&w=0&k=20&c=B5d5l2PQ1R9iCLvAoscCSFvgB2gZXn10hwwoiwDgpGM=",
        "https://media.istockphoto.com/id/1165864024/photo/sunscreen-on-the-skin-of-a-child-selective-focus.webp?a=1&b=1&s=612x612&w=0&k=20&c=szcb4CNPMPnGDJoPMFuEH3Xl6t5q33MmsmkfiUkTvBc=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 150,
      name: "Baby Shampoo",
      weight: "150 ml",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Baby shampoo is specially formulated to be gentle on your baby's hair and scalp. It helps to cleanse while keeping the hair soft and smooth.",
      rating: "4.7",
      category: "Baby Products",
      image:
          'https://media.istockphoto.com/id/1786465251/photo/cute-little-boy-washing-hair-with-shampoo-in-bathroom.webp?a=1&b=1&s=612x612&w=0&k=20&c=yLT-R5ExjaNqphpfpHcwesG5GFPJ-AQSTmbWVbwo85o=',
      relatedImages: [
        "https://media.istockphoto.com/id/1138878061/photo/happy-baby-boy-playing-with-bubbles-in-bath.webp?a=1&b=1&s=612x612&w=0&k=20&c=nDFFiWeN86yDrdkGGDuFjjCpwuCgA-unx5-axSTekqw=",
        "https://media.istockphoto.com/id/1215033444/photo/afro-american-man-washing-hair-of-adorable-newborn-child.webp?a=1&b=1&s=612x612&w=0&k=20&c=ylt79xVmAqfE6zfDBRDfKYh8zxVpB60RtxKyrD-JXFk=",
        "https://media.istockphoto.com/id/1141213432/photo/a-baby-girl-bathes-in-a-bath-with-foam-and-soap-bubbles.webp?a=1&b=1&s=612x612&w=0&k=20&c=YeTolQE-InzVoytWt-66YBnRk6MRimEdaSX4uZAjE58=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 151,
      name: "Diapers",
      weight: "30 ml",
      price: "₹400.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Diapers provide maximum absorbency and comfort to your baby. Made with soft materials, they are designed to keep your baby dry and happy all day long.",
      rating: "4.9",
      category: "Baby Products",
      image:
          "https://media.istockphoto.com/id/1052396268/photo/father-changing-diaper.webp?a=1&b=1&s=612x612&w=0&k=20&c=ZORBbMi7HC6CAaBIAqzteOXzkW3tpTylv9P5KBChsTM=",
      relatedImages: [
        "https://media.istockphoto.com/id/599748854/photo/mother-disposing-of-baby-nappy-in-bin.webp?a=1&b=1&s=612x612&w=0&k=20&c=45hRZvGFpUBAQYCS3YJY5t7lpovNlOPqb83YShR4KOo=",
        "https://media.istockphoto.com/id/1208525619/photo/mother-changing-diaper-for-her-son-on-white-bed-in-bedroom.webp?a=1&b=1&s=612x612&w=0&k=20&c=qwfhlTnulXn5tDOECpKuztPvadzttTpiccRh62ZDrWI=",
        "https://media.istockphoto.com/id/1297767145/photo/beautiful-caucasian-baby-laying-on-bed-playing-with-feet.webp?a=1&b=1&s=612x612&w=0&k=20&c=fYBbEQd7gXJOvBGUWaHKy1UOypwiRN3DkY7zHiJUy8U=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 152,
      name: "Baby Wipes",
      weight: "80 ml",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Baby wipes are gentle and alcohol-free, designed to clean your baby's sensitive skin. They are perfect for quick cleaning while on the go.",
      rating: "4.8",
      category: "Baby Products",
      image:
          "https://media.istockphoto.com/id/1335795828/photo/mom-wiping-her-newborn-baby-skin-face-with-wet-wipes-carefully-on-bed-at-home-family-cleaning.webp?a=1&b=1&s=612x612&w=0&k=20&c=gtE1q2E2jInNT7UK_wptpN8j_cmADYyyoOJYWyQaXdU=",
      relatedImages: [
        "https://media.istockphoto.com/id/152145349/photo/baby-wipes.webp?a=1&b=1&s=612x612&w=0&k=20&c=P6X5qUox1Aswq_y5AcylDPVbmPJO1uTpTIXXyMNyVOc=",
        "https://media.istockphoto.com/id/1405572591/photo/mother-cleaning-hand-of-her-baby-with-wet-wipe.webp?a=1&b=1&s=612x612&w=0&k=20&c=qT1608PtECP0dGy6FaWRBam_i-iWp75R64nrn1xAM14=",
        "https://media.istockphoto.com/id/1204419689/photo/remove-makeup-in-seconds-with-a-face-wipe.webp?a=1&b=1&s=612x612&w=0&k=20&c=aaVsTzk6zpR5_3IzhpR98J41bGNi3dc9p5lHjvQfIRo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 153,
      name: "Baby Food",
      weight: "200 gm",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Baby food is specially prepared to provide your baby with the nutrients needed for healthy growth. It includes essential vitamins, minerals, and proteins.",
      rating: "4.7",
      category: "Baby Products",
      image:
          "https://media.istockphoto.com/id/532593283/photo/trying-to-feed-a-baby-boy.webp?a=1&b=1&s=612x612&w=0&k=20&c=NVxZjgjeMtXgBfiMhcpI-M79AKBs8Emz6VmvpUnAbCI=",
      relatedImages: [
        "https://media.istockphoto.com/id/1910395630/photo/powdered-milk-portion-of-granulated-milk-powder.webp?a=1&b=1&s=612x612&w=0&k=20&c=S6-GcxAv7JUBp8DWitjBCWz_gbjGPbXJXZQVHlMLTzU=",
        "https://media.istockphoto.com/id/1370678609/photo/healthy-baby-food-on-white-wooden-table-closeup.webp?a=1&b=1&s=612x612&w=0&k=20&c=Lf8-1e0tW_HhTN2HrhB1lprYcr0Goc_ZRjK8uBy3BZs=",
        "https://media.istockphoto.com/id/514060988/photo/baby-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=eLlPwBPQ6HQUgNz1yNpA-tNVb8wRTkv187qADkfSBSk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 154,
      name: "Baby Bottle",
      weight: "1 litre",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Baby bottles are designed to mimic natural feeding. Made from safe, BPA-free materials, they are ideal for your baby's comfort and easy feeding.",
      rating: "4.6",
      category: "Baby Products",
      image:
          "https://media.istockphoto.com/id/1202450246/photo/my-boy-deserves-the-best-start-in-life.webp?a=1&b=1&s=612x612&w=0&k=20&c=RoFgkLqZz_YlXB3OaQj_At9D-fTvkiNRxyzw9AQjqxY=",
      relatedImages: [
        "https://media.istockphoto.com/id/526149927/photo/baby-boy-drinking-milk-from-milk-bottle.webp?a=1&b=1&s=612x612&w=0&k=20&c=1lzGTumfuPgpOkJohbhRZFogsm4lvDMvuErXZ-45Dso=",
        "https://media.istockphoto.com/id/1146850141/photo/mother-feeding-her-baby.webp?a=1&b=1&s=612x612&w=0&k=20&c=3kJhpmuswHbLIpw3N8HMVWtGsFrbCsU1xZ3JdWygYzw=",
        "https://media.istockphoto.com/id/1076596996/photo/close-up-of-loving-mother-feeding-newborn-baby-son-with-bottle-at-home.webp?a=1&b=1&s=612x612&w=0&k=20&c=GAQ1xkarS43g8HqXHrZ3SShHwgjCUzKgOwr7wcWlwDk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 155,
      name: "Baby Cream",
      weight: "100 gm",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Baby cream provides deep moisturization for your baby's sensitive skin. It is enriched with natural oils like coconut and almond oil, perfect for daily use.",
      rating: "4.7",
      category: "Baby Products",
      image:
          "https://media.istockphoto.com/id/1253473636/photo/young-mother-fingers-applying-white-moisturizing-cream-on-baby-shoulder-care-about-children.webp?a=1&b=1&s=612x612&w=0&k=20&c=B5d5l2PQ1R9iCLvAoscCSFvgB2gZXn10hwwoiwDgpGM=",
      relatedImages: [
        "https://media.istockphoto.com/id/1357608128/photo/mother-massaging-her-baby-boy-on-bed.webp?a=1&b=1&s=612x612&w=0&k=20&c=DtTED9WhI_RlL5AlvsMXus_GSVF1bVSpW0uvnLz7VVA=",
        "https://media.istockphoto.com/id/1181221282/photo/recently-cleaned-baby-ready-for-oil-mother-with-bottle-in-hand.webp?a=1&b=1&s=612x612&w=0&k=20&c=uay2IMFqwVxvpcgOuwYotERAWMAalkRqQYmogctTkug=",
        "https://media.istockphoto.com/id/1161825366/photo/mother-applying-sunscreen-protection-creme-on-cute-little-toddler-boy-face-mom-using.webp?a=1&b=1&s=612x612&w=0&k=20&c=l9pDo9MwkORRCtfTqyQv9M7YCmGZJFUDt9hohuJxVEo=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 156,
      name: "Dog Food",
      weight: "1 kg",
      price: "₹500.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Complete and balanced dog food with essential nutrients to support your dog's health. It contains proteins, vitamins, and minerals for growth and vitality.",
      rating: "4.6",
      category: "Pet Supplies",
      image:
          "https://media.istockphoto.com/id/1455673543/photo/senior-man-choosing-dog-food-in-pet-shop.webp?a=1&b=1&s=612x612&w=0&k=20&c=bGPeX2jdvtLBm_gukyIa4BGEm1NeMKBV32y3FgBeU-I=",
      relatedImages: [
        "https://media.istockphoto.com/id/1055030246/photo/labrador-retriever-dog-eating.webp?a=1&b=1&s=612x612&w=0&k=20&c=7vzRdB4-XSE8EQTTVVPYg7MfSI86wZIVJdEOAcCZ1O8=",
        "https://media.istockphoto.com/id/1055029940/photo/dog-food-in-a-stainless-steel-bowl.webp?a=1&b=1&s=612x612&w=0&k=20&c=D1M6nCaJpJP-NtkZ0wmOW-v9wiVnFxdwsHS8zJ03YRc=",
        "https://media.istockphoto.com/id/1324226429/photo/little-cute-maltipoo-puppy.webp?a=1&b=1&s=612x612&w=0&k=20&c=ZNOXfiQtjT3EChKYPkN4JiHd-MtNjlfeFjoK4xfZVW8=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 157,
      name: "Cat Food",
      weight: "800 gm",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 1,
      description:
          "Specially formulated cat food with a balanced mix of protein, vitamins, and minerals. Designed to support your cat's overall health and well-being.",
      rating: "4.7",
      category: "Pet Supplies",
      image:
          "https://media.istockphoto.com/id/647289304/photo/cat-feeding.webp?a=1&b=1&s=612x612&w=0&k=20&c=7-rzonM5ygZkn_SvxYEHRCX3Yt2DPuWiQoUoPTXGBCM=",
      relatedImages: [
        "https://media.istockphoto.com/id/1438310550/photo/cat-sits-on-the-windowsill-and-eats-dry-food-tabby-kitten-eating-from-orange-bowl-close-up.webp?a=1&b=1&s=612x612&w=0&k=20&c=sSWnr3vln6AwzYmA6LvVtdvXnXYQF_gyyFbMoKaGeQc=",
        "https://media.istockphoto.com/id/1951820781/photo/cat-food-on-pink-background-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=geqyC3QZXrQUoBRU5s5Bj6H16f6Kyi990A6il_f8fdQ=",
        "https://media.istockphoto.com/id/1041148726/photo/maine-coon-cat-licking-her-lips.webp?a=1&b=1&s=612x612&w=0&k=20&c=ns29IiopHw_Pw-B6WG8he_imHIaSnMRi4D_DmoUJnsE=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 158,
      name: "Dog Toys",
      weight: "1 kg",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Durable and fun dog toys that are safe for your pet. These toys help keep your dog entertained while promoting healthy teeth and gums.",
      rating: "4.5",
      category: "Pet Supplies",
      image:
          "https://media.istockphoto.com/id/1178352376/photo/happy-and-cheerful-dog-playing-fetch-with-toy-bone-at-backyard-lawn.webp?a=1&b=1&s=612x612&w=0&k=20&c=ctruHK7LJivA2MngnvsU0gjR1nS7foMYsRAEfxkLam4=",
      relatedImages: [
        "https://media.istockphoto.com/id/1307750599/photo/puppy.webp?a=1&b=1&s=612x612&w=0&k=20&c=yLZf1pNkC255bU9pr6CkPEnLEWHZYRBUgvWmvdDvnSY=",
        "https://media.istockphoto.com/id/1271793136/photo/happy-pet-dog-holding-in-mouth-blue-toy-bone-against-solid-colour-yellow-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=TnNPAZM8iJ17tGR436fReVvkmoC_2UorLEefuUYdrJ0=",
        "https://media.istockphoto.com/id/1149531683/photo/dog-chooses-and-fetches-rope-toy-from-hoard-of-pet-toys-in-cart.webp?a=1&b=1&s=612x612&w=0&k=20&c=sv_vQ5RrJs1UhPK5oAEX0q9bVmQN293hjuOFOSor5fc=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 159,
      name: "Cat Litter",
      weight: "5 kg",
      price: "₹450.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Premium cat litter made from natural materials. It absorbs moisture quickly and controls odor, ensuring a fresh environment for your cat.",
      rating: "4.8",
      category: "Pet Supplies",
      image:
          "https://media.istockphoto.com/id/1220156780/photo/domestic-cat-stepping-out-of-closed-litter-box-in-living-room-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=3bO5ev1g1BEyMoEZUFHJr_cfdNPlLLFeV05g_ojsPLg=",
      relatedImages: [
        "https://media.istockphoto.com/id/1164853312/photo/maine-coon-cat-using-the-litter-box.webp?a=1&b=1&s=612x612&w=0&k=20&c=Li5jntj-Dhey20B_nyEGGil9lIUDgFp5jIhlFyBIDnM=",
        "https://media.istockphoto.com/id/1218969227/photo/adult-woman-cleaning-cat-litter-box-at-home-stock-photo.webp?a=1&b=1&s=612x612&w=0&k=20&c=zoiMhILeKXbMgln3KY4T93k2HpNnCc63emOD51yIsOI=",
        "https://media.istockphoto.com/id/615512838/photo/cat-in-litter-box.webp?a=1&b=1&s=612x612&w=0&k=20&c=pTE_pZd6mjxbAvWe279hjEsfTzPDTkq9udeEDbiqXDM=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 160,
      name: "Dog Collar",
      weight: "150 gm",
      price: "₹300.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Durable dog collar with adjustable sizing. Made from high-quality materials, it ensures comfort and safety for your dog during walks.",
      rating: "4.6",
      category: "Pet Supplies",
      image:
          "https://media.istockphoto.com/id/1163846223/photo/cute-dog-portrait.webp?a=1&b=1&s=612x612&w=0&k=20&c=JS-Vs-FkUTlh6lfT0j6Ky3GRwBpvjF14M4jE-kTepEc=",
      relatedImages: [
        "https://media.istockphoto.com/id/1479943155/photo/young-dobermann-is-sitting-on-the-grass.webp?a=1&b=1&s=612x612&w=0&k=20&c=lBgpot5a7X58j6Nd_Ub8U3KvcqAX-MIyhPLMbZa6Bic=",
        "https://media.istockphoto.com/id/1394416086/photo/blank-cat-dog-id-tag-name-pendant-bone-necklace-collar-mockup.webp?a=1&b=1&s=612x612&w=0&k=20&c=P9Nkww1dfHqAFpGCnTLRO5SGU6qVmD_-ORsYQe001fU=",
        "https://media.istockphoto.com/id/1351669919/photo/blank-cat-dog-id-tag-name-pendant-bone-necklace-collar-mockup.webp?a=1&b=1&s=612x612&w=0&k=20&c=5G-WW0XDVnIbhRwbpYWeL3zxugb90pMxQabpLjWVl6g=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 161,
      name: "Cat Scratcher",
      weight: "1 kg",
      price: "₹350.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A cat scratcher that provides a fun and safe way for your cat to sharpen its claws. Made from durable materials that are gentle on your cat's paws.",
      rating: "4.7",
      image:
          "https://media.istockphoto.com/id/1364813886/photo/a-domestic-cat-climbs-up-a-cat-pole.webp?a=1&b=1&s=612x612&w=0&k=20&c=_NvAtMSPVI4Ec9TiQS_h1IGV-9vndFyKNvqhmFRoYSA=",
      category: "Pet Supplies",
      relatedImages: [
        "https://media.istockphoto.com/id/174078887/photo/i-scratch.webp?a=1&b=1&s=612x612&w=0&k=20&c=Spf9-89HpWkeaUkALpoZdi8HHGGEWvUI5cFnmNc7S58=",
        "https://media.istockphoto.com/id/1440280890/photo/bengal-cat-on-a-scratching-post-in-the-background-of-the-living-room.webp?a=1&b=1&s=612x612&w=0&k=20&c=GZKISHVf6v7cXHQBqqxmfd_V7qSft4Laa7SlyhvGrSc=",
        "https://media.istockphoto.com/id/618341526/photo/playful-cat.webp?a=1&b=1&s=612x612&w=0&k=20&c=oxLu9HrZz96DOQNb-jyQH6bTg9-4YQTDJAsKQoVxDug=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 162,
      name: "Pet Bed",
      weight: "1.5 kg",
      price: "₹800.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Comfortable and cozy pet bed designed to provide a safe and relaxing place for your pet to sleep. Made from soft and durable materials.",
      rating: "4.8",
      category: "Pet Supplies",
      image:
          "https://media.istockphoto.com/id/1125630990/photo/dog-sleeping-in-his-bad.webp?a=1&b=1&s=612x612&w=0&k=20&c=HRSHs5Y9mWTFJcJCgZnzFaFug5q5ci5VEiZbrQKjD2U=",
      relatedImages: [
        "https://media.istockphoto.com/id/995691042/photo/french-bulldog-puppy-sleeping-on-dog-bed.webp?a=1&b=1&s=612x612&w=0&k=20&c=kQ0M58RD6XfB01aSWRrXeURrvtSj9USYXLLGQK5Jb6Y=",
        "https://media.istockphoto.com/id/1298824982/photo/a-happy-long-haired-brown-tabby-cat-is-relaxing-on-a-felt-cat-bed-at-home-holding-his-paws.webp?a=1&b=1&s=612x612&w=0&k=20&c=zTNm84-IOHaHmopO7-JKoGSM3kpMBLlZeyQtnGPl-Cs=",
        "https://media.istockphoto.com/id/1209343968/photo/dog-sleeping-in-his-bad.webp?a=1&b=1&s=612x612&w=0&k=20&c=TXYJoWDoQ3c7chYykt2FcQFGR_b6rTFdfNaQUJfso8E=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 16,
      name: "Party Balloons",
      weight: "10 kg",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Colorful latex balloons perfect for any party. These balloons come in a variety of bright colors and are ideal for birthdays, weddings, or any celebration.",
      rating: "4.5",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/165789402/photo/balloons.webp?a=1&b=1&s=612x612&w=0&k=20&c=i8QjJrTSWSPzJ0OqNVJaqN2lNB3sWeJ1btjtSxP4-MY=",
      relatedImages: [
        "https://media.istockphoto.com/id/1796137048/photo/beautiful-young-indian-woman-running-with-multicolor-balloon-in-hands-at-the-beach-young-girl.webp?a=1&b=1&s=612x612&w=0&k=20&c=eAR-g8m8ItxK_CFgFxY6Hl_bFl-MX9gktlE4DBBcCho=",
        "https://media.istockphoto.com/id/1067024246/photo/arc-made-of-balloons-balloon-gate-portal-3d-rendering.webp?a=1&b=1&s=612x612&w=0&k=20&c=H6evFutrQsdmsXBqaTlF1wFWsZZAgyxfvyhXszdeHRc=",
        "https://media.istockphoto.com/id/1369303790/photo/cappadocia-valley-at-sunrise.webp?a=1&b=1&s=612x612&w=0&k=20&c=kxSvVnHoX0x4RC4q4Ko1i8L6VXaWALIlDNSt-_9e-ow=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 164,
      name: "Party Hats",
      weight: "6 kg",
      price: "₹150.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Fun and colorful party hats made from durable paper material. Great for adding a festive touch to your party, these hats are perfect for all ages.",
      rating: "4.6",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/136400027/photo/colorful-party-hats.webp?a=1&b=1&s=612x612&w=0&k=20&c=Y91K09Vg2fut1ZyR2OF32dIWABzX3TIwq74cR3f0V58=",
      relatedImages: [
        "https://media.istockphoto.com/id/155309484/photo/happy-birthday-isolated-party-hat.webp?a=1&b=1&s=612x612&w=0&k=20&c=fOyuc0kNAiWWh4O9yCXoYUziglZeecIulHcbxKskbVc=",
        "https://media.istockphoto.com/id/1331506556/photo/party-hat-on-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=JF20xEYk5HfNEhVeazzyHl125B_FhkymqAyOGg521MI=",
        "https://media.istockphoto.com/id/850120538/photo/office-worker-party-man.webp?a=1&b=1&s=612x612&w=0&k=20&c=dArU3clAPd0X345zNpknTNEaegvPPoQwscGKbTnlRiY=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 165,
      name: "Paper Plates",
      weight: "20 ml",
      price: "₹100.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Disposable paper plates that are perfect for serving snacks and meals at your party. These eco-friendly plates come in a variety of designs and sizes.",
      rating: "4.7",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/1353364542/photo/disposable-paper-plates-on-a-white-background-view-from-above.webp?a=1&b=1&s=612x612&w=0&k=20&c=1dOAsVV7Z0cfjz2phbiPRR_x705qh7orl02uNbKOV28=",
      relatedImages: [
        "https://media.istockphoto.com/id/531633030/photo/disposable-paper-plate.webp?a=1&b=1&s=612x612&w=0&k=20&c=c-Xi4PsA_xBMzCITUw1gk6xJzI3-oQBjW8oLhwJsNjo=",
        "https://media.istockphoto.com/id/1081628214/photo/puri-ghugni-chaat.webp?a=1&b=1&s=612x612&w=0&k=20&c=dH1CAlfm4NXOyxPIqLBnHcL289iGURXv83EcqE7Dp_M=",
        "https://media.istockphoto.com/id/1193331764/photo/recycled-eco-friendly-disposable-tableware-made-of-paper-on-a-green-background-top-view-copy.webp?a=1&b=1&s=612x612&w=0&k=20&c=ikl8n3Bx6Vhh_cVVdfNx9b0TVK2-KVGC4npFpvPBQmI=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 166,
      name: "Party Streamers",
      weight: "10 ml",
      price: "₹200.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Bright and colorful streamers that add a vibrant touch to your party decorations. Perfect for birthdays, weddings, and other celebrations.",
      rating: "4.8",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/2148839271/photo/4th-of-july-independence-day-of-the-usa-celebration-concept-american-balloons-and-party.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKZn2zWoQrixg9IjZ1pz8X50111cud2wRQFeKgnQegQ=",
      relatedImages: [
        "https://media.istockphoto.com/id/2042237102/photo/wind-chime-hanging-from-ceiling.webp?a=1&b=1&s=612x612&w=0&k=20&c=OsddKcWzId3_Q6VW1phGmosnBY5000roXqwfzGAcbyg=",
        "https://media.istockphoto.com/id/170647690/photo/curled-pink-ribbons-on-a-white-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=oojisHFxDbxlYipsdzJT55nsIBTjYZgjgL0P_7PFuEE=",
        "https://media.istockphoto.com/id/2157740144/photo/amazing-view-of-a-twenty-first-birthday-cake-with-beautiful-decoration-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=3mi_CLlqvlHoRPdPGxtOsBityqgRPwgMxis5cLSS3Xk=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 167,
      name: "Confetti",
      weight: "100 gm",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Colorful confetti to make your celebrations even more fun. Perfect for throwing at parties, weddings, or New Year's celebrations.",
      rating: "4.5",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/1433126327/photo/festive-glittering-falling-confetti-elegant-colorful-particle-flow-gentle-stream-of-luxury.webp?a=1&b=1&s=612x612&w=0&k=20&c=x9qFvcXYXWgw6FPJUmVhJ5hdTOFuMlVgu92bWfoZr94=",
      relatedImages: [
        "https://media.istockphoto.com/id/977706014/photo/gold-glitter-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=6ZBWk5VS-zxcML9rYLLGQ6-Z1OHGhySfBDY7aVJ8m5E=",
        "https://media.istockphoto.com/id/1325096635/photo/fireworks-fourth-of-july-usa-glitter-light-sparks-confetti-dust-particle-exploding-spray-red.webp?a=1&b=1&s=612x612&w=0&k=20&c=nGpg-VeKlYvh49tE9sMMOJzdIKAVSLFlewLVIWRZl9Y=",
        "https://media.istockphoto.com/id/895643118/photo/beautiful-blurred-golden-bokeh-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=TL9WK6JVPUOnL_fFDvTZxGb0Z-heO0XDUBp1FtHZb04=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 168,
      name: "Cake Topper",
      weight: "1 kg",
      price: "₹250.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Elegant cake toppers that are perfect for adding a decorative touch to your birthday or wedding cake. Available in various themes and designs.",
      rating: "4.6",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/157608063/photo/elegant-wedding-cake.webp?a=1&b=1&s=612x612&w=0&k=20&c=0Rhext8PqdcjirN9fN6dkqWkcTpO7WAc0SYmdrw5H4Y=",
      relatedImages: [
        "https://media.istockphoto.com/id/1431578150/photo/mattress-topper-being-laid-on-top.webp?a=1&b=1&s=612x612&w=0&k=20&c=34DMRxS0uQMQ0YvJqhrtCiFrcNqHUlYUgv0HiGC1aUM=",
        "https://media.istockphoto.com/id/1211289807/photo/young-intelligent-girl-in-her-early-20s-studying-in-college-library-and-preparing-hard-for.webp?a=1&b=1&s=612x612&w=0&k=20&c=OVXccPZAv-bK7J9stkvsV6V4LfRwLP2nFgKhbLUTvEw=",
        "https://media.istockphoto.com/id/2152848916/photo/elegant-fathers-day-gift-box-with-festive-happy-fathers-day-topper-and-decorative-stars.webp?a=1&b=1&s=612x612&w=0&k=20&c=vtIGlsvOd6tipCelUcjcDEUuze4JcIHhK0R-knTSK3U=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 169,
      name: "Party Banner",
      weight: "1 ml",
      price: "₹180.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "A decorative party banner that adds a festive touch to your party venue. It comes in various designs like 'Happy Birthday' or 'Congratulations'.",
      rating: "4.7",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/956870548/photo/colorful-party-flags-isolated-on-white-background-birthday-anniversary-celebrate-event.webp?a=1&b=1&s=612x612&w=0&k=20&c=YgL7i2NUJ0SzuF9ZOfEvQWpkmfof0ubfZCq0v_E5D0M=",
      relatedImages: [
        "https://media.istockphoto.com/id/619045252/photo/birthday-decoration-flags.webp?a=1&b=1&s=612x612&w=0&k=20&c=FE6Jr3H_DfwiIHwCQ-oafIu_wTkuQw00gIF73YMhYDw=",
        "https://media.istockphoto.com/id/960290952/photo/colorful-flags-isolated-on-white-background-with-clipping-path.webp?a=1&b=1&s=612x612&w=0&k=20&c=bQFSePEd3Z-lzi5bX8VfBZdUp89-21ZXr48PcsW8A-Y=",
        "https://media.istockphoto.com/id/896079766/photo/christmas-and-new-years-eve-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=K6lHkY13h3KAR3d8URbWGzvkwYpkv86AujaVjB0kaIA=",
      ],
    ),
    ProductModel(
      quantity: "0",
      id: 170,
      name: "Disposable Cups",
      weight: "25 kg",
      price: "₹120.00",
      isFavourite: 0,
      isDaily: 0,
      description:
          "Disposable cups that are perfect for serving drinks at your party. Available in a variety of sizes and colors to match your party theme.",
      rating: "4.5",
      category: "Party Supplies",
      image:
          "https://media.istockphoto.com/id/1401266458/photo/reusable-eco-coffee-cup-on-table-with-copy-space.webp?a=1&b=1&s=612x612&w=0&k=20&c=u_OhlxOzu7gBMfJkRQ7ncOfEZb1VvcGx9tgph_4K_xw=",
      relatedImages: [
        "https://media.istockphoto.com/id/491528020/photo/close-up-of-disposable-plastic-cups.webp?a=1&b=1&s=612x612&w=0&k=20&c=YJf6ILVTwfWqpnHIGYc1QeE3cZ0ghAvJRPJ8oLtnUa4=",
        "https://media.istockphoto.com/id/184847918/photo/white-paper-cup.webp?a=1&b=1&s=612x612&w=0&k=20&c=A7Ez_vGdi_2W3vGPU2LBbWqgpK8W33Go3gJnOnEXqg8=",
        "https://media.istockphoto.com/id/1027241440/photo/view-from-indian-train-with-coffee-cup.webp?a=1&b=1&s=612x612&w=0&k=20&c=H7jarKQsw7NO2bO07PdEpiuqQovnzHNLWPLnJtMAoVM=",
      ],
    ),
  ];
}

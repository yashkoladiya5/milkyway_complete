class AppStrings {
  static const String logIn = "L O G I N";
  static const String contactNo = "Contact No.";
  static const String password = "Password";
  static const String rememberMe = "Remember me";
  static const String forgotPassword = "Forgot Password?";
  static const String logInButton = "LOG IN";
  static const String createNewAccount = "Create New Account ?";
  static const String clickHere = "Click Here";
  static const String signUpHeading = "S I G N  U P";
  static const String signUpName = "Name*";
  static const String signUpState = "Select Area*";
  static const String signUpAddress = "Address*";
  static const String signUpPincode = "Pincode*";
  static const String signUpCurrentLocation = "Current location";
  static const String signUpMobileNo = "Mobile Number*";
  static const String signUpEmail = "E-mail ID*";
  static const String signUpPassword = "Password";
  static const String signUpConfirmPassword = "Confirm Password";
  static const String signUpTermsAndConditions = "Terms & Conditions";
  static const String signUpButton = "SIGN UP";

  static const String forgotPasswordHeading = "Forgot Password";
  static const String forgotPasswordDescription =
      "Enter Your Register Email id or Mobile number\nwe will send you an OTP .";
  static const String forgotPasswordTextFieldHintText =
      "E-mail Id or Mobile number";
  static const String sendButton = "SEND";
  static const String enterOTP = "Enter OTP";
  static const String otpDescription =
      "We have sent you access code via\nSMS or Email id for verification. ";
  static const String verifyButton = "VERIFY";
  static const String doNotGetCode = "Don't Get Code?";
  static const String resendButton = "Resend";
  static const String oopsMessage = "Oops!!";
  static const String otpDialogErrorContent =
      "Maximum try for OTP has reached , please try again\n24 Hours also check email for OTP too.";
  static const String createNewPasswordHeading = "Create New Password";
  static const String createNewPasswordTextField = "New Password";
  static const String createConfirmNewPasswordTextField = "Confirm Password";
  static const String updateButton = "UPDATE";
  static const String logInNumberExistSnackBarContent =
      "Please Enter Valid Number Or Password";

  static const String balanceHomePage = "Balance";
  static const String serialNo = "Sr no.";
  static const String productName = "Product Name";
  static const String liter = "Liter";
  static const String kg = "kg";
  static const String gm = "gm";
  static const String categories = "Categories";
  static const String favouriteProducts = "Favourite Products";
  static const String search = "Search";
  static const String popularSearch = "Popular Search";
  static const String rating = "Rating";
  static const String productYouMightLike = "Product You Might Like";
  static const String addToCart = "Add To Cart";
  static const String paymentDetails = "Payment Details";
  static const String bagTotal = "Bag Total";
  static const String discount = "Discount";
  static const String totalAmount = "Total Amount";
  static const String placeOrder = "Place Order";
  static const String location = "Location";
  static const String fullName = "Full Name";
  static const String cardNumber = "Card Number";
  static const String validUntil = "Valid Until";
  static const String cvv = "CVV";
  static const String saveCardData = "Save card data for future payment";
  static const String milkywayWebsite = "www.milkyway.com";
  static const String offers = "Offers";
  static const String uploadBalanceWithUPIId = "Upload Balance With UPI Id";
  static const String setAutoPayment = "Set Auto Payment";
  static const String payNow = "Pay Now";
  static const String autoPayment = "Auto Payment";
  static const String comingSoon = "Coming Soon";
  static const String balanceUnder = "Balance Under";
  static const String payment = "Payment";
  static const String selectModeForPayment = "Select Mode For Payment";
  static const String deliveryAddress = "Delivery Address";
  static const String processToBuy = "Process To Buy";
  static const String dearCustomer = "Dear Customer,";
  static const String medicinePageDescription =
      " Please click image of your Allopathy / Ayurvedic prescription photo and we will send you medicines next day with discount!!";
  static const String medicine = "Medicine";
  static const String upload = "Upload";
  static const String medicineAddPageDescription =
      "Your prescription sent successfully";

  static const String billPay = "Bill Pay";
  static const String rechargeAndBill = "Recharge & Bill";
  static const String mobileRecharge = "Mobile Recharge";
  static const String enterMobileNumber = "Enter Mobile Number";
  static const String operator = "Operator";
  static const String state = "State";
  static const String enterPlanAmount = "Enter Plan Amount";
  static const String continueText = "Continue";
  static const String gasBill = "Gas Bill";
  static const String payGasBill = "Pay Gas Bill";
  static const String bookAGasCylinder = "Book a Gas Cylinder";
  static const String selectGasProvider = "Select Gas Provider";
  static const String enterCustomerMobile = "Enter Customer Mobile No";
  static const String customerName = "Customer Name : ";
  static const String dealerName = "Dealer Name : ";
  static const String billAmount = "Bill Amount : ";
  static const String continueToPay = "Continue to Pay ";
  static const String enterCustomerID = "Enter Customer Id";
  static const String electricityBill = "Electricity Bill";
  static const String dueDate = "Due Date";

  static const String selectElectricityBoardToProceed =
      "Select Electricity Board to Processed";

  static const String consumerNumber = "Consumer Number";
  static const String wallet = "wallet";
  static const String add = "Add";
  static const String income = "Income";
  static const String expense = "Expense";
  static const String transactionDetail = "Transaction Detail";
  static const String invoice = "Invoice";
  static const String profile = "Profile";
  static const String editProfile = "Edit Profile";
  static const String save = "Save";
  static const String changePassword = "Change Password";
  static const String change = "Change";
  static const String order = "Order";
}

class SharedPreferenceKeys {
  static const String userIdKey = "userId";
  static const String userDataKey = "userEmailPassword";
  static const String planKey = "selectedPlan";
  static const String locationIdKey = "locationId";
}

class DatabaseProductTableStrings {
  static const String tableName = "ProductTable";
  static const String productId = "id";
  static const String productName = "name";
  static const String productWeight = "weight";
  static const String productPrice = "price";
  static const String productIsFavourite = "isFavourite";
  static const String productIsDaily = "isDaily";
  static const String productDescription = "description";
  static const String productRating = "rating";
  static const String productCategory = "category";
  static const String productRelatedImages = "relatedImages";
  static const String productImage = "image";
  static const String productQuantity = "quantity";
}

class DatabaseRechargeTableStrings {
  static const String tableName = "RechargePlansTable";
  static const String companyName = "company";
  static const String companyCategory = "category";
  static const String companyData = "data";
  static const String companyVoice = "voice";
  static const String companySms = "sms";
  static const String companyValidity = "validity";
  static const String companySubscription = "subscription";
  static const String companyOffer = "offer";
  static const String companyPrice = "price";
}

class DatabaseGasBookingTableStrings {
  static const String tableName = "GasBooking";
  static const String providerName = "gasProviderName";
  static const String registeredMobile = "registeredMobile";
  static const String cylinderPrice = "cylinderPrice";
  static const String paymentStatus = "paymentStatus";
  static const String dealerName = "dealerName";
  static const String image = "image";
}

class DatabasePayGasBillTableStrings {
  static const String tableName = "payGasBill";
  static const String providerName = "gasProviderName";
  static const String customerId = "customerId";
  static const String customerName = "customerName";
  static const String registeredMobile = "registeredMobile";
  static const String billAmountRemain = "billAmountRemain";
  static const String dealerName = "dealerName";
  static const String image = "image";
}

class DatabaseElectricityTableStrings {
  static const String tableName = "Electricity";
  static const String customerNo = "customerNo";
  static const String customerName = "name";
  static const String electricityProvider = "electricityProvider";
  static const String image = "image";
  static const String dueDate = "dueDate";
  static const String amount = "amount";
  static const String state = "state";
}

class DatabaseIncomeExpenseTableStrings {
  static const String tableName = "incomeExpense";
  static const String name = "name";
  static const String price = "price";
  static const String date = "date";
  static const String quantity = "quantity";
  static const String isExpense = "isExpense";
  static const String isIncome = "isIncome";
  static const String weightValue = "weightValue";
  static const String weightUnit = "weightUnit";
  static const String image = "image";
}

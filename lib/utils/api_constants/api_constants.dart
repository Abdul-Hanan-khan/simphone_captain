class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://simphoneserver.herokuapp.com";
  static const String signUp = "$baseUrl/api/users/customer";
  static const String login = "$baseUrl/api/auth/mobileLogin";
  static const String allSims = "$baseUrl/api/sims/complete";
  static const String allWifiDevices = "$baseUrl/api/wifidevices";
  static const String allPhones = "$baseUrl/api/mobiles";
  static const String productOrder = "$baseUrl/api/orders";
  static const String customerOrder = "$baseUrl/api/orders/captain";
  static const String simSearch = "$baseUrl/api/sims/search";
  static const String deviceOrder = "$baseUrl/api/orders/device";
  static const String mobileOrder = "$baseUrl/api/orders/mobile";
  static const String getUser = "$baseUrl/api/auth";
  static const String getAllCaptain = "$baseUrl/api/franchises";
  static const String getCaptainSims = "$baseUrl/api/sims/franchise-any/";
  static const String updateUser = "$baseUrl/api/users/chnageUser";
  static const String updateStatus = "$baseUrl/api/orders/status/captain/";
}

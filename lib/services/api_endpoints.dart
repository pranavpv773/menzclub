class ApiEndPoints {
  static String baseUrl = 'https://menzclub.herokuapp.com';
  static String loginAPI = '$baseUrl/account/login';
  static String signUpAPI = '$baseUrl/account/signup';
  static String otpVerifyAPI = '$baseUrl/account/otp';
  static String getShirts = '$baseUrl/api/menzclub/get-shirt';
  static String getTshits = '$baseUrl/api/menzclub/get-Tshirt';
  static String getJeans = '$baseUrl/api/menzclub/get-jeans';
  static String getshoes = '$baseUrl/api/menzclub/get-shoes';
  static String getWatches = '$baseUrl/api/menzclub/get-watches';
  static String getHomeBanner = '$baseUrl/api/menzclub/banner?banner_category=';
  static String addToCartApi = '$baseUrl/api/add-to-cart';
}

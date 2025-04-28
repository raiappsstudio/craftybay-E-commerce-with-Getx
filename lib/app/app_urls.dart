class AppUrls{
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String signinUrl = '$_baseUrl/auth/login';
  static const String verifyOtpUpUrl = '$_baseUrl/auth/verify-otp';
  static const String categoriesUrl = '$_baseUrl/categories';
  static const String slidersUrl = '$_baseUrl/slides';
  static const String productUrl = '$_baseUrl/products';
  static  String productDetailsUrl(String productId) => '$_baseUrl/products/id/$productId';
  static  String reviewlistUrl(String productId) => '$_baseUrl/reviews?product=$productId';

  static const String cartUrl = '$_baseUrl/cart';


}
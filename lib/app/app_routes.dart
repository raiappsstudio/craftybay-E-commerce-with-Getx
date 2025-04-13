import 'package:craftybay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:craftybay/features/auth/ui/screens/splash_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_bar_Screen.dart';
import 'package:craftybay/features/home/ui/screens/home_screen.dart';
import 'package:craftybay/features/products/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/sign_up_screen.dart';
import '../features/auth/ui/screens/verify_otp_screen.dart';
import '../features/cart/ui/screens/cart_list_screen.dart';
import '../features/categories/screens/category_list_sreen.dart';
import '../features/products/ui/screens/product_list_screen.dart';
import '../features/reviews/ui/screens/create_review_screen.dart';
import '../features/reviews/ui/screens/reviews_screen.dart';
import '../features/wishlist/ui/screens/wish_list_screen.dart';

class AppRoutes{

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget route;

   if (settings.name==SplashScreen.name) {
     route = const SplashScreen();

   }else if (settings.name == SignInScreen.name){
     route = const SignInScreen();
   }else if (settings.name == SignUpScreen.name){
     route = const SignUpScreen();
   }else if (settings.name == MainBottomNavBarScreen.name){
     route = const MainBottomNavBarScreen();
   }else if (settings.name == HomeScreen.name){
     route = const MainBottomNavBarScreen();
   }else if (settings.name == HomeScreen.name){
     route = const MainBottomNavBarScreen();
   }else if (settings.name == CategoryListSreen.name){
     route = const CategoryListSreen();
   }else if (settings.name == ProductListScreen.name){
     final String category = settings.arguments as String;
     route =  ProductListScreen(category: category);
   }else if (settings.name == ProductDetailsScreen.name){
     route =  const ProductDetailsScreen();
   }else if (settings.name == CartListScreen.name){
     route =  const CartListScreen();
   }else if (settings.name == ReviewsScreen.name){
     route =  const ReviewsScreen();
   }else if (settings.name == CreateReviewScreen.name){
     route =  const CreateReviewScreen();
   }else if (settings.name == VerifyOtpScreen.name){
     String email = settings.arguments as String;
     route =  VerifyOtpScreen(email: email);
   }

   return MaterialPageRoute(builder: (context){

     return route;
   });

  }

}
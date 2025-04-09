import 'package:craftybay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:craftybay/features/auth/ui/screens/splash_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_bar_Screen.dart';
import 'package:craftybay/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/sign_up_screen.dart';
import '../features/categories/screens/category_list_sreen.dart';

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
   }

   return MaterialPageRoute(builder: (context){

     return route;
   });

  }

}
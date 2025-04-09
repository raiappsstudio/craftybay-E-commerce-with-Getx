import 'package:craftybay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_bar_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'sign_in_screen.dart';
import '../widgets/app_logo.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }


  Future<void> _moveToNextScreen () async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavBarScreen.name);

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const AppLogo(),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 10,),
            Text('${AppLocalizations.of(context)!.version}')
          ],
        ),
      ),
    );
  }
}


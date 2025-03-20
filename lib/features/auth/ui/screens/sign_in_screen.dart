import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/core/extensions/localization_extension.dart';
import 'package:craftybay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:craftybay/features/auth/ui/widgets/app_logo.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = 'signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              AppLogo(),
              const SizedBox(
                height: 24,
              ),
              Text(
                context.localization.welcomeBack,
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                context.localization.enterMail,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: context.localization.email,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseCrashlytics.instance.log("Entered sign in button");
                  throw Exception('my custom error');
                },
                child: Text(context.localization.signin),
              ),
              const SizedBox(height: 24),

              //=Rich text=============================================
              RichText(text:  TextSpan(
                text: "Don't have an account?",
                style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(text: 'Sign up',
                      style: const TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        _onTapSignUpButton();
                      }

                    ),
                  ]

              )

              )
              
              
            ],
          ),
        ),
      ),
    );
  }



  void _onTapSignUpButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }

}

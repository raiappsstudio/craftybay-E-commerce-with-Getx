import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/core/extensions/localization_extension.dart';
import 'package:craftybay/features/auth/ui/widgets/app_logo.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstTEController = TextEditingController();
  final TextEditingController _lastTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                  controller: _emailTEController,
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
                  controller: _firstTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.firstName,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _lastTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.lastName,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _phoneTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.phone,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    hintText: context.localization.deliveryAddress,
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
                    child: Text(context.localization.signUp)),
                const SizedBox(
                  height: 24,
                ),
                //=Rich text=============================================
                RichText(text:  TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(text: 'Sign In',
                          style: const TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            _onTapSinginButton();
                          }

                      ),
                    ]

                )

                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSinginButton(){
    Navigator.pop(context);

  }




}

import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/core/extensions/localization_extension.dart';
import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/core/widgets/show_snack_bar_message.dart';
import 'package:craftybay/features/auth/data/models/signup_model.dart';
import 'package:craftybay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:craftybay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:craftybay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.find<SignUpController>();
  
  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _SignUpForm(context, textTheme),


        ),
      ),
    );
  }



  //====================================================
  Widget _SignUpForm(BuildContext context, TextTheme textTheme) {
    return Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 60),
              AppLogo(),
              const SizedBox(height: 24),
              Text(
                context.localization.welcomeBack,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                context.localization.enterMail,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailTEController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: context.localization.email,
                ),
                validator: (String? value) {
                  String email = value?? "";
                  if (!EmailValidator.validate(email)) {
                    return 'Enter a Valid Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _firstTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.firstName,
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your First Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _lastTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.lastName,
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your Last Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phoneTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.phone,
                ),
                validator: (String? value) {
                  String phoneNumber = value??'';
                  RegExp regExp = RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$');
                  if (regExp.hasMatch(phoneNumber)==false) {
                    return 'Enter a Valid Number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
                validator: (String? value) {
                  if ((value?.isEmpty ?? true) || value!.length < 6) {
                    return 'Enter a Password more than 6 letters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _addressTEController,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 16),
                  hintText: context.localization.deliveryAddress,
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your Delivery Address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              GetBuilder<SignUpController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: CenteredCircularProgressbar(),
                    child: ElevatedButton(
                        onPressed: () {
                          _onTapSignUpButton();
                        },
                        child: Text(context.localization.signUp)),
                  );
                }
              ),
              const SizedBox(height: 24),
              //=Rich text=============================================
              RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                      children: [
                    TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _onTapSignInButton();
                          }),
                  ]))
            ],
          ),
        );
  }

  Future<void> _onTapSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
          email: _emailTEController.text.trim(),
          firstName: _firstTEController.text.trim(),
          lastName: _lastTEController.text.trim(),
          phone: _phoneTEController.text.trim(),
          password: _passwordTEController.text,
          deliveryAddress: _addressTEController.text.trim());

      final bool isSuccess = await signUpController.signUp(signUpModel);

      if (isSuccess) {
        showSnackBarMessage(context, 'SignUp Successfully!!');
        Navigator.pushNamed(context, VerifyOtpScreen.name);
      } else {
        showSnackBarMessage(context, signUpController.errorMessage!, true);
      }
    }
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }


}

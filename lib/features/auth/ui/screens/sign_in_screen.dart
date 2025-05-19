import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/core/extensions/localization_extension.dart';
import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/core/widgets/show_snack_bar_message.dart';
import 'package:craftybay/features/auth/data/models/sign_In_model.dart';
import 'package:craftybay/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:craftybay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:craftybay/features/auth/ui/widgets/app_logo.dart';
import 'package:craftybay/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_bar_Screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = 'signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

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
                  controller: _emailTextController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTextController,
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
                const SizedBox(height: 16),
                GetBuilder<SignInController>(builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: CenteredCircularProgressbar(),
                    child: ElevatedButton(
                      onPressed: () {
                        _onTapSigninButton();
                      },
                      child: Text(context.localization.signin),
                    ),
                  );
                }),
                const SizedBox(height: 24),

                //=Rich text=============================================
                RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                        children: [
                      TextSpan(
                          text: ' Sign up',
                          style: const TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _onTapSignUpButton();
                            }),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSigninButton() async {
    if (_formKey.currentState!.validate()) {
      final signInRequestModel = SignInRequestModel(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text,
      );

      final isSuccess = await _signInController.signIn(signInRequestModel);


      if (isSuccess) {
        showSnackBarMessage(context, "Sign In Successfully");

        Navigator.pushNamedAndRemoveUntil(context, MainBottomNavBarScreen.name, (value) => false,
        );
      } else {
        showSnackBarMessage(
            context, _signInController.errorMessage ?? "Sign in failed", true);
      }
    }
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}

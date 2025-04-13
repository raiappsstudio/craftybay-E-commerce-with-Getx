import 'dart:async';

import 'package:craftybay/core/extensions/localization_extension.dart';
import 'package:craftybay/core/widgets/show_snack_bar_message.dart';
import 'package:craftybay/features/auth/data/models/verify_otp_model.dart';
import 'package:craftybay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:craftybay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:craftybay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  static const String name = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final VerifyOtpController _verifyOtpController =
      Get.find<VerifyOtpController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _currentTime = 0;

  void _startTimer() {
    _currentTime = 30;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime == 0) {
        timer.cancel();
      } else {
        _currentTime--;
      }

      setState(() {});
    });
  }



  @override
  void initState() {
    super.initState();
    _startTimer();
  }


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                AppLogo(),
                const SizedBox(height: 24),
                Text(context.localization.enterotp, style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text("A 4 Digit OTP Code has been sent"),
                const SizedBox(height: 16),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _otpTEController,
                  appContext: context,
                  validator: (String? value) {
                    if ((value?.length ?? 0) < 4) {
                      return "Eenter Your OTP";
                    }
                    return null;
                  },
                ),
                ElevatedButton(onPressed: () {
                  _onTapVerifyOtpButton();
                }, child: Text('Next')),
          
                const SizedBox(height: 24),
                Column(
                  children: [
                    Visibility(
                      visible: _currentTime == 0,
                      child: TextButton(
                          onPressed: () {
                            //resend otp controller
                            _startTimer();
                          },
                          child: Text('Rsend OTP')),
                    ),
          
                    Visibility(
                      visible: _currentTime != 0,
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Rsend OTP in ${_currentTime}')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyOtpButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    VerifyOtpModel verifyOtpModel =
        VerifyOtpModel(email: widget.email, otp: _otpTEController.text);

    final bool isSuccess = await _verifyOtpController.verifyOtp(verifyOtpModel);

    if (isSuccess) {
      showSnackBarMessage(context, "Otp has been verified! Please Login");
      Navigator.pushNamedAndRemoveUntil(
          context, SignInScreen.name, (predicate) => false);
    } else {
      showSnackBarMessage(context, _verifyOtpController.errorMessage!, true);
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_text_input.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _focusNode = FocusNode();
  String _mob = "";
  String get mobile => _mob;
  set mobile(String text) => setState(() {
        _mob = text;
      });
  bool get isValidMobile => _mob.length == 10 && int.tryParse(_mob) != null;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  /// ARTS: Auto Resolution Time in Seconds
  static const maxARTS = 60;
  int _remainingARTS = maxARTS;
  int get remainingARTS => _remainingARTS;
  set remainingARTS(int val) => setState(() {
        _remainingARTS = val;
      });
  bool get isOtpSent => remainingARTS < maxARTS;

  void sendOtp() async {
    /// Starting the timer for disabling the OTP input till the end of ARTS
    if (Platform.isAndroid) {
      --remainingARTS;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remainingARTS == 0 || remainingARTS == maxARTS) {
          timer.cancel();
        } else {
          --remainingARTS;
        }
      });
    } else {
      remainingARTS = 0;
    }

    /// Try sending OTP
    final auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: mobile,

      ///ANDROID ONLY! Time for autoretrieval of OTP from SMS.
      timeout: const Duration(seconds: maxARTS),

      /// ANDROID ONLY! which support automatic SMS code resolution, this handler will be called
      /// if the device has not automatically resolved an SMS message within a certain timeframe.
      /// Once the timeframe has passed, the device will no longer attempt to resolve any incoming messages.
      codeAutoRetrievalTimeout: (String verificationId) {},

      ///When Firebase sends an SMS code to the device, this handler is triggered with a verificationId and resendToken
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },

      /// ANDROID ONLY! will automatically verify the SMS code without requiring the user to manually input the code.
      /// If this event occurs, a PhoneAuthCredential is automatically provided which can be used to sign-in with or link the user's phone number.
      /// Sign the user in (or link) with the auto-generated credential
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },

      /// If Firebase returns an error, for example for an incorrect phone number or if the SMS quota for the project has exceeded,
      /// a FirebaseAuthException will be sent to this handler.
      verificationFailed: (FirebaseAuthException e) {
        remainingARTS = maxARTS; //Stop timer
        if (e.code == 'invalid-phone-number') {
          // print('The provided phone number is not valid.');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _focusNode.requestFocus();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            center: FractionalOffset.center,
            colors: <Color>[
              Color(0x114285F4), // blue
              Color(0x1134A853), // green
              Color(0x11FBBC05), // yellow
              Color(0x11EA4335), // red
              Color(
                  0x114285F4), // blue again to seamlessly transition to the start
            ],
            stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hungry? Let’s Get Started!",
                  textAlign: TextAlign.center,
                  style: Helper.getTheme(context).titleSmall,
                ),
                const SizedBox(height: 60),
                Text(
                  "Login",
                  style: Helper.getTheme(context).titleLarge,
                ),
                const SizedBox(height: 40),
                const Text('আপনার নিজের MOBILE NUMBER টি দিন'),
                const SizedBox(height: 20),
                CustomTextInput(
                  hintText: remainingARTS == maxARTS
                      ? "10 digit mobile number"
                      : "6 digit OTP",
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  focusNode: _focusNode,
                  onChanged: (text) {
                    mobile = text;
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: !isValidMobile
                        ? null
                        : () {
                            debugPrint(mobile);
                            // Navigator.of(context)
                            //     .pushReplacementNamed(SendOTPScreen.routeName);
                          },
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                        color: isValidMobile ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

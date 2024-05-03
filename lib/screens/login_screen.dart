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
  final _focusNodeMobile = FocusNode();
  final _focusNodeOtp = FocusNode();
  String _mob = "";
  String get mobile => _mob;
  set mobile(String text) => setState(() {
        _mob = text;
      });
  bool get isValidMobile => _mob.length == 10 && int.tryParse(_mob) != null;

  @override
  void dispose() {
    _focusNodeMobile.dispose();
    _focusNodeOtp.dispose();
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

      /// ANDROID ONLY! which support automatic SMS code resolution.
      codeAutoRetrievalTimeout: (String verificationId) {},

      ///Manual verification of SMS code; and allow resend again.
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },

      /// ANDROID ONLY! will automatically verify the SMS code
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },

      /// Incorrect phone number or if the SMS quota for the project has exceeded etc
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
    _focusNodeMobile.requestFocus();
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
                Text(!isOtpSent
                    ? 'আপনার নিজের MOBILE NUMBER টি দিন'
                    : 'আপনার MOBILE এ যে OTP টি এসেছে সেটি দিন'),
                const SizedBox(height: 20),
                CustomTextInput(
                  enabled: !isOtpSent,
                  hintText: "10 digit mobile number",
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  focusNode: _focusNodeMobile,
                  onChanged: (text) {
                    mobile = text;
                  },
                ),
                const SizedBox(height: 20),
                isOtpSent
                    ? CustomTextInput(
                        enabled: isOtpSent,
                        hintText: "6 digit number",
                        maxLength: 6,
                        keyboardType: TextInputType.phone,
                        focusNode: _focusNodeOtp,
                        onChanged: (text) {
                          mobile = text;
                        },
                      )
                    : const SizedBox(),
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
                      !isOtpSent ? "Send OTP" : "Verify",
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

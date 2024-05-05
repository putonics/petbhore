import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_text_input.dart';

enum LoginStates {
  invalidMobile,
  validMobile,
  sendingOtp,
  sendingOtpError,
  otpSent,
  verifyingOtp,
  verifyingOtpError,
  otpVerified,
}

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
  String _otp = "";
  String get otp => _otp;
  set otp(String text) => setState(() {
        _otp = text;
      });
  bool get isValidOtp => _otp.length == 6 && int.tryParse(_otp) != null;

  @override
  void dispose() {
    _focusNodeMobile.dispose();
    _focusNodeOtp.dispose();
    super.dispose();
  }

  final auth = FirebaseAuth.instance;

  /// ARTS: Auto Retrieval Time in Seconds
  static const maxARTS = 60;
  int _remainingARTS = maxARTS;
  int get remainingARTS => _remainingARTS;
  set remainingARTS(int val) => setState(() {
        _remainingARTS = val;
      });

  String _otpVerificationId = '';
  int? _otpResendToken;
  bool get isOtpSent => _otpVerificationId.isNotEmpty;
  void setCode(String verificationId, int? resendToken) => setState(() {
        _otpVerificationId = verificationId;
        _otpResendToken = resendToken;
      });
  void manualVerifyOtp() async {
    await auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: _otpVerificationId,
      smsCode: otp,
    ));
  }

  bool _isSendClicked = false;
  set isSendClicked(bool val) => setState(() {
        _isSendClicked = val;
      });

  void sendOtp() async {
    if (_isSendClicked || !isValidMobile) return;
    isSendClicked = true;

    /// Starting the timer for disabling the OTP input till the end of ARTS
    debugPrint("sendOtp()");

    /// Try sending OTP
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$mobile",

      ///ANDROID ONLY! Time for autoretrieval of OTP from SMS.
      timeout: const Duration(seconds: maxARTS),

      /// ANDROID ONLY! which support automatic SMS code resolution.
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint('codeAutoRetrievalTimeout()');
      },

      ///This event is ocurred after OTP sent by the server
      codeSent: (String verificationId, int? resendToken) async {
        //Checking if Android device, then start ARTS timer
        if (resendToken != null) {
          --remainingARTS;
          // Timer.periodic(const Duration(seconds: 1), (timer) {
          //   if (remainingARTS == 0 || remainingARTS == maxARTS) {
          //     timer.cancel();
          //   } else {
          //     --remainingARTS;
          //   }
          // });
        } else {
          remainingARTS = 0;
        }
        setCode(verificationId, resendToken);
      },

      /// ANDROID ONLY! will automatically verify the SMS code
      verificationCompleted: (PhoneAuthCredential credential) async {
        debugPrint('verificationCompleted()');
        await auth.signInWithCredential(credential);
      },

      /// Incorrect phone number or if the SMS quota for the project has exceeded etc
      verificationFailed: (FirebaseAuthException e) {
        isSendClicked = false;
        remainingARTS = maxARTS; //Stop timer
        switch (e.code) {
          case "invalid-phone-number":
            debugPrint("Please enter a valid phone number.");
            break;
          case "quota-exceeded":
            debugPrint("Too many verification attempts. Please try later.");
            break;
          case "network-error":
            debugPrint(
                "Network error. Please check your connection and try again.");
          case "invalid-verification-code":
            debugPrint("The entered verification code is incorrect.");
            break;
          case "phone-already-in-use":
            debugPrint(
                "The phone number is already linked to another Firebase user.");
            break;
          default:
            debugPrint("Verification failed. Please try again.");
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
                          otp = text;
                        },
                      )
                    : const SizedBox(),
                isOtpSent ? const SizedBox(height: 20) : const SizedBox(),
                isOtpSent
                    ? Text(
                        "Reading SMS in $remainingARTS sec",
                        style: Helper.getTheme(context).titleSmall,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (!isOtpSent
                        ? !isValidMobile
                            ? null
                            : sendOtp
                        : !isValidOtp
                            ? null
                            : manualVerifyOtp),
                    child: Text(
                      !isOtpSent ? "Send OTP" : "Verify",
                      style: TextStyle(
                        color: (!isOtpSent && isValidMobile) ||
                                (isOtpSent && isValidOtp)
                            ? Colors.white
                            : Colors.grey,
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

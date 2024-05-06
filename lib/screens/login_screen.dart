import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_text_input.dart';

enum LoginState {
  invalidMobileInput,
  validMobileInput,
  sendingOtp,
  sendingOtpError,
  otpSent,
  validOtpInput,
  verifyingOtp,
  verifyingOtpError,
  otpVerified,
  duplicateUser,
  unknownError,
}

const List<String> loginStates = [
  "Give valid mobile number!",
  "Send OTP to this number",
  "Sending OTP!",
  "Failed! Try with different number!",
  "OTP received!",
  "Verify now!",
  "Verifying!",
  "Invalid OTP!",
  "Verification done!",
  "Duplicate user login!",
  "Verification Failed! Try again!"
];

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginState _loginState = LoginState.invalidMobileInput;
  LoginState get loginState => _loginState;
  set loginState(LoginState state) => setState(() {
        _loginState = state;
      });

  final _focusNodeMobile = FocusNode();
  final _focusNodeOtp = FocusNode();
  String _mob = "";
  String get mobile => _mob;
  set mobile(String text) => setState(() {
        _mob = text;
        _loginState = text.length == 10 && int.tryParse(text) != null
            ? LoginState.validMobileInput
            : LoginState.invalidMobileInput;
      });

  String _otp = "";
  String get otp => _otp;
  set otp(String text) => setState(() {
        _otp = text;
        _loginState = text.length == 6 && int.tryParse(text) != null
            ? LoginState.validOtpInput
            : LoginState.otpSent;
      });

  @override
  void dispose() {
    _focusNodeMobile.dispose();
    _focusNodeOtp.dispose();
    super.dispose();
  }

  final auth = FirebaseAuth.instance;

  /// ARTS: Auto Retrieval Time in Seconds
  static const _maxARTS = 60;
  bool _artsTimeout = false;

  String _otpVerificationId = '';
  bool get isOtpSent => _otpVerificationId.isNotEmpty;

  void signIn(PhoneAuthCredential credential) async {
    loginState = LoginState.verifyingOtp;
    try {
      await auth.signInWithCredential(credential);
      loginState = LoginState.otpVerified;
    } catch (e) {
      loginState = LoginState.verifyingOtpError;
    }
  }

  void manualVerifyOtp() {
    if (loginState != LoginState.validOtpInput) return;
    signIn(PhoneAuthProvider.credential(
      verificationId: _otpVerificationId,
      smsCode: otp,
    ));
  }

  void sendOtp() async {
    if (loginState != LoginState.validMobileInput) return;
    loginState = LoginState.sendingOtp;

    await auth.verifyPhoneNumber(
      phoneNumber: "+91$mobile",

      ///ANDROID ONLY! Time for autoretrieval of OTP from SMS.
      timeout: const Duration(seconds: _maxARTS),

      /// ANDROID ONLY! which support automatic SMS code resolution.
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _artsTimeout = true;
        });
      },

      ///This event is ocurred after OTP sent by the server
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _otpVerificationId = verificationId;
          _loginState = LoginState.otpSent;
        });
      },

      /// ANDROID ONLY! will automatically verify the SMS code
      verificationCompleted: signIn,

      /// Incorrect phone number or if the SMS quota for the project has exceeded etc
      verificationFailed: (FirebaseAuthException e) {
        switch (e.code) {
          case 'operation-not-allowed':
          case 'user-disabled':
            debugPrint("Some problem occured!");
          case "quota-exceeded":
            debugPrint("Too many verification attempts. Please try later.");
          case "network-error":
            debugPrint(
                "Network error. Please check your connection and try again.");
          case "invalid-phone-number":
            debugPrint("Please enter a valid phone number.");
            loginState = LoginState.sendingOtpError;
            break;
          case "invalid-verification-id":
          case "invalid-verification-code":
            debugPrint("The entered verification code is incorrect.");
            loginState = LoginState.verifyingOtpError;
            break;
          case 'account-exists-with-different-credential':
          case "phone-already-in-use":
            debugPrint(
                "The phone number is already linked to another Firebase user.");
            loginState = LoginState.duplicateUser;
            break;
          default:
            debugPrint("Verification failed. Please try again.");
            loginState = LoginState.unknownError;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isOtpSent && loginState.index < LoginState.verifyingOtp.index) {
      _focusNodeOtp.requestFocus();
    } else {
      _focusNodeOtp.unfocus();
    }
    if (loginState.index < LoginState.sendingOtp.index) {
      _focusNodeMobile.requestFocus();
    } else {
      _focusNodeMobile.unfocus();
    }
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
                  onSubmitted: (text) {
                    sendOtp();
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
                        onSubmitted: (text) {
                          manualVerifyOtp();
                        },
                      )
                    : const SizedBox(),
                isOtpSent ? const SizedBox(height: 20) : const SizedBox(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginState == LoginState.validMobileInput
                        ? sendOtp
                        : loginState == LoginState.validOtpInput
                            ? manualVerifyOtp
                            : null,
                    child: Text(
                      loginStates[loginState.index],
                      style: TextStyle(
                        color: loginState == LoginState.validMobileInput ||
                                loginState == LoginState.validOtpInput
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                (loginState.index >= LoginState.duplicateUser.index ||
                            _artsTimeout) &&
                        (loginState != LoginState.verifyingOtp ||
                            loginState != LoginState.otpVerified)
                    ? SizedBox(
                        height: 20,
                        child: GestureDetector(
                          child: Text(
                            "Try with another mobile number!",
                            style: TextStyle(color: Colors.blue.shade400),
                          ),
                          onTap: () {
                            setState(() {
                              _loginState = LoginState.invalidMobileInput;
                              _otpVerificationId = '';
                            });
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

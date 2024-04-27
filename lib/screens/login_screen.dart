import 'package:flutter/material.dart';
import 'package:petbhore/const/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_text_input.dart';
import 'forget_pw_screen.dart';
import 'sign_up_screen.dart';
import 'intro_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Helper.getTheme(context).titleLarge,
                ),
                const Spacer(),
                const Text('Add your details to login'),
                const Spacer(),
                const CustomTextInput(
                  hintText: "Your email",
                ),
                const Spacer(),
                const CustomTextInput(
                  hintText: "password",
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(IntroScreen.routeName);
                    },
                    child: const Text("Login"),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: const Text("Forget your password?"),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Text("or Login With"),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(
                          0xFF367FC0,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "fb.png",
                            "virtual",
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text("Login with Facebook")
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(
                          0xFFDD4B39,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "google.png",
                            "virtual",
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text("Login with Google")
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

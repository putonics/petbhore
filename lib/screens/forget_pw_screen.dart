import 'package:flutter/material.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_text_input.dart';
import 'sent_otp_screen.dart';

class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/restpwScreen";

  const ForgetPwScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Helper.getTheme(context).titleLarge,
                ),
                const Spacer(),
                const Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                const CustomTextInput(hintText: "Email"),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SendOTPScreen.routeName);
                    },
                    child: const Text("Send"),
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

import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/utils/helper.dart';
import 'package:petbhore/widgets/custom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile",
                            style: Helper.getTheme(context).headlineSmall,
                          ),
                          const Icon(Icons.shopping_cart),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipOval(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                Helper.getAssetName(
                                  "user.jpg",
                                  "real",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: const Icon(Icons.camera),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Edit Profile",
                            style: TextStyle(color: AppColor.themeColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hi there Emilia!",
                        style:
                            Helper.getTheme(context).headlineMedium?.copyWith(
                                  color: AppColor.primary,
                                ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Sign Out"),
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomFormImput(
                        label: "Name",
                        value: "Emilia Clarke",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomFormImput(
                        label: "Email",
                        value: "emiliaclarke@email.com",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomFormImput(
                        label: "Mobile No",
                        value: "emiliaclarke@email.com",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomFormImput(
                        label: "Address",
                        value: "No 23, 6th Lane, Colombo 03",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomFormImput(
                        label: "Password",
                        value: "Emilia Clarke",
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomFormImput(
                        label: "Confirm Password",
                        value: "Emilia Clarke",
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Save"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  final String label;
  final String value;
  final bool isPassword;
  const CustomFormImput({
    Key? key,
    required this.label,
    required this.value,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: isPassword,
        initialValue: value,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

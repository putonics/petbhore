import 'package:flutter/material.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/intro_model.dart';
import 'package:petbhore/utils/helper.dart';
import 'home/home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController? _controller;
  int count = 0;

  @override
  void initState() {
    _controller = PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          IntroModel.isNetworkImage
                              ? Image.network(IntroModel.data[index].image)
                              : Image.asset(IntroModel.data[index].image),
                          const Spacer(),
                          Text(
                            IntroModel.data[index].title,
                            style: Helper.getTheme(context).titleLarge,
                          ),
                          const Spacer(),
                          Text(
                            IntroModel.data[index].desc,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                        ],
                      );
                    },
                    itemCount: IntroModel.data.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: count == 0
                          ? AppColor.themeColor
                          : AppColor.placeholder,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: count == 1
                          ? AppColor.themeColor
                          : AppColor.placeholder,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: count == 2
                          ? AppColor.themeColor
                          : AppColor.placeholder,
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                      },
                      child: const Text("Next")),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

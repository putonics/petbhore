import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/about_screen.dart';
import 'package:petbhore/screens/change_address_screen.dart';
import 'package:petbhore/screens/checkout_screen.dart';
import 'package:petbhore/screens/dessert_screen.dart';
import 'package:petbhore/screens/home/home_screen.dart';
import 'package:petbhore/screens/inbox_screen.dart';
import 'package:petbhore/screens/individual_item.dart';
import 'package:petbhore/screens/landing_screen.dart';
import 'package:petbhore/screens/login_screen.dart';
import 'package:petbhore/screens/menu_screen.dart';
import 'package:petbhore/screens/more_screen.dart';
import 'package:petbhore/screens/my_order_screen.dart';
import 'package:petbhore/screens/notification_screen.dart';
import 'package:petbhore/screens/offer_screen.dart';
import 'package:petbhore/screens/payment_screen.dart';
import 'package:petbhore/screens/profile_screen.dart';
import 'package:petbhore/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toastification/toastification.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(
    child: ToastificationWrapper(
      child: MainApp(),
    ),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void startListeningUserAuth() {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (navigatorKey.currentContext != null) {
        Timer(const Duration(seconds: 2), () {
          Navigator.of(navigatorKey.currentContext!).pushReplacementNamed(
            user == null ? LandingScreen.routeName : HomeScreen.routeName,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startListeningUserAuth();
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Petbhore',
      theme: ThemeData(
        fontFamily: "Metropolis",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.themeColor,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColor.themeColor,
            ),
          ),
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: AppColor.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headlineSmall: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          titleLarge: TextStyle(
            color: AppColor.primary,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        MenuScreen.routeName: (context) => const MenuScreen(),
        OfferScreen.routeName: (context) => const OfferScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        MoreScreen.routeName: (context) => const MoreScreen(),
        DessertScreen.routeName: (context) => const DessertScreen(),
        IndividualItem.routeName: (context) => const IndividualItem(),
        PaymentScreen.routeName: (context) => const PaymentScreen(),
        NotificationScreen.routeName: (context) => const NotificationScreen(),
        AboutScreen.routeName: (context) => const AboutScreen(),
        InboxScreen.routeName: (context) => const InboxScreen(),
        MyOrderScreen.routeName: (context) => const MyOrderScreen(),
        CheckoutScreen.routeName: (context) => const CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => const ChangeAddressScreen(),
      },
    );
  }
}

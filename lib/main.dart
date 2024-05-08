import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petbhore/data/colors.dart';
import 'package:petbhore/screens/profile/change_address_screen.dart';
import 'package:petbhore/screens/orders/checkout_screen.dart';
import 'package:petbhore/screens/home/home_screen.dart';
import 'package:petbhore/screens/initial/landing_screen.dart';
import 'package:petbhore/screens/initial/login_screen.dart';
import 'package:petbhore/screens/orders/my_order_screen.dart';
import 'package:petbhore/screens/profile/notification_screen.dart';
import 'package:petbhore/screens/offers/offer_screen.dart';
import 'package:petbhore/screens/orders/payment_screen.dart';
import 'package:petbhore/screens/profile/profile_screen.dart';
import 'package:petbhore/screens/initial/splash_screen.dart';
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
              DataColors.themeColor,
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
              DataColors.themeColor,
            ),
          ),
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: DataColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: DataColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headlineSmall: TextStyle(
            color: DataColors.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          titleLarge: TextStyle(
            color: DataColors.primary,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(
            color: DataColors.secondary,
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        OfferScreen.routeName: (context) => const OfferScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        PaymentScreen.routeName: (context) => const PaymentScreen(),
        NotificationScreen.routeName: (context) => const NotificationScreen(),
        MyOrderScreen.routeName: (context) => const MyOrderScreen(),
        CheckoutScreen.routeName: (context) => const CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => const ChangeAddressScreen(),
      },
    );
  }
}

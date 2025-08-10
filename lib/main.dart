import 'package:equisplit/screens/fresh/forgotPassword.dart';
import 'package:equisplit/screens/fresh/landing.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:equisplit/screens/home/home.dart';
import 'package:equisplit/screens/qr/scanner.dart';
import 'package:equisplit/screens/fresh/signing.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/firebase_options.dart';

// void main() => runApp(const MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/login': (context) => Signing(isLogin: true),
        '/signup': (context) => Signing(isLogin: false),
        '/forgotPassword': (context) => ForgotPassword(),
        '/home': (context) => const Home(),
        '/qr/scan': (context) => const QRScanner(),
        // '/qr': (context) => const DisplayQRScanner(),
        // '/profile': (context) => const Profile(),
        // '/group/create': (context) => const CreateGroup(),
      },
      debugShowCheckedModeBanner: false,
      // home: Wrapper(),
    );
  }
}

/// Wrapper :
/// This wrapper helps to determine if someone is logged in or not
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    late bool isLoggedIn;

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
          // This checked if the user was previously logged in and chose to log out
          if(context.mounted && user==null && isLoggedIn) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("You are logged out!!"))
            );
          }
          isLoggedIn = user!=null;  // sets the state of whether the user is logged in or not
    });

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: isLoggedIn
          ? Home()  // Shown the home page if the user is logged in
          : Landing(),  // Shown the landing page with option to signup and signin
    );
  }
}

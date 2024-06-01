import 'package:equisplit/constants/helperFunctions.dart';
import 'package:equisplit/screens/home/home.dart';
import 'package:equisplit/screens/qr/scanner.dart';
import 'package:flutter/material.dart';

import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/colorConstants.dart';

void main() {
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
        '/': (context) => const Wrapper(),
        '/home': (context) => const Home(),
        '/qr': (context) => const QRScanner(),
        '/qr/scan': (context) => const QRScanner()
      },
      debugShowCheckedModeBanner: false,
      // home: Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appBarBG,
      appBar: AppBar(
        backgroundColor: ColorConstants.appBarBG,
        centerTitle: false,
        flexibleSpace: const SizedBox(
          height: 200.0,
        ),
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
              Constants.APP_NAME,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: ColorConstants.appBarTXT,
              fontSize: 28.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(40.0, 20.0, 15.0, 0.0),
        alignment: Alignment.topRight,
        child: const Text(
          Constants.APP_DESC,
          softWrap: true,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: ColorConstants.pageTXT,
            fontStyle: FontStyle.italic,
            fontSize: 16.0,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          HelperFunctions.createFAB(text: "Sign Up"),
          HelperFunctions.createFAB(
              text: "Already a member!",
            action: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          HelperFunctions.createFAB(text: "Don't remember the credentials"),
        ],
      ),
    );
  }
}


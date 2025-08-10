import 'package:flutter/material.dart';

import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/helperFunctions.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appBarBG,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20.0,
        backgroundColor: ColorConstants.appBarBG,
        centerTitle: false,
        flexibleSpace: const SizedBox(height: 200.0),
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              Constants.APP_NAME,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: ColorConstants.appBarTXT,
                fontSize: 32.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(40.0, 40.0, 15.0, 0.0),
        alignment: Alignment.topRight,
        child: const Text(
          Constants.APP_DESC,
          softWrap: true,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: ColorConstants.pageTXT,
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            HelperFunctions.createFAB(
              text: "Sign Up",
              action: () => Navigator.pushNamed(context, "/signup")
            ),
            HelperFunctions.createFAB(
              text: "Already a member!",
              action: () => Navigator.pushNamed(context, '/login'),
            ),
            HelperFunctions.createFAB(text: "Don't remember the credentials"),
          ],
        ),
      ),
    );
  }
}

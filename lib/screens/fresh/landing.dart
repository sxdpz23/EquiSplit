import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/helperFunctions.dart';
import 'package:equisplit/models/fabButton.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    List<FabButton> fabBtns = Constants.landingFabButtons;

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
          children: List.generate(
            fabBtns.length,
                (int index) {
              return HelperFunctions.createFAB(
                text: fabBtns[index].title,
                action: () =>
                    Navigator.pushNamed(context, fabBtns[index].namedAction),
              );
            },
          ),
        ),
      ),
    );
  }
}

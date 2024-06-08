import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'homeView.dart';
import 'package:equisplit/constants/helperFunctions.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/colorConstants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool youOwe = false;
  double amount = 0;
  List<String>? groups;

  @override
  void initState() {
    super.initState();
    amount = 1027532.23;
    if (amount > 0) youOwe = true;
    groups = ["wow", "meow"];
  }

  Widget _fab() {
    final Color _fabBG = ColorConstants.pageTXT;
    final Color _fabTXT = ColorConstants.pageFGTXT;
    final Color _fabHighlight = ColorConstants.pageFG;

    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 50.0,
            width: 180.0,
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: _fabBG,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => print("Icon Pressed :: Create Group"),
                  icon: const Icon(CupertinoIcons.group_solid),
                  color: _fabTXT,
                ),
                IconButton(
                  onPressed: () => print("Icon Pressed :: Search"),
                  icon: const Icon(CupertinoIcons.search),
                  color: _fabTXT,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue,
              // border: Border.all(
              //   color: _fabBG,
              //   width: 1.0,
              // ),
            ),
            child: Container(
              height: 60.0,
              width: 60.0,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed('/qr/scan'),
                icon: const Icon(CupertinoIcons.qrcode_viewfinder),
                color: _fabTXT,
                iconSize: 28.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _totalSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.pageBG,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20.0,
        backgroundColor: ColorConstants.appBarBG,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "Hi, ${Constants.userName} 👋",
            style: const TextStyle(
              fontSize: 26.0,
              color: ColorConstants.appBarTXT,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: IconButton(
              onPressed: () => print("Icon Tapped :: logs"),
              icon: const Icon(CupertinoIcons.bell),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      floatingActionButton: Container(
        height: _totalSize.height * 0.1,
        width: _totalSize.width,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 30.0),
          child: _fab(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: ColorConstants.pageTXT,
                  ),
                  text: Constants.msgOwe,
                  children: amount <= 0
                      ? null
                      : List.generate(
                          1,
                          (i) => TextSpan(
                              text: amount.toString(),
                              style: TextStyle(
                                color: youOwe
                                    ? ColorConstants.youOwe
                                    : ColorConstants.youAreOwed,
                                fontWeight: FontWeight.bold,
                              ))),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: HomeView(groups: groups),
            )
          ],
        ),
      ),
    );
  }
}

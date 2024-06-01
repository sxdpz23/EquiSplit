import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  double amount=0;
  List<String>? groups;


  @override
  void initState() {
    super.initState();
    amount = 1027532.23;
    if(amount>0)
      youOwe = true;
    groups = ["wow", "meow"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.pageBG,
      appBar: AppBar(
        backgroundColor: ColorConstants.appBarBG,
        title: Text("Hello ${Constants.userName} ,",
          style: const TextStyle(
            color: ColorConstants.appBarTXT,
            fontStyle: FontStyle.italic
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () => print("Profile Picture Tapped :: HomePage"),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(Constants.userImage),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        HelperFunctions.createFAB(
          text: "Search",
          icon: CupertinoIcons.search
        ),
        HelperFunctions.createFAB(
          text: "Scan a Friend!",
          icon: CupertinoIcons.qrcode_viewfinder,
          action: () => Navigator.pushNamed(context, '/qr/scan'),
        ),
        HelperFunctions.createFAB(
          text: "Create New Group!",
          icon: CupertinoIcons.person_3_fill
        ),
      ],
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
                  children: amount<=0 ? null : List.generate(1, (i) => TextSpan(
                    text: amount.toString(),
                    style: TextStyle(
                      color: youOwe ? ColorConstants.youOwe : ColorConstants.youAreOwed,
                      fontWeight: FontWeight.bold,
                    )
                  )),
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

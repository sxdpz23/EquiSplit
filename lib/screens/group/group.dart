import 'package:equisplit/constants/colorConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fab.dart';

class Group extends StatelessWidget {
  const Group({super.key, required this.heroTag});

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final Size totalSize = MediaQuery.of(context).size;

    return Hero(
      tag: heroTag,
      child: Scaffold(
        backgroundColor: ColorConstants.pageBG,
        floatingActionButton: Container(
          height: totalSize.height * 0.1,
          width: totalSize.width,
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 20.0, left: 30.0),
            child: GroupFaButtons(
              fabBG: ColorConstants.pageTXT,
              fabTXT: ColorConstants.pageFGTXT,
              fabHighlight: Colors.blue,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).padding.top + 20.0,
                left: 0.0,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: ColorConstants.pageTXT,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.back,
                        color: ColorConstants.pageBG,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

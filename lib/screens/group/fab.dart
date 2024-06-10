import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:equisplit/constants/helperFunctions.dart';

class GroupFaButtons extends StatelessWidget {
  const GroupFaButtons(
      {super.key,
      required this.fabBG,
      required this.fabTXT,
      required this.fabHighlight});

  final Color fabBG, fabTXT, fabHighlight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// Outermost Widget - Left Bottom FAB and Right Bottom FAB
        Center(
          child: Container(
            height: 50.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// Left Outermost Bottom FAB
                GestureDetector(
                  onTap: () => print("FAB Pressed :: Settle | GroupPage"),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: fabBG,
                    child: Center(
                      child: Icon(
                        FontAwesome.rupee,
                        color: fabTXT,
                      ),
                    ),
                  ),
                ),

                /// Right Outermost Bottom FAB
                GestureDetector(
                  onTap: () => print("FAB Pressed :: Export | GroupPage"),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: fabBG,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.doc,
                        color: fabTXT,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Centre Side Widgets - Left Center Bottom FAB and Right Center Bottom FAB
        Center(
          child: Container(
            height: 50.0,
            width: 180.0,
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: fabBG,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// Left Innermost Center Bottom FAB
                IconButton(
                  onPressed: () => print("Icon Pressed :: Add"),
                  icon: const Icon(CupertinoIcons.add),
                  color: fabTXT,
                ),

                /// Right Innermost Center Bottom FAB
                IconButton(
                  onPressed: () => print("Icon Pressed :: Search"),
                  icon: const Icon(CupertinoIcons.info),
                  color: fabTXT,
                ),
              ],
            ),
          ),
        ),

        /// Center FAB
        Center(
          child: Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: fabHighlight,
              // border: Border.all(
              //   color: fabBG,
              //   width: 3.0,
              // ),
            ),
            child: Container(
              height: 60.0,
              width: 60.0,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () => print("FAB Pressed :: Charts | GroupPage"),
                icon: const Icon(CupertinoIcons.chart_pie_fill),
                color: fabTXT,
                iconSize: 28.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

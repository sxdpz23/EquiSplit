import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/models/groupCategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'fab.dart';

class Group extends StatelessWidget {
  const Group(this.category, {super.key, required this.heroTag, this.backImg});

  final String heroTag;
  final String? backImg;
  final GroupCategories category;

  @override
  Widget build(BuildContext context) {
    final Size totalSize = MediaQuery.of(context).size;
    final double topPadding = MediaQuery.of(context).padding.top;
    final GroupCategoriesData categoryData =
        GroupCategoriesData(category: category);

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
        body: Stack(
          children: <Widget>[
            /// Actual  View
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: topPadding,
                      width: totalSize.width,
                      color: categoryData.color(),
                    ),
                    Container(
                      height: totalSize.height * 0.3,
                      width: totalSize.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20)),
                        color: categoryData.color(),
                        image: backImg == null
                            ? null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  backImg!,
                                ),
                              ),
                      ),
                      child: backImg != null
                          ? const SizedBox()
                          : Center(
                              child: Icon(
                                categoryData.icon(),
                                color: ColorConstants.pageBG,
                                size: totalSize.width * 0.2,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),

            /// Back Button
            Positioned(
              top: MediaQuery.of(context).padding.top + 20.0,
              left: 20.0,
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
    );
  }
}

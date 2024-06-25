import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/models/groupCategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'fab.dart';

class Group extends StatelessWidget {
  const Group(this.category,
      {super.key, required this.heroTag, this.backImg, required this.name});

  final String heroTag, name;
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 30.0),
            child: GroupFaButtons(
              fabBG: ColorConstants.pageTXT,
              fabTXT: ColorConstants.pageFGTXT,
              fabHighlight: categoryData.color(),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            /// Actual  View
            Positioned.fill(
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    backgroundColor: categoryData.color(),
                    expandedHeight: totalSize.height * 0.35,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        // height: totalSize.height * 0.3,
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
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(10),
                      child: Container(
                        color: ColorConstants.pageBG,
                        width: totalSize.width,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: ColorConstants.pageTXT,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: totalSize.height,
                      width: totalSize.width,
                    ),
                  ),
                ],
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
            Positioned(
              top: MediaQuery.of(context).padding.top + 20.0,
              right: 10.0,
              child: GestureDetector(
                onTap: () => print("Button Tapped :: Settings | Group Page"),
                child: const CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.settings,
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

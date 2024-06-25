import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/dummy.dart';
import 'package:equisplit/models/groupCategories.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile(
    this.groupCategory, {
    super.key,
    required this.tileHeight,
    this.backImg,
  });

  final double tileHeight;
  final String? backImg;
  final GroupCategories groupCategory;

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final GroupCategoriesData categoryData =
        GroupCategoriesData(category: groupCategory);
    final Color mainTileColor = categoryData.color();

    return Material(
      color: Colors.transparent,
      child: Container(
        height: tileHeight,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      // color: mainTileColor.withAlpha(0xaa),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                        mainTileColor.withAlpha(0x88),
                        mainTileColor,
                      ])),
                ),
              ),
              Positioned(
                bottom: -totalWidth * 0.14,
                right: -totalWidth * 0.09,
                child: CircleAvatar(
                  radius: totalWidth * 0.25,
                  backgroundColor: mainTileColor.withAlpha(0x44),
                ),
              ),
              Positioned(
                bottom: -totalWidth * 0.1,
                right: -totalWidth * 0.06,
                child: CircleAvatar(
                  radius: totalWidth * 0.2,
                  backgroundColor: mainTileColor.withAlpha(0x88),
                ),
              ),
              Positioned(
                bottom: -totalWidth * 0.06,
                right: -totalWidth * 0.03,
                child: CircleAvatar(
                  radius: totalWidth * 0.15,
                  backgroundColor: mainTileColor,
                  backgroundImage:
                      backImg != null ? NetworkImage(backImg!) : null,
                  child: backImg != null
                      ? null
                      : Center(
                          child: Icon(
                            categoryData.icon(),
                            size: totalWidth * 0.07,
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          DummyData.groupName,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            color: ColorConstants.pageBG,
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.people,
                              color: ColorConstants.pageBG,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              DummyData.groupMembersCount.toString(),
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: ColorConstants.pageBG,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    RichText(
                      maxLines: 2,
                      text: const TextSpan(
                          text: "You owe\n",
                          style: TextStyle(
                            color: ColorConstants.pageBG,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "₹ ${DummyData.dueAmount}",
                                style: TextStyle(
                                  fontSize: 24.0,
                                ))
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

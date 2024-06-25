import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/helperFunctions.dart';
import 'package:equisplit/models/groupCategories.dart';
import 'package:equisplit/models/qrCategories.dart';
import 'package:flutter/material.dart';

class ScannedDialog extends StatefulWidget {
  const ScannedDialog({super.key, required this.qrCategoriesData});

  final QrCategoriesData qrCategoriesData;

  @override
  State<ScannedDialog> createState() => _ScannedDialogState();
}

class _ScannedDialogState extends State<ScannedDialog> {
  @override
  Widget build(BuildContext context) {
    final Size totalSize = MediaQuery.of(context).size;
    final Color mainTileColor =
        widget.qrCategoriesData.category == QrCategories.group
            ? GroupCategoriesData(
                    category: widget.qrCategoriesData.groupCategory()!)
                .color()
            : widget.qrCategoriesData.cardColor();
    final double tileHeight = totalSize.height * 0.3;
    final double tileWidth = totalSize.width * 0.9;
    String profileImage =
        widget.qrCategoriesData.category == QrCategories.friend
            ? Constants.userImage
            : Constants.dummyGroupImage;

    final bool isEntity =
            widget.qrCategoriesData.category == QrCategories.friend ||
                widget.qrCategoriesData.category == QrCategories.group,
        isNotEntity = !isEntity;

    return Material(
      color: Colors.transparent,
      child: Container(
        height: tileHeight,
        width: tileWidth,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: ColorConstants.pageBG,
          borderRadius: BorderRadius.circular(25),
        ),
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
              isEntity
                  ? Positioned(
                      top: -tileHeight * 0.4,
                      right: -tileWidth * 0.6,
                      child: CircleAvatar(
                        radius: tileWidth * 0.65,
                        backgroundColor: mainTileColor.withAlpha(0x44),
                      ),
                    )
                  : const SizedBox(),
              isEntity
                  ? Positioned(
                      top: -tileHeight * 0.45,
                      right: -tileWidth * 0.5,
                      child: CircleAvatar(
                        radius: tileWidth * 0.5,
                        backgroundColor: mainTileColor.withAlpha(0x88),
                      ),
                    )
                  : const SizedBox(),
              isEntity
                  ? Positioned(
                      top: 25,
                      right: 25,
                      child: Container(
                        height: tileHeight * 0.6,
                        width: tileWidth * 0.3,
                        decoration: BoxDecoration(
                          color: mainTileColor,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(profileImage),
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
                  : const SizedBox(),
              isEntity
                  ? Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: tileWidth * 0.5,
                            child: Text(
                              widget.qrCategoriesData.name()!,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: const TextStyle(
                                color: ColorConstants.pageBG,
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print(
                                " Button Tapped :: ${widget.qrCategoriesData.label()}"),
                            child: Container(
                              width: tileWidth * 0.4,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: ColorConstants.pageBG,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  widget.qrCategoriesData.label(),
                                  style: TextStyle(
                                    color: mainTileColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: tileWidth * 0.9,
                            child: Text(
                              widget.qrCategoriesData.label(),
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(
                                color: ColorConstants.pageBG,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: tileWidth * 0.9,
                            child: Text(
                              widget.qrCategoriesData.scannedValue,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(
                                color: ColorConstants.pageBG,
                                fontSize: 22,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
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

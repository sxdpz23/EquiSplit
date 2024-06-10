import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.tileHeight,
    this.backImg,
  });

  final double tileHeight;
  final String? backImg;

  final String groupName = "Godrej K2B-1003";
  final double dueAmount = 245.00;
  final int groupMembersCount = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tileHeight,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                image: (backImg != null && backImg != "")
                    ? DecorationImage(
                        image: NetworkImage(backImg!),
                        fit: BoxFit.cover,
                      )
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                    Text(
                      groupName,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: const TextStyle(
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
                          groupMembersCount.toString(),
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
                  text: TextSpan(
                      text: "You owe\n",
                      style: const TextStyle(
                        color: ColorConstants.pageBG,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "₹ " + dueAmount.toString(),
                            style: const TextStyle(
                              fontSize: 24.0,
                            ))
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

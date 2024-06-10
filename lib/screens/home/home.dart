import 'package:equisplit/screens/group/group.dart';
import 'package:equisplit/screens/home/homeTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'fab.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/filters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool youOwe = false;
  double amount = 0;
  List<String>? groups;
  CategoryFilters? filter;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    amount = 1027532.23;
    if (amount > 0) youOwe = true;
    filter ??= CategoryFilters(filters: Filters.allGroups);
    groups = filter!.mainCategory() == "Groups"
        ? ["wow", "meow", "bhow", "bow wow"]
        : ["wow", "bhow", "bow wow"];
  }

  void _settingValues() {
    filter = CategoryFilters(filters: Filters.values[counter++]);

    groups = filter!.mainCategory() == "Groups"
        ? ["wow", "meow", "bhow", "bow wow"]
        : ["wow", "bhow", "bow wow"];

    if (counter == Filters.values.length - 1) counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size totalSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.pageBG,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 5,
        backgroundColor: ColorConstants.appBarBG,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0),
          child: Text(
            "Hi, ${Constants.userName} 👋",
            style: const TextStyle(
              fontSize: 26.0,
              color: ColorConstants.pageTXT,
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
        height: totalSize.height * 0.1,
        width: totalSize.width,
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 30.0),
          child: HomeFaButtons(
            fabBG: ColorConstants.pageTXT,
            fabTXT: ColorConstants.pageFGTXT,
            fabHighlight: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              SizedBox(
                height: totalSize.height * 0.1,
                width: totalSize.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorConstants.pageTXT,
                        borderRadius: BorderRadius.circular(20.0),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.black12,
                        //     blurRadius: 10,
                        //   )
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: const TextStyle(
                              color: ColorConstants.pageBG,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Total Dues Amount\n",
                            children: <TextSpan>[
                              TextSpan(
                                text: "₹ $amount",
                                style: TextStyle(
                                  color: youOwe
                                      ? ColorConstants.youOwe
                                      : ColorConstants.youAreOwed,
                                  fontSize: 30,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: AnimatedSwitcher(
                        duration: Durations.medium2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () => setState(() => _settingValues()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Icon(filter!.mainCategory() == 'Groups'
                                    ? Icons.group
                                    : Icons.person),
                                Text(
                                  filter!.mainCategory(),
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: ColorConstants.pageTXT,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28.0,
                                  ),
                                ),
                                Text(
                                  filter!.description(),
                                  style: const TextStyle(
                                    color: ColorConstants.pageTXT,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              // Expanded(
              //   child: AnimatedList(
              //     key: animatedListKey,
              //     itemBuilder: (context, index, animation) {
              //       final String heroTag = "HeroGroup$index";
              //       final Widget main = Hero(
              //         tag: heroTag,
              //         child: GestureDetector(
              //           onTap: () => Navigator.of(context).push(
              //             MaterialPageRoute(
              //                 builder: (context) => Group(heroTag: heroTag)),
              //           ),
              //           child: HomeTile(
              //             tileHeight: totalSize.height,
              //           ),
              //         ),
              //       );

              //       if (index == groups!.length - 1)
              //         return Padding(
              //           padding: EdgeInsets.only(bottom: totalSize.height * 0.2),
              //           child: main,
              //         );
              //       else
              //         return FadeTransition(
              //           opacity: animation,
              //           child: main,
              //         );
              //     },
              //   ),
              // ),
              groups != null
                  ? Column(
                      children: List.generate(
                        groups!.length,
                        (int index) {
                          final String heroTag = "HeroGroup$index";
                          final Widget main = Hero(
                            tag: heroTag,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Group(heroTag: heroTag)),
                              ),
                              child: HomeTile(
                                tileHeight: totalSize.height * 0.2,
                              ),
                            ),
                          );

                          if (index == groups!.length - 1)
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: totalSize.height * 0.2),
                              child: main,
                            );
                          else
                            return main;
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

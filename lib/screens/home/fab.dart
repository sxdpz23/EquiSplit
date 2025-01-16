import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/models/filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:equisplit/constants/helperFunctions.dart';

class HomeFaButtons extends StatefulWidget {
  HomeFaButtons(
      {super.key,
      required this.fabBG,
      required this.fabTXT,
      required this.fabHighlight,
      required this.filterAction,
      required this.addAction,
      this.filter = false,
      this.add = false,
      required this.filterCategories});

  final Color fabBG, fabTXT, fabHighlight;
  final Function filterAction, addAction;
  final bool filter, add;
  final CategoryFilters filterCategories;

  @override
  State<HomeFaButtons> createState() => _HomeFaButtonsState();
}

class _HomeFaButtonsState extends State<HomeFaButtons> {
  bool showContent = false;

  @override
  void initState() {
    super.initState();
  }

  void filterTap() {
    print("Filter Button Tapped");
    bool temp = showContent;
    if (showContent) {
      setState(() => showContent = false);
    }
    Future.delayed(Constants.allDuration, () => widget.filterAction());
    if (!temp) {
      Future.delayed(
        Constants.allDuration,
        () => setState(() => showContent = true),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.filterCategories.mainCategory();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Filter Dialog
        Expanded(
          child: AnimatedContainer(
            duration: Constants.allDuration,
            margin:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              color: widget.fabBG,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Opacity(
              opacity: showContent ? 1.0 : 0.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RadioListTile.adaptive(
                            title: Text(
                              "Groups",
                              style: TextStyle(color: widget.fabTXT),
                            ),
                            toggleable: true,
                            value: "Groups",
                            groupValue: category,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: RadioListTile.adaptive(
                            title: Text(
                              "Friends",
                              style: TextStyle(color: widget.fabTXT),
                            ),
                            toggleable: true,
                            value: "Friends",
                            groupValue: category,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: Constants.allDuration,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: false,
                            crossAxisCount: 2,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            children: List.generate(
                              4,
                              (index) => Container(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(70.0),
          child: Stack(
            children: <Widget>[
              /// Outermost Widget - Left Bottom FAB and Right Bottom FAB
              Center(
                child: Container(
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration: Constants.allDuration,
                    child: widget.add
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              /// Left Outermost Bottom FAB
                              GestureDetector(
                                onTap: () => filterTap(),
                                child: Tooltip(
                                  message: "Filter Expenses",
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: widget.fabBG,
                                    child: Center(
                                      child: Icon(
                                        FontAwesome.filter,
                                        color: widget.fabTXT,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// Right Outermost Bottom FAB
                              HelperFunctions.imageButton(border: 5.0),
                            ],
                          ),
                  ),
                ),
              ),

              /// Centre Side Widgets - Left Center Bottom FAB and Right Center Bottom FAB
              Center(
                child: AnimatedContainer(
                  duration: Constants.allDuration,
                  height: widget.add ? 100 : 50,
                  width: widget.filter || widget.add
                      ? (widget.add ? 250 : 0)
                      : 180,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: widget.fabBG,
                  ),
                  child: widget.filter
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: widget.add
                              ? MainAxisAlignment.spaceEvenly
                              : MainAxisAlignment.spaceBetween,
                          children: widget.add
                              ? List.generate(3, (index) {
                                  return IconButton(
                                    tooltip: "Add ${Constants.tooltips[index]}",
                                    onPressed: () {
                                      widget.addAction();
                                      print(
                                          "Icon Pressed :: ${Constants.tooltips[index]}");
                                    },
                                    icon: Icon(Constants.icons[index]),
                                    color: widget.fabTXT,
                                  );
                                })
                              : <Widget>[
                                  /// Left Innermost Center Bottom FAB
                                  IconButton(
                                    tooltip: "Add Expense",
                                    onPressed: () => widget.addAction(),
                                    icon: const Icon(CupertinoIcons.add),
                                    color: widget.fabTXT,
                                  ),

                                  /// Right Innermost Center Bottom FAB
                                  IconButton(
                                    tooltip: "Search",
                                    onPressed: () =>
                                        print("Icon Pressed :: Search"),
                                    icon: const Icon(CupertinoIcons.search),
                                    color: widget.fabTXT,
                                  ),
                                ],
                        ),
                ),
              ),

              /// Center FAB
              Center(
                child: Tooltip(
                  message: "Scanner",
                  child: AnimatedCrossFade(
                    crossFadeState: widget.filter || widget.add
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Constants.allDuration,
                    secondChild: const SizedBox(),
                    firstChild: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: widget.fabHighlight,
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
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/qr/scan'),
                          icon: const Icon(CupertinoIcons.qrcode_viewfinder),
                          color: widget.fabTXT,
                          iconSize: 28.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

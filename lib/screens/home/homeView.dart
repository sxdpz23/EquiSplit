import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.groups});

  final List<String>? groups;

  @override
  Widget build(BuildContext context) {
    double _totalHeight = MediaQuery.of(context).size.height;
    double _totalWidth = MediaQuery.of(context).size.width;

    if(groups==null)
      return Container();
    else
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(groups!.length, (i) {
          return Container(
            height: 100.0,
            width: 100.0,
            color: Colors.blue,
            margin: EdgeInsets.all(5.0),
          );
        })
      );
  }
}

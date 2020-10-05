import 'package:flutter/material.dart';
import 'main.dart';

class BackButtonXD extends StatefulWidget {
  final String name_route;
  int reset;
  bool pop;
  BackButtonXD(this.name_route, this.reset, this.pop);
  @override
  _BackButtonXDState createState() => _BackButtonXDState();
}

class _BackButtonXDState extends State<BackButtonXD> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (this.widget.pop) {
          Navigator.of(context).popAndPushNamed(this.widget.name_route);
        } else {
          Navigator.of(context).pushNamed(this.widget.name_route);
        }

        if (this.widget.reset == 2) pageState.initState();
        // reset o pagestate
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.grey[50],
      ),
    );
  }
}

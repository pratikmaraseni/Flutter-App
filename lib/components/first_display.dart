import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstDisplay extends StatefulWidget {
  const FirstDisplay({Key? key}) : super(key: key);

  @override
  _FirstDisplayState createState() => _FirstDisplayState();
}

class _FirstDisplayState extends State<FirstDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/new3.svg"),
      ],

    );
  }
}

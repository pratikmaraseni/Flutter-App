import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundScreen extends StatefulWidget {
  const BackgroundScreen({Key? key, this.rainbow = false}) : super(key: key);
  final bool rainbow;

  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  @override
  Widget build(BuildContext context) {
    final childrens = widget.rainbow
        ? [
            Positioned(
              child: SvgPicture.asset(
                "assets/rainbow.svg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/ocean.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  SvgPicture.asset(
                    "assets/field"
                    ".svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Positioned(
              child: SvgPicture.asset("assets/players"
                  ".svg"),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ]
        : [
      Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/ocean.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  SvgPicture.asset(
                    "assets/field"
                    ".svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            Positioned(
              child: SvgPicture.asset("assets/players"
                  ".svg"),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ];
    Stack stack = Stack(children: childrens);
    return stack;
  }
}

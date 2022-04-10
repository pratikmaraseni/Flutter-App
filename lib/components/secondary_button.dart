import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({Key? key, required this.callback, required this.name})
      : super(key: key);

  Function() callback;
  String name;

  @override
  Widget build(BuildContext context) {
    double winWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: winWidth,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btntext;
  final GestureTapCallback onClick;

  PrimaryButton({required this.btntext, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(btntext,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

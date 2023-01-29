import 'package:flutter/material.dart';
import 'package:rae_test/extension/context_extension.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Consulta',
        style: TextStyle(
          fontSize: context.pcw(9),
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'R',
            style: TextStyle(
              fontSize: context.pcw(10),
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          TextSpan(
            text: 'ae',
            style: TextStyle(
              fontSize: context.pcw(9),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

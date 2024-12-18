import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        const dotWidth = 5.0;
        const spaceWidth = 3.0;
        final dotCount = (width / (dotWidth + spaceWidth)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dotCount, (_) {
            return Container(
              width: dotWidth,
              height: 0.5, // Height of the dots
              decoration: BoxDecoration(
                color: Colors.black38, // Color of the dots
                shape: BoxShape.rectangle,

              ),
            );
          }),
        );
      },
    );
  }
}
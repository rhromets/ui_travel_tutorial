import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String titleText;
  final String detailText;

  const HomeTitle({
    super.key,
    required this.titleText,
    required this.detailText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        GestureDetector(
          onTap: () => debugPrint(detailText),
          child: Text(
            detailText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}

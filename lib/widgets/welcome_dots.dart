import 'package:flutter/material.dart';

class WelcomeDots extends StatelessWidget {
  const WelcomeDots({
    super.key,
    required this.countPages,
    required this.currentPage,
  });

  final int countPages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(countPages, (index) {
          return Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: currentPage == index ? Colors.blue[400] : Colors.grey[400],
              shape: BoxShape.circle,
            ),
          );
        })
      ],
    );
  }
}

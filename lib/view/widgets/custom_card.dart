import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double cardSize;
  final Widget child;

  CustomCard({required this.cardSize, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
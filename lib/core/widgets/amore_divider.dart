import 'package:flutter/material.dart';
import '../constants/amore_constants.dart';

class AmoreDivider extends StatelessWidget {
  final String symbol;
  const AmoreDivider({super.key, this.symbol = '✦'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  AmoreColors.rose,
                  Colors.transparent,
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              symbol,
              style: const TextStyle(
                color: AmoreColors.rose,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  AmoreColors.rose,
                  Colors.transparent,
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

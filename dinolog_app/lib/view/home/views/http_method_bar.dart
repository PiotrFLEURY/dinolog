import 'package:flutter/material.dart';

class HttpMethodBar extends StatelessWidget {
  const HttpMethodBar({
    super.key,
    required this.method,
    required this.color,
    required this.percentage,
    required this.count,
  });

  final String method;
  final Color color;
  final double percentage;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 300,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 64,
            child: Text(method, style: Theme.of(context).textTheme.labelMedium),
          ),
          Expanded(
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: percentage / 100,
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

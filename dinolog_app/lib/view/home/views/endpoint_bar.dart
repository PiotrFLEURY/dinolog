import 'package:flutter/material.dart';

class EndpointBar extends StatelessWidget {
  const EndpointBar({
    super.key,
    required this.endpoint,
    required this.color,
    required this.percentage,
    required this.count,
  });

  final String endpoint;
  final Color color;
  final double percentage;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 128,
            child: Text(
              endpoint,
              style: Theme.of(context).textTheme.labelSmall,
            ),
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
                      borderRadius: BorderRadius.circular(4),
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

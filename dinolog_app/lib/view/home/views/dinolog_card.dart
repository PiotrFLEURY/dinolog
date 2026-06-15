import 'package:dinolog_app/view/theme.dart';
import 'package:flutter/material.dart';

class DinologCard extends StatelessWidget {
  const DinologCard({
    super.key,
    required this.borderColor,
    required this.header,
    required this.content,
    required this.footer,
  });

  final Color borderColor;
  final String header;
  final String content;
  final String footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: DinologTheme.cardPanelBackground,
        border: Border(top: BorderSide(color: borderColor, width: 2)),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              header.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              content,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400),
            ),
            Text(footer, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}

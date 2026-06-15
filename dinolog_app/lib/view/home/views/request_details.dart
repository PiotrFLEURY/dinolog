import 'package:dinolog_app/view/theme.dart';
import 'package:flutter/material.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Text(
          'DETAILS DE LA REQUÊTE #1042',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: DinologTheme.accentSuccess,
            fontWeight: FontWeight.w600,
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            DetailsCard(title: 'HORODATAGE', body: '02/06/26 14:31:52'),
            DetailsCard(title: 'ADRESSE IP', body: '45.33.32.156'),
            DetailsCard(
              title: 'METHODE',
              body: 'POST',
              bodyColor: DinologTheme.accentInfo,
            ),
            DetailsCard(title: 'ENDPOINT', body: '/api/checkout'),
            DetailsCard(
              title: 'STATUT HTTP',
              body: '500',
              bodyColor: DinologTheme.accentError,
            ),
            DetailsCard(
              title: 'TEMPS DE REPONSE',
              body: '3.24s',
              bodyColor: DinologTheme.accentError,
            ),
            DetailsCard(title: 'TAILLE REPONSE', body: '612 B'),
            DetailsCard(
              title: 'USER AGENT',
              body: 'Mozilla/5.0 (Chrone/120) AppleWebKit/537.36',
            ),
          ],
        ),
      ],
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.title,
    required this.body,
    this.bodyColor = DinologTheme.textPrimary,
  });

  final String title;
  final String body;
  final Color bodyColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: DinologTheme.cardDetailBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DinologTheme.borderStandard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelSmall),
          Text(
            body,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: bodyColor),
          ),
        ],
      ),
    );
  }
}

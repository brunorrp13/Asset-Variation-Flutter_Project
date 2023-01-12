import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DayItemHeader extends StatelessWidget {
  const DayItemHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 39,
          children: [
            Text(
              AppLocalizations.of(context)?.day ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.date ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.value ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.dOne ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.firstDateVar ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

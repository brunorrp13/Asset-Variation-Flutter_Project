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
          spacing: 30,
          children: [
            Text(
              AppLocalizations.of(context)?.day ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.date ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              AppLocalizations.of(context)?.value ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.dOne ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)?.firstDateVar ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

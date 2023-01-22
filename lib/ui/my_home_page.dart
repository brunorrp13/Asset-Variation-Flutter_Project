import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_variacao_do_ativo/ui/price_variation_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const PriceVariationPage(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(6),
      )),
      centerTitle: false,
      title: Center(
        child: Text(
          AppLocalizations.of(context)?.assetChange ?? "",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            letterSpacing: -1,
          ),
        ),
      ),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }
}

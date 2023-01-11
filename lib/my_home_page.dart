import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_variacao_do_ativo/price_variation_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: _appBar(),
          body: const TabBarView(children: [
            PriceVariationPage(),
            Icon(Icons.directions_transit)
          ])),
    );
  }

  AppBar _appBar() {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.2))),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        padding: const EdgeInsets.only(left: 10),
        indicatorColor: Colors.transparent,
        labelPadding: const EdgeInsets.only(left: 10, right: 10),
        tabs: [
          Tab(
            child: Text(
              AppLocalizations.of(context)?.priceVariation ?? "",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: -1,
              ),
            ),
          ),
          Tab(
              child: Text(AppLocalizations.of(context)?.variationGraph ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: -1,
                  ))),
        ],
      ),
      centerTitle: false,
      title: Center(
        child: Text(
          "${AppLocalizations.of(context)?.assetChange ?? ""} - ${AppLocalizations.of(context)?.petr4}",
          style: const TextStyle(
            color: Colors.black,
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
      backgroundColor: Colors.white,
    );
  }
}

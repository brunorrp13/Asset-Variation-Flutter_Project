import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yahoofin/yahoofin.dart';

class PriceVariationPage extends StatefulWidget {
  const PriceVariationPage({super.key});

  @override
  State<PriceVariationPage> createState() => _PriceVariationPageState();
}

class _PriceVariationPageState extends State<PriceVariationPage> {
  late TextEditingController _controller;
  String _stockName = "";
  String _stockPrice = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
              controller: _controller,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite o ativo: ',
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => _getPriceVariation(_controller.text),
              child: Text(AppLocalizations.of(context)?.getAssetPrice ?? ""),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Valor da ação: "),
                Text(_stockPrice),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getPriceVariation(String stock) async {
    var yfin = YahooFin();
    StockHistory hist = yfin.initStockHistory(ticker: stock);
    StockChart chart = await yfin.getChartQuotes(
        stockHistory: hist,
        interval: StockInterval.oneDay,
        period: StockRange.fiveYear);
    print(chart.chartQuotes!.timestamp);
    _stockPrice = chart.chartQuotes?.open.toString() ?? "";
  }
}

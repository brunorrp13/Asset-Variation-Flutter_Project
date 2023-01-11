import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_variacao_do_ativo/app/day_item.dart';
import 'package:flutter_variacao_do_ativo/app/day_item_header.dart';
import 'package:flutter_variacao_do_ativo/model/stock_history_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:yahoofin/yahoofin.dart';

class PriceVariationPage extends StatefulWidget {
  const PriceVariationPage({super.key});

  @override
  State<PriceVariationPage> createState() => _PriceVariationPageState();
}

class _PriceVariationPageState extends State<PriceVariationPage> {
  late TextEditingController _controller;
  List<StockHistoryModel> _stockHistory = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0),
        child: Column(children: [
          TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)?.assetTypying ?? "",
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () => _getPriceVariation(_controller.text),
              child: Text(AppLocalizations.of(context)?.getAssetPrice ?? ""),
            ),
          ),
          if (_stockHistory.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: DayItemHeader(),
            ),
          if (_isLoading) _loader(),
          if (_stockHistory.isNotEmpty)
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _stockHistory.length,
                  itemBuilder: (context, index) {
                    return DayItem(
                        day: (index + 1).toString(),
                        date: _stockHistory[index].date,
                        amount: _stockHistory[index].value,
                        dOneVariation: _stockHistory[index].dVariation,
                        firstDayVariation:
                            _stockHistory[index].firstDateVariation);
                  }),
            )
        ]));
  }

  Future<void> _getPriceVariation(String stock) async {
    setState(() {
      _isLoading = true;
    });
    _stockHistory = [];
    var yfin = YahooFin();
    StockHistory hist = yfin.initStockHistory(ticker: stock);
    StockChart chart = await yfin.getChartQuotes(
        stockHistory: hist,
        interval: StockInterval.oneDay,
        period: StockRange.oneMonth);
    _handleChart(chart.chartQuotes);
  }

  void _handleChart(ChartQuotes? chart) {
    setState(() {
      _isLoading = false;
    });
    if (chart != null && chart.open != null && chart.open!.isNotEmpty) {
      var counter = 0;
      final now = DateTime.now();

      for (var i = chart.open!.length - 1; i >= 0; i--) {
        var itemDate = getFormatedDate(
            DateTime(now.year, now.month, now.day - i).toString());
        var itemValue = "R\$ ${chart.open![counter].toStringAsFixed(2)}";
        var itemDVariation = "";
        var itemFirstDateVariation = "";
        if (counter != 0) {
          itemDVariation = variation(chart.open![counter].toDouble(),
              chart.open![counter - 1].toDouble());
          itemFirstDateVariation = variation(
              chart.open![counter].toDouble(), chart.open![0].toDouble());
        }
        _stockHistory.add(StockHistoryModel(
            date: itemDate,
            value: itemValue,
            dVariation: itemDVariation,
            firstDateVariation: itemFirstDateVariation));
        counter++;
      }
      setState(() {
        _stockHistory;
      });
    } else {
      _handleNullValue();
    }
  }

  void _handleNullValue() {
    _stockHistory = [];
    Fluttertoast.showToast(
      msg: AppLocalizations.of(context)?.assetDataNotFound ?? "",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  String variation(double currentValue, double previousValue) {
    var assetVariation = ((currentValue / previousValue) - 1) * 100;
    var output = "";
    if (assetVariation < 0) {
      output = "${(assetVariation.toStringAsFixed(2))}%";
    } else {
      output = " ${(assetVariation.toStringAsFixed(2))}%";
    }
    return output;
  }

  String getFormatedDate(String _date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  Center _loader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }
}

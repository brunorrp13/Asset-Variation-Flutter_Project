import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets.state.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_bloc.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_event.dart';
import 'package:flutter_variacao_do_ativo/components/day_item.dart';
import 'package:flutter_variacao_do_ativo/components/day_item_header.dart';
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
  AssetsBloc get _bloc => BlocProvider.of<AssetsBloc>(context);
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
    return _builder();
  }

  BlocBuilder _builder() {
    return BlocBuilder<AssetsBloc, AssetsState>(
        bloc: _bloc,
        builder: (BuildContext context, AssetsState state) {
          if (state is OnNoDataFound) {
            _handleNullValue();
          }
          if (state is SuccessfullyLoadedContentState<OnAssetsDataFound>) {
            _handleChart(state.content.assetsResponse?.chartQuotes,
                state.content.assetsResponse?.currency ?? "");
            _isLoading = false;
            return _content();
          }
          if (state is LoadingState) {
            _isLoading = true;
            return _content();
          }
          _isLoading = false;
          return _content();
        });
  }

  Widget _content() {
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
              key: const Key("btnAssets"),
              onPressed: () => _getPriceVariation(_controller.text),
              child: Text(AppLocalizations.of(context)?.getAssetPrice ?? ""),
            ),
          ),
          if (_stockHistory.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 8),
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

  void _getPriceVariation(String stock) {
    _stockHistory = [];
    _bloc.add(OnFindAssets(stock));
  }

  void _handleChart(ChartQuotes? chart, String currency) {
    if (chart != null && chart.open != null && chart.open!.isNotEmpty) {
      var counter = 0;
      final now = DateTime.now();
      var days = (chart.open!.length >= 30) ? 29 : chart.open!.length - 1;

      for (var i = days; i >= 0; i--) {
        var itemDate = getFormatedDate(
            DateTime(now.year, now.month, now.day - i).toString());
        var itemValue = "$currency ${chart.open![counter].toStringAsFixed(2)}";
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

  String getFormatedDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
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

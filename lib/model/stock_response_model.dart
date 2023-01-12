import 'package:yahoofin/yahoofin.dart';

class StrockResponseModel {
  ChartQuotes? chartQuotes;
  String currency;

  StrockResponseModel({
    required this.chartQuotes,
    required this.currency,
  });
}

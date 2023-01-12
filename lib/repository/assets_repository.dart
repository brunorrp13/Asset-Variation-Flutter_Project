import 'package:flutter_variacao_do_ativo/model/stock_response_model.dart';
import 'package:yahoofin/yahoofin.dart';

abstract class AssetsRepositoryProtocol {
  Future<StrockResponseModel> getChartQuotes(String stock);
}

class AssetsRepository implements AssetsRepositoryProtocol {
  @override
  Future<StrockResponseModel> getChartQuotes(String stock) async {
    var yfin = YahooFin();
    StockHistory hist = yfin.initStockHistory(ticker: stock);
    StockMeta meta = await yfin.getMetaData(stock);
    StockChart chart = await yfin.getChartQuotes(
        stockHistory: hist,
        interval: StockInterval.oneDay,
        period: StockRange.sixMonth);
    var response = StrockResponseModel(
        chartQuotes: chart.chartQuotes, currency: meta.currency.toString());
    return response;
  }
}

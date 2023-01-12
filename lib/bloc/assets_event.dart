import 'package:yahoofin/yahoofin.dart';

abstract class AssetsEvent {}

class OnFindAssets extends AssetsEvent {
  final String stock;
  OnFindAssets(this.stock);

  @override
  List<Object?> get props => [stock];
}

class OnFindOrdersHistory extends AssetsEvent {
  final ChartQuotes? assetsData;

  OnFindOrdersHistory(this.assetsData);

  @override
  List<Object?> get props => [assetsData];
}

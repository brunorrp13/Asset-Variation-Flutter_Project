import 'package:flutter_variacao_do_ativo/model/stock_response_model.dart';
import 'package:yahoofin/yahoofin.dart';

abstract class AssetsState {}

class InitialState extends AssetsState {
  @override
  List<Object?> get props => <Object>[];
}

class LoadingState extends AssetsState {
  @override
  List<Object?> get props => <Object>[];
}

class SuccessfullyLoadedContentState<T> extends AssetsState {
  final T content;
  SuccessfullyLoadedContentState({required this.content});

  @override
  List<Object?> get props => <Object>[content as Object];
}

class OnAssetsDataFound extends AssetsState {
  final StrockResponseModel? assetsResponse;
  OnAssetsDataFound({
    this.assetsResponse,
  });

  @override
  List<Object?> get props => <Object?>[assetsResponse];
}

class OnNoDataFound extends AssetsState {
  OnNoDataFound();

  @override
  List<Object?> get props => <Object?>[];
}

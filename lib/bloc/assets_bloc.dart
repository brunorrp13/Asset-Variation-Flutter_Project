import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets.state.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_event.dart';
import 'package:flutter_variacao_do_ativo/model/stock_response_model.dart';
import 'package:flutter_variacao_do_ativo/repository/assets_repository.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final AssetsRepository repository;

  AssetsBloc({
    required this.repository,
  }) : super(InitialState()) {
    on<OnFindAssets>((event, emit) async {
      emit(LoadingState());
      try {
        final StrockResponseModel? response =
            await repository.getChartQuotes(event.stock);
        if (response == null || response.chartQuotes == null) {
          emit(OnNoDataFound());
          return;
        }
        if (response.chartQuotes!.open!.isNotEmpty) {
          var assetsDataFound = OnAssetsDataFound(assetsResponse: response);
          emit(SuccessfullyLoadedContentState<OnAssetsDataFound>(
              content: assetsDataFound));
          return;
        }
        emit(OnNoDataFound());
      } catch (exception) {
        emit(OnNoDataFound());
      }
    });
  }
}

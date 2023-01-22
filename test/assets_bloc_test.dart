import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets.state.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_bloc.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_event.dart';
import 'package:flutter_variacao_do_ativo/model/stock_response_model.dart';
import 'package:flutter_variacao_do_ativo/repository/assets_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:yahoofin/yahoofin.dart';

class AssetsRepositoryMock extends Mock implements AssetsRepository {}

void main() {
  late AssetsBloc assetsBloc;
  late AssetsRepositoryMock assetsRepository;

  setUp(() {
    assetsRepository = AssetsRepositoryMock();
    assetsBloc = AssetsBloc(repository: assetsRepository);
  });

  group('CounterBloc', () {
    List<num>? chartOpen = [1, 2];
    List<num>? chartLow = [1, 2];
    List<num>? chartClose = [1, 2];
    List<num>? chartVolume = [1, 2];
    List<num>? chartHigh = [1, 2];
    List<num>? chartTimestamp = [1, 2];

    var chartQuotes = ChartQuotes(
        open: chartOpen,
        low: chartLow,
        close: chartClose,
        volume: chartVolume,
        high: chartHigh,
        timestamp: chartTimestamp);
    var strockResponseModel =
        StrockResponseModel(chartQuotes: chartQuotes, currency: 'USD');
    var assetsDataFound =
        OnAssetsDataFound(assetsResponse: strockResponseModel);

    test("Initial Test!", () {
      expect(assetsBloc.state, InitialState());
    });

    blocTest<AssetsBloc, AssetsState>(
      'emits OnNoDataFound when nothing is found is added',
      build: () => assetsBloc,
      act: ((bloc) => bloc.add(OnFindAssets('go'))),
      expect: () => <AssetsState>[LoadingState(), OnNoDataFound()],
    );

    blocTest<AssetsBloc, AssetsState>(
      'emits OnDataFound when nothing is found is added',
      build: () {
        when(assetsRepository.getChartQuotes('go'))
            .thenAnswer((_) async => strockResponseModel);
        return assetsBloc;
      },
      act: ((bloc) => bloc.add(OnFindAssets('go'))),
      expect: () => <AssetsState>[
        LoadingState(),
        SuccessfullyLoadedContentState<OnAssetsDataFound>(
            content: assetsDataFound)
      ],
    );
  });
}

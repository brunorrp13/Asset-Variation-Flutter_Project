import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_bloc.dart';
import 'package:flutter_variacao_do_ativo/repository/assets_repository.dart';
import 'package:flutter_variacao_do_ativo/ui/price_variation_page.dart';
import 'package:mocktail/mocktail.dart';

class AssetsRepositoryMock extends Mock implements AssetsRepository {}

void main() {
  late AssetsBloc assetsBloc;
  late AssetsRepositoryMock assetsRepository;

  group('Login', () {
    setUpAll(() {
      assetsRepository = AssetsRepositoryMock();
      assetsBloc = AssetsBloc(repository: assetsRepository);
    });

    testWidgets('Pump Variation Page and find check button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
              value: assetsBloc, child: const PriceVariationPage()),
        ),
      );
      expect(find.byKey(const Key("btnAssets")), findsOneWidget);
    });
  });
}

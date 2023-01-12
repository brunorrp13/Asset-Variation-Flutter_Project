import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_variacao_do_ativo/bloc/assets_bloc.dart';
import 'package:flutter_variacao_do_ativo/repository/assets_repository.dart';
import 'package:flutter_variacao_do_ativo/ui/my_home_page.dart';

void main() {
  runApp(const _AppSetup());
}

class _AppSetup extends StatefulWidget {
  const _AppSetup({Key? key}) : super(key: key);

  @override
  State<_AppSetup> createState() => _AppSetupState();
}

class _AppSetupState extends State<_AppSetup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AssetsBloc>(
          create: (BuildContext context) => AssetsBloc(
                repository: AssetsRepository(),
              ))
    ], child: _content());
  }

  MaterialApp _content() {
    return MaterialApp(
        title: 'Variação do Ativo',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (
          locale,
          supportedLocales,
        ) {
          return locale;
        },
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR'),
        ],
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.blue,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          fontFamily: 'Nunito',
        ),
        home: const MyHomePage());
  }
}

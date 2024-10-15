import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstask/features/news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:newstask/features/splash/presentation/pages/splash.dart';

import 'injection_container.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependecies();
  await initializeDateFormatting('ar');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(
          create: (context) => locator()..add(GetArticlesEvent()),
        ),
      ],
      child: const MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

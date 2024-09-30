import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamm_news_app/utils/app_constants.dart';
import 'package:sizer/sizer.dart';
import 'bloc/bloc.dart';
import 'screens/list_articles/list_articles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: BlocProvider(
            create: (context) => NewsBloc(),
            child: const ListArticles(),
          ),
        );
      },
    );
  }
}

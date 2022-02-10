import 'package:flutter/material.dart';
import 'package:flutter_starter/view/pages/page.dart';
import 'package:provider/provider.dart';

import 'controllers/survey_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SurveyProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SurveyPage(),
      ),
    );
  }
}

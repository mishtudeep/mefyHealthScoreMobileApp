import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:health_score_app/services/healthscoreservice.dart';
import 'package:health_score_app/views/welcome.dart';
import 'package:neumorphic/neumorphic.dart';

void setupLocator() {
  GetIt.instance.registerLazySingleton(()=> HealthScoreService());
}
void main() {
  setupLocator();
  runApp(MyApp());
}

Color _color = Color(0xFFf2f2f2);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: _color,
    ));
    return NeuApp(
      title: 'Health Score App',
      theme: NeuThemeData(
        primaryColor: Color.lerp(_color, Colors.white, 0.2),
        backgroundColor: Color.lerp(_color, Colors.black, 0.005),
        scaffoldBackgroundColor: _color,
        dialogBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: _color,
        ),
        iconTheme: IconThemeData(
            color: Colors.black,
        ),

      ),
      home: Welcome()
    );
  }
}
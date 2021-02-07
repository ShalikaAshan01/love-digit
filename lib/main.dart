import 'package:flutter/material.dart';
import 'package:flutter_template/components/size_config.dart';
import 'package:flutter_template/pages/home/home_view.dart';

import 'components/app_brand.dart';

void main() => runApp(
    MyApp()
  // DevicePreview(
  //   enabled: false,
  //   builder: (context) => MyApp(), // Wrap your app
  // ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Color(0xFF4b2e68),
        accentColor: Color(0xFF744c7a),
        textTheme: TextTheme(
          headline5: TextStyle(shadows: [
            Shadow(
              color: Colors.grey,
              blurRadius: 5
            )
          ]),
          headline6: TextStyle(fontSize: 16,
              shadows: [
            Shadow(
                color: Colors.grey,
                blurRadius: 5
            )
          ]),
        ),
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),


      ),
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return HomeView();
  }
}


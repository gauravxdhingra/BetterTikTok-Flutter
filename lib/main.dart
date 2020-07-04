import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alt/provider/auth_provider.dart';
import 'package:tiktok_alt/screens/home_pageview.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_alt/screens/login_signup_screen.dart';
import 'package:tiktok_alt/screens/new_video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider(
      create: (ctx) => AuthProvider(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AuthProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.pink[700],
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          // home: HomepageView(),
          routes: {
            '/': (ctx) => LoginSignup(),
            HomepageView.routename: (ctx) => HomepageView(),
            NewVideo.routename: (ctx) => NewVideo(),
          },
        ),
      ),
    );
  }
}

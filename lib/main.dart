import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_outlets/responsive_ui/responsive_widget.dart';
import 'package:shop_outlets/screens/web_mainpage.dart';
import 'package:shop_outlets/statemanagement/provider/panorama_provider.dart';
import 'package:shop_outlets/statemanagement/provider/productprovider.dart';
import 'package:shop_outlets/statemanagement/provider/theme_provider.dart';



void main() async {

  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themeBool = prefs.getBool("isDark") ?? false;

  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeProvider(isDark: themeBool),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({  Key? key,}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => PanoramaImageProvider()),
        ],
        child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Shop Outlet',
            theme: themeProvider.getTheme,
            scrollBehavior: MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            debugShowCheckedModeBanner: false,
            home: WebMainPage(),
          );
        }));
  }
}

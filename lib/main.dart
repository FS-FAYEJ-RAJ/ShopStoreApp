import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeapprestapi/contens/golobals_colors.dart';
import 'package:storeapprestapi/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter design",
      theme: ThemeData(
        scaffoldBackgroundColor: lightScafoldColor,
        primaryColor: lightCardColor,
        backgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color:lightIconColor
          ),
          centerTitle: true,
          backgroundColor: lightScafoldColor,
          titleTextStyle: TextStyle(
            color: lightTextColor,fontSize: 22,fontWeight: FontWeight.bold
          ),
         // elevation: 0,
        ),
        iconTheme:IconThemeData(
          color: lightIconColor
        ),
        textSelectionTheme:const TextSelectionThemeData(
          cursorColor: Colors.black54,
          selectionColor: Colors.blue
        ),
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: lightIconColor,
          brightness: Brightness.light
        )
      ),
      home: HomePage(),

    );
  }
}


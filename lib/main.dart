import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vd_commmerce/app/bindings/initial_bindings.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      initialBinding: InitialBindings(),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        cardColor: AppColor.secondary,
        primaryColor: AppColor.primary,
        scaffoldBackgroundColor: AppColor.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.secondary,
        ),
        colorScheme: const ColorScheme.dark()
            .copyWith(
              secondary: AppColor.secondary,
              primary: AppColor.primary,
              background: AppColor.background,
            )
            .copyWith(background: AppColor.background),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class AppColor {
  // static const Color primary = Color(0xffeb462f);
  static const Color primary = Color(0xFF497fff);
  static const Color secondary = Color(0xFF2A2D3E);
  static const Color background = Color(0xFF212332);
  static const Color google = Color(0xffDB4437);
  static const Color facebook = Color(0xff4267B2);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color iconColor1 = Color(0xffF4AFB4);
  static const Color iconColor2 = Color(0xff61C9A8);
  static const Color iconColor3 = Color(0xffF0EC57);
  static const Color iconColor4 = Color(0xff39a2f7);
  static const Color iconColor5 = Color(0xffD72638);
}

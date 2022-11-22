import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_ui/pages/nav_wid/home_page.dart';
import 'package:form_ui/pages/nav_wid/language_page.dart';
import 'package:form_ui/pages/login_page.dart';
import 'package:form_ui/pages/register_form_page.dart';
import 'package:form_ui/translations/codegen_loader.g.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('kk'), Locale('en'), Locale('ru')],
      fallbackLocale:  Locale('ru'),
      path: 'assets/translations',
      assetLoader:  CodegenLoader(),
      child:  MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LanguagePage(),
    );
  }
}

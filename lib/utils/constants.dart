import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutube/utils/utils.dart';
import 'package:flutube/models/models.dart';

const mobileWidth = 650;
const primaryColor = Colors.red;

ThemeData getThemeData(BuildContext context, Brightness brightness) {
  return ThemeData(
      primarySwatch: primaryColor,
      primaryColor: primaryColor,
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSwatch(
        brightness: brightness,
        primarySwatch: primaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: brightness.getAltBackgroundColor,
        foregroundColor: brightness.textColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: brightness.getBackgroundColor,
          statusBarColor: brightness.getBackgroundColor,
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: brightness.getAltBackgroundColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ));
}

final myApp = FTInfo(
  name: 'FluTube',
  url: 'https://github.com/prateekmedia/flutube',
  description: 'Youtube video downloader made using flutter.',
  logoBase64:
      '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',
);

final developerInfos = <FTInfo>[
  FTInfo(
    name: 'Prateek SU',
    url: 'https://github.com/prateekmedia',
    description: 'Founder | Lead Developer | Always curious to learn new and great stuff',
    logoBase64:
        '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',
  )
];

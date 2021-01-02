import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/home_screen.dart';

void main() => runApp(LiteChat());

class LiteChat extends StatelessWidget {
  // This widget is the entry point for LiteChat.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LiteChat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: LiteChatConstants.primaryColor,
            accentColor: LiteChatConstants.accentColor),
        home: AnimatedSplashScreen(
          nextScreen: HomeScreen(),
          splash: 'assets/app_icon.png',
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.scale,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) =>
                S.delegate.supportedLocales.first);
  }
}

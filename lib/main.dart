import 'dart:async';

import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:LiteChat/helpers/oauth_helper.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as OAuthLib;
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_links/uni_links.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  bindDeepLinkChannel();
  runApp(LiteChat());
}

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
        home: AnimatedSplashScreen.withScreenFunction(
          screenFunction: () async => inflateHomeScreen(),
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

  Future<Widget> inflateHomeScreen() async {
    OAuthLib.Client client = await OAuthHelper.getOAuthClient();
    if (client != null) {
      print(client.read(FlutterConfig.get('server_url') + '/api/v2/me'));
    }

    return HomeScreen();
  }
}

Future<Null> bindDeepLinkChannel() async {
  try {
    Uri initialUri = await getInitialUri();
    print('Initial: ${initialUri.toString()}');
  } catch (err) {
    print('Oops! Platform channel has exploded x( $err');
  }
}

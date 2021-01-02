import 'dart:async';
import 'dart:io';

import 'package:flutter_config/flutter_config.dart';
import 'package:oauth2/oauth2.dart' as OAuthLib;
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class OAuthHelper {
  static final String accountsUrl = FlutterConfig.get('accounts_url');
  static final Uri _authorizationEndpoint =
      Uri.parse(accountsUrl + '/oauth/v2/auth?scope=ZohoCliq.Profile.READ');

  static final Uri _tokenEndpoint =
      Uri.parse(accountsUrl + '/oauth/v2/token?scope=ZohoCliq.Profile.READ');

  static final String _clientID = FlutterConfig.get('client_id');
  static final String _clientSecret = FlutterConfig.get('client_secret');

  static final Uri _redirectUri =
      Uri.parse(FlutterConfig.get('oauth_callback_url'));

  static File getCredentialsFile() {
    return File('~/.store/credentials.json');
  }

  // ignore: missing_return
  static Future<OAuthLib.Client> getOAuthClient() async {
    final credentialsFile = getCredentialsFile();
    bool exists = await credentialsFile.exists();

    if (exists) {
      OAuthLib.Credentials credentials =
          OAuthLib.Credentials.fromJson(await credentialsFile.readAsString());
      return OAuthLib.Client(credentials,
          identifier: _clientID, secret: _clientSecret);
    }

    OAuthLib.AuthorizationCodeGrant grant = OAuthLib.AuthorizationCodeGrant(
        _clientID, _authorizationEndpoint, _tokenEndpoint,
        secret: _clientSecret);

    Uri authorizationUrl = grant.getAuthorizationUrl(_redirectUri);

    await launch(authorizationUrl.toString());

    StreamSubscription _subscription;
    _subscription = getLinksStream().listen((String link) async {
      _subscription.cancel();
      print('From sub: $link');
      OAuthLib.Client client = await grant
          .handleAuthorizationResponse(Uri.parse(link).queryParameters);

      credentialsFile.writeAsString(client.credentials.toJson());

      return client;
    }, onError: (err) {
      _subscription.cancel();
      print('Stream failure :( $err');
      return null;
    });
  }
}

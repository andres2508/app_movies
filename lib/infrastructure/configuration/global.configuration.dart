class GlobalMovieConfiguration {
  String _redirectAuthURL = const String.fromEnvironment('redirect_url');
  final String _genesysURL = const String.fromEnvironment('genesys_url');
  String _clientId = const String.fromEnvironment('client_id');
  String? _clientSecretId = const String.fromEnvironment('client_secret');
  String _server = const String.fromEnvironment('server');

  static final GlobalMovieConfiguration controller =
      GlobalMovieConfiguration._intern();

  GlobalMovieConfiguration._intern();

  factory GlobalMovieConfiguration() {
    return controller;
  }

  String get apiServer => '$_server/api/v1';

  String get authServer => '$_server/oauth2';

  String get redirectAuthURL => _redirectAuthURL;

  String get server => _server;

  String get clientId => _clientId;

  String? get clientSecretId => _clientSecretId;

  String get genesysURL => _genesysURL;

  void setServer(String value) {
    _server = value;
  }

  void setRedirectURL(String value) {
    _redirectAuthURL = value;
  }

  void setClientId(String value) {
    _clientId = value;
  }

  void setClientSecretId(String? value) {
    if (value == "") {
      _clientSecretId = null;
    } else {
      _clientSecretId = value;
    }
  }
}

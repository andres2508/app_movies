class GlobalMovieConfiguration {
  final String _server = const String.fromEnvironment('server');
  final String _imageServer = const String.fromEnvironment('image_server');
  final String _accessToken = const String.fromEnvironment('access_token');
  final String _apiKey = const String.fromEnvironment('api_key');

  static final GlobalMovieConfiguration controller =
      GlobalMovieConfiguration._intern();

  GlobalMovieConfiguration._intern();

  factory GlobalMovieConfiguration() {
    return controller;
  }

  // Send API V3 version
  String get apiServer => '$_server/3';
  String get accessToken => _accessToken;

  String get imageServer => _imageServer;
}

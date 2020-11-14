class Settings {
  static final Settings _singleton = Settings._internal();

  factory Settings() {
    return _singleton;
  }

  Settings._internal();

  static String baseUrlPrefix = 'https://api.giphy.com/v1/gifs/search';
  static String giphyApiKey = 'Zm0c2e2dQHc6A4sSHwPsxz3qXaSNffLE';
}
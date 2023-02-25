class GoogleApiSettings {
  // この辺は各自設定してください
  static const String spreadsSheetsUrl = "https://docs.google.com/spreadsheets/d/1UzD0w7FrrLwEvgmCSl0N__HpqTkFmbKmPRDii8mf5eo/edit?usp=sharing";
  static const String sheetName = "elementary";
  static const String apiKey = "AIzaSyBseKzDFZPKOKgpISUmie72VSeGPzkyusE";
  /// GoogleSheetsAPI(v4.spreadsheets.values - get)のURL生成
  /// 詳細: https://developers.google.com/sheets/api/reference/rest
  static String createGoogleSheetsApiGetUrl() {
    if (spreadsSheetsUrl.isEmpty || sheetName.isEmpty || apiKey.isEmpty) {
      throw ('please set google api settings.');
    }
    return 'https://sheets.googleapis.com/v4/spreadsheets/${spreadsSheetsUrl}/values/${sheetName}?key=${apiKey}';
  }
}
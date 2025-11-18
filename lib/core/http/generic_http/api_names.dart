class ApiNames {
  static const String baseUrl = "https://api.expense-tracker.com/v1";

  // Auth endpoints
  static const String login = "/auth/login";
  static const String refresh = "/auth/refresh";
  static const String logout = "/auth/logout";

  // Expense endpoints
  static const String expenses = "/expenses";
  static const String categories = "/expenses/categories";
  static const String sync = "/expenses/sync";

  // Currency endpoints
  static const String currencyRates = "/currency/rates";

  // Reports endpoints
  static const String reports = "/reports";
  static const String summary = "/reports/summary";
}

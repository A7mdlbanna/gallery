enum AppLanguages {
  arabic,
  english,
}

extension AppLanguageHelper on AppLanguages {
  String get value {
    switch (this) {
      case AppLanguages.arabic:
        return 'ar';
      case AppLanguages.english:
        return 'en';
    }
  }
}

class Language {
  final int id;
  final String
      flag; // link for country flag https://en.wikipedia.org/wiki/Regional_indicator_symbol
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "English", "en"),
      Language(2, "🇦🇫", "فارسی", "fa"),
      Language(3, "🇻🇳", "Viet Nam", "vi"),
    ];
  }
}

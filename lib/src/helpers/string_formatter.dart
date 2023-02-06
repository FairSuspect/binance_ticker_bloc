extension DoubleFormatter on String {
  String get excludeZeroes {
    final regExp = RegExp(r'\.*0+$');

    return replaceAll(regExp, '');
  }
}

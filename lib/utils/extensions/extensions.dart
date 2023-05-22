extension StringExtension on String {
  String capitalizeFirstLetter() {
    return this[0].toUpperCase() + substring(1);
  }
}

extension NumberExtension on int {
  String formatPokemonNumber() {
    return '#${toString().padLeft(3, '0')}';
  }

  String formatPokemonStat() {
    return toString().padLeft(3, '0');
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeFirstOfEach() {
    return split(" ").map((str) => str.capitalize()).join(" ");
  }

  String capitalizeFirstOfEachWord() {
    return split(" ").map((str) => str.capitalize()).join(" ");
  }

  String capitalizeFirstOfEachWordAndRemoveSpace() {
    return split(" ").map((str) => str.capitalize()).join("");
  }

  String capitalizeFirstOfEachWordAndRemoveSpaceAndSpecialCharacters() {
    return split(" ")
        .map((str) => str.capitalize())
        .join("")
        .replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String
      capitalizeFirstOfEachWordAndRemoveSpaceAndSpecialCharactersAndNumbers() {
    return split(" ")
        .map((str) => str.capitalize())
        .join("")
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(r'[0-9]'), '');
  }

  String
      capitalizeFirstOfEachWordAndRemoveSpaceAndSpecialCharactersAndNumbersAndAccentuation() {
    return split(" ")
        .map((str) => str.capitalize())
        .join("")
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(r'[0-9]'), '')
        .replaceAll(RegExp(r'[áàãâä]'), 'a')
        .replaceAll(RegExp(r'[éèêë]'), 'e')
        .replaceAll(RegExp(r'[íìîï]'), 'i')
        .replaceAll(RegExp(r'[óòõôö]'), 'o')
        .replaceAll(RegExp(r'[úùûü]'), 'u')
        .replaceAll(RegExp(r'[ç]'), 'c');
  }

  String
      capitalizeFirstOfEachWordAndRemoveSpaceAndSpecialCharactersAndNumbersAndAccentuationAndRemoveDiacritics() {
    return split(" ")
        .map((str) => str.capitalize())
        .join("")
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(r'[0-9]'), '')
        .replaceAll(RegExp(r'[áàãâä]'), 'a')
        .replaceAll(RegExp(r'[éèêë]'), 'e')
        .replaceAll(RegExp(r'[íìîï]'), 'i')
        .replaceAll(RegExp(r'[óòõôö]'), 'o')
        .replaceAll(RegExp(r'[úùûü]'), 'u')
        .replaceAll(RegExp(r'[ç]'), 'c')
        .replaceAll(RegExp(r'[ÁÀÃÂÄ]'), 'A')
        .replaceAll(RegExp(r'[ÉÈÊË]'), 'E')
        .replaceAll(RegExp(r'[ÍÌÎÏ]'), 'I')
        .replaceAll(RegExp(r'[ÓÒÕÔÖ]'), 'O')
        .replaceAll(RegExp(r'[ÚÙÛÜ]'), 'U')
        .replaceAll(RegExp(r'[Ç]'), 'C');
  }

  String
      capitalizeFirstOfEachWordAndRemoveSpaceAndSpecialCharactersAndNumbersAndAccentuationAndRemoveDiacriticsAndRemoveSpecialCharacters() {
    return split(" ")
        .map((str) => str.capitalize())
        .join("")
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(RegExp(r'[0-9]'), '')
        .replaceAll(RegExp(r'[áàãâä]'), 'a')
        .replaceAll(RegExp(r'[éèêë]'), 'e')
        .replaceAll(RegExp(r'[íìîï]'), 'i')
        .replaceAll(RegExp(r'[óòõôö]'), 'o')
        .replaceAll(RegExp(r'[úùûü]'), 'u')
        .replaceAll(RegExp(r'[ç]'), 'c')
        .replaceAll(RegExp(r'[ÁÀÃÂÄ]'), 'A')
        .replaceAll(RegExp(r'[ÉÈÊË]'), 'E')
        .replaceAll(RegExp(r'[ÍÌÎÏ]'), 'I')
        .replaceAll(RegExp(r'[ÓÒÕÔÖ]'), 'O')
        .replaceAll(RegExp(r'[ÚÙÛÜ]'), 'U')
        .replaceAll(RegExp(r'[Ç]'), 'C')
        .replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String currency() {
    return "R\$ ${replaceAll(RegExp(r'[^\w\s]+'), '')}";
  }

  String currencyWithDecimal() {
    return "R\$ ${replaceAll(RegExp(r'[^\w\s]+'), '')}".replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }

  String currencyWithDecimalAndRemoveDecimalIfZero() {
    return "R\$ ${replaceAll(RegExp(r'[^\w\s]+'), '')}"
        .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')
        .replaceAll(RegExp(r'\.00'), '');
  }

  String currencyWithDecimalAndRemoveDecimalIfZeroAndRemoveCurrencySymbol() {
    return "R\$ ${replaceAll(RegExp(r'[^\w\s]+'), '')}"
        .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')
        .replaceAll(RegExp(r'\.00'), '')
        .replaceAll(RegExp(r'R\$'), '');
  }

  String currencyBrazilian() {
    return "R\$ ${replaceAll(RegExp(r'[^\w\s]+'), '')}".replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }

  String currencyBrazilianWithDecimal() {
    return "R\$ ${replaceAll(RegExp(r'[^\w\s]+'), '')}"
        .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')
        .replaceAll(RegExp(r'\.00'), '');
  }
}

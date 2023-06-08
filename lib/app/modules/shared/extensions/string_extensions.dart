import 'package:intl/intl.dart';

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

  String stringForDouble() {
    return NumberFormat("0.00", "pt_BR").format(double.parse(this));
  }

  removeWhiteSpaces() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  removeSpecialCharacters() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyCpfMask() {
    return replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'),
        (match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}');
  }

  removeCpfMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyCnpjMask() {
    return replaceAllMapped(
        RegExp(r'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'),
        (match) =>
            '${match[1]}.${match[2]}.${match[3]}/${match[4]}-${match[5]}');
  }

  removeCnpjMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyCepMask() {
    return replaceAllMapped(
        RegExp(r'(\d{5})(\d{3})'), (match) => '${match[1]}-${match[2]}');
  }

  removeCepMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyPhoneMask() {
    return replaceAllMapped(RegExp(r'(\d{2})(\d{4,5})(\d{4})'),
        (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  }

  removePhoneMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyCellPhoneMask() {
    return replaceAllMapped(RegExp(r'(\d{2})(\d{5})(\d{4})'),
        (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  }

  removeCellPhoneMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyDateMask() {
    return replaceAllMapped(RegExp(r'(\d{2})(\d{2})(\d{4})'),
        (match) => '${match[1]}/${match[2]}/${match[3]}');
  }

  removeDateMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyDateTimeMask() {
    return replaceAllMapped(
        RegExp(r'(\d{2})(\d{2})(\d{4})(\d{2})(\d{2})'),
        (match) =>
            '${match[1]}/${match[2]}/${match[3]} ${match[4]}:${match[5]}');
  }

  removeDateTimeMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyTimeMask() {
    return replaceAllMapped(
        RegExp(r'(\d{2})(\d{2})'), (match) => '${match[1]}:${match[2]}');
  }

  removeTimeMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyMoneyMask() {
    return replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }

  removeMoneyMask() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String applyMoneyMaskWithDecimal() {
    return replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }

  removeMoneyMaskWithDecimal() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidCpf() {
    String cpf = removeCpfMask();
    if (cpf.length != 11) return false;

    List<String> invalidCpfs = [
      "00000000000",
      "11111111111",
      "22222222222",
      "33333333333",
      "44444444444",
      "55555555555",
      "66666666666",
      "77777777777",
      "88888888888",
      "99999999999"
    ];

    if (invalidCpfs.contains(cpf)) return false;

    List<int> numbers = cpf
        .split("")
        .map((number) => int.parse(number))
        .toList()
        .getRange(0, 9)
        .toList();

    int firstDigit = int.parse(cpf[9]);
    int secondDigit = int.parse(cpf[10]);

    int firstDigitResult = 0;
    int secondDigitResult = 0;

    for (int i = 0; i < 9; i++) {
      firstDigitResult += numbers[i] * (10 - i);
      secondDigitResult += numbers[i] * (11 - i);
    }

    firstDigitResult = (firstDigitResult * 10) % 11;
    secondDigitResult = (secondDigitResult * 10) % 11;

    if (firstDigitResult == 10) firstDigitResult = 0;
    if (secondDigitResult == 10) secondDigitResult = 0;

    if (firstDigitResult != firstDigit) return false;
    if (secondDigitResult != secondDigit) return false;

    return true;
  }

  bool isValidCnpj() {
    String cnpj = removeCnpjMask();
    if (cnpj.length != 14) return false;

    List<String> invalidCnpjs = [
      "00000000000000",
      "11111111111111",
      "22222222222222",
      "33333333333333",
      "44444444444444",
      "55555555555555",
      "66666666666666",
      "77777777777777",
      "88888888888888",
      "99999999999999"
    ];

    if (invalidCnpjs.contains(cnpj)) return false;

    List<int> numbers = cnpj
        .split("")
        .map((number) => int.parse(number))
        .toList()
        .getRange(0, 12)
        .toList();

    int firstDigit = int.parse(cnpj[12]);
    int secondDigit = int.parse(cnpj[13]);

    int firstDigitResult = 0;
    int secondDigitResult = 0;

    for (int i = 0; i < 12; i++) {
      firstDigitResult += numbers[i] * (6 - (i % 8));
      secondDigitResult += numbers[i] * (7 - (i % 8));
    }

    firstDigitResult = (firstDigitResult % 11);
    secondDigitResult = (secondDigitResult % 11);

    if (firstDigitResult < 2) firstDigitResult = 0;
    if (secondDigitResult < 2) secondDigitResult = 0;

    if (firstDigitResult != firstDigit) return false;
    if (secondDigitResult != secondDigit) return false;

    return true;
  }

  bool isValidPhone() {
    String phone = removePhoneMask();
    if (phone.length != 10) return false;

    List<String> invalidPhones = [
      "0000000000",
      "1111111111",
      "2222222222",
      "3333333333",
      "4444444444",
      "5555555555",
      "6666666666",
      "7777777777",
      "8888888888",
      "9999999999"
    ];

    if (invalidPhones.contains(phone)) return false;

    return true;
  }

  bool isValidCellPhone() {
    String cellPhone = removeCellPhoneMask();
    if (cellPhone.length != 11) return false;

    List<String> invalidCellPhones = [
      "00000000000",
      "11111111111",
      "22222222222",
      "33333333333",
      "44444444444",
      "55555555555",
      "66666666666",
      "77777777777",
      "88888888888",
      "99999999999"
    ];

    if (invalidCellPhones.contains(cellPhone)) return false;

    return true;
  }

  bool isValidCep() {
    String cep = removeCepMask();
    if (cep.length != 8) return false;

    List<String> invalidCeps = [
      "00000000",
      "11111111",
      "22222222",
      "33333333",
      "44444444",
      "55555555",
      "66666666",
      "77777777",
      "88888888",
      "99999999"
    ];

    if (invalidCeps.contains(cep)) return false;

    return true;
  }

  bool isValidDate() {
    String date = this;
    if (date.length != 10) return false;

    List<String> invalidDates = [
      "00000000",
      "11111111",
      "22222222",
      "33333333",
      "44444444",
      "55555555",
      "66666666",
      "77777777",
      "88888888",
      "99999999"
    ];

    if (invalidDates.contains(date)) return false;

    return true;
  }

  bool isValidPassword() {
    String password = this;
    if (password.length < 6) return false;

    return true;
  }

  double currencyToDouble() {
    return double.parse(replaceAll(".", "").replaceAll(",", "."));
  }
}

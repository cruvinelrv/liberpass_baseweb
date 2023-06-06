import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String toCurrencyString() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
        .format(this)
        .replaceAll('R\$', 'R\$ ');
  }

  String toCurrencyStringWithoutSymbol() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: '')
        .format(this)
        .replaceAll('R\$', 'R\$ ');
  }

  String toCurrencyStringWithoutSymbolAndWithDecimalPlaces() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2)
        .format(this)
        .replaceAll('R\$', 'R\$ ');
  }

  String toCurrencyStringWithoutSymbolAndWithDecimalPlacesAndWithComma() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2)
        .format(this)
        .replaceAll('R\$', 'R\$ ')
        .replaceAll('.', ',');
  }

  String
      toCurrencyStringWithoutSymbolAndWithDecimalPlacesAndWithCommaAndWithZero() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2)
        .format(this)
        .replaceAll('R\$', 'R\$ ')
        .replaceAll('.', ',')
        .replaceAll(',00', ',0');
  }

  String
      toCurrencyStringWithoutSymbolAndWithDecimalPlacesAndWithCommaAndWithZeroAndWithSpace() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2)
        .format(this)
        .replaceAll('R\$', 'R\$ ')
        .replaceAll('.', ',')
        .replaceAll(',00', ',0')
        .replaceAll(',0', ', 0');
  }

  String
      toCurrencyStringWithoutSymbolAndWithDecimalPlacesAndWithCommaAndWithZeroAndWithSpaceAndWithThousand() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2)
        .format(this)
        .replaceAll('R\$', 'R\$ ')
        .replaceAll('.', ',')
        .replaceAll(',00', ',0')
        .replaceAll(',0', ', 0')
        .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');
  }
}

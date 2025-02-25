import 'package:easy_mask/easy_mask.dart';

class InputMasks {
  static TextInputMask dateMask() => TextInputMask(mask: '99/99/9999');
  static TextInputMask phoneMask() => TextInputMask(mask: '(99) 99999-9999');
  static TextInputMask cpfMask() => TextInputMask(mask: '999.999.999-99');
  static TextInputMask cnpjMask() => TextInputMask(mask: '99.999.999/9999-99');
  static TextInputMask cepMask() => TextInputMask(mask: '99999-999');
}

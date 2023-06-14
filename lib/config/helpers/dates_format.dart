import 'package:intl/intl.dart';

class DatesFormats{

  static String number(double number){

    final formaterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formaterNumber;
  }
}
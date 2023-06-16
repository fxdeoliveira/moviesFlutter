import 'package:intl/intl.dart';

class DatesFormats{

  static String number(double number, [int decimals = 0]){

    final formaterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formaterNumber;
  }



}
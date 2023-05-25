import 'package:intl/intl.dart';

extension StringFormatUtil on String {
  String toIdr() {
    var value = double.parse(this);
    var formatter = NumberFormat.currency(
        locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0);
    return formatter.format(value);
  }
}

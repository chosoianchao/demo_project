import 'package:intl/intl.dart';

class Utils {
  static String formatNumber(int number) {
    var formatter = NumberFormat('###,###');
    return formatter.format(number);
  }
}

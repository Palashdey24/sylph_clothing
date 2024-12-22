import 'package:intl/intl.dart';

class AppString {
  static const String kAppName = "Sylph Clothing";
  /*static const String kMapApi = "AIzaSyCweFD2YQ0_nq8ir8mKp9tUhu-vZFfkRxM";*/
  static const int kDurationMiSec = 500;

  static const String mapKey = 'AIzaSyCweFD2YQ0_nq8ir8mKp9tUhu-vZFfkRxM';

  static final dateFormtter = DateFormat.yMMMEd();

  String formatedDate(DateTime date) {
    return dateFormtter.format(date);
  }
}

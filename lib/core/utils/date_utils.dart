import 'package:intl/intl.dart';

const String dMMMyyyySpacePattern = 'd MMM yyyy';
const String dMMMyyyySpaceWithTimePattern = 'd MMM yyyy HH:MM';
const String dMMMMyyyySpacePattern = 'd MMMM yyyy';
const String mmmmyySpacePattern = 'MMMM yyyy';
const String yyyyMMddStripePattern = 'yyyy-MM-dd';
const String yyyyddMMStripePattern = 'yyyy-dd-MM';

extension DateTimeExtension on DateTime {
  String formatToString(String locale, String pattern) {
    return DateFormat(pattern, locale).format(this);
  }

  Duration? getDifferenceFromNowToDate() {
    return DateTime.now().difference(this);
  }
}

extension StringDateExtension on String {
  DateTime formatToDateTime(String locale, String pattern) {
    return DateFormat(pattern, locale).parse(this);
  }
}

extension DateTimeExtensions on DateTime {
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }
}

extension ProgressMonthExstention on DateTime {
  String getFullProgressMonth() {
    final String formattedDate = DateFormat('MMMM yyyy', 'id').format(this);
    return formattedDate;
  }

  String getProgressMonth() {
    final String formattedDate = DateFormat('MMM yyyy', 'id').format(this);
    return formattedDate;
  }

  String getTargetMonth() {
    final String formattedDate = DateFormat('MMMM yyyy', 'id').format(this);
    return formattedDate;
  }

  String getMonth() {
    final String formattedDate = DateFormat('MMM', 'id').format(this);
    return formattedDate;
  }
}

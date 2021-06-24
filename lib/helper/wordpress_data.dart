import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String wordpressDate(date) {
  DateTime dateTime = DateTime.parse(date);
  try {
    return timeago.format(dateTime, allowFromNow: true, locale: 'en');
  } catch (_) {
    String dateFormat = DateFormat('dd.MM.yyyy').format(dateTime);
    return dateFormat;
  }
}

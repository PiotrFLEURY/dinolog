import 'package:intl/intl.dart';

const rfc3339Format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
final DateFormat _dateFormat = DateFormat(rfc3339Format);

String formatRfc3339DateTime(DateTime dateTime) {
  if (dateTime.isUtc) {
    return _dateFormat.format(dateTime);
  }
  return _dateFormat.format(dateTime.toUtc());
}

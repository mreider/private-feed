import 'package:intl/intl.dart';

class Helper {
  bool isEmailFormatted({required String email}) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

extension DateTimeFormatter on DateTime {
  String format() {
    final day = this.day.toString().padLeft(2, '0');
    final hour = this.hour > 12 ? this.hour - 12 : this.hour;
    final hourPad = hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    final amPm = this.hour > 12 ? 'PM' : 'AM';
    final monthName = DateFormat.MMMM().format(this).substring(0, 3);

    return "$monthName $day, $hourPad:$minute $amPm";
  }
}

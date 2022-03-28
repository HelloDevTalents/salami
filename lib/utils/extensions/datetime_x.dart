import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// Returns String in format `HH:mm` from DateTime
  ///
  /// example `17:08`
  String get toHm => DateFormat.Hm().format(this);

  /// Returns String in format `HH:mm AM/PM` from DateTime
  ///
  /// example `5:08 PM`
  ///
  /// note that this doesn't add 0 for hours in US locale
  /// like `.toHm` does
  String get toHjm => DateFormat.jm().format(this);

  /// Returns String in format `dd/mm/yyyy` from DateTime
  ///
  /// example `7/10/1996`
  String get toDMYY => DateFormat.yMd().format(this);

  /// Returns String in format `montName dd, yyyy` from DateTime
  ///
  /// example for US `July 10, 1996`
  String get toDDMMYYYY => DateFormat.yMMMMd().format(this);

  /// Returns String in format mm/dd from DateTime
  ///
  /// example for US `5/25`
  /// example for PL `25.05`
  String get toDM => DateFormat.Md().format(this);
}

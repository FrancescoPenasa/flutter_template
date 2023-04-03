import 'package:intl/intl.dart';


/// if parse dont work return 0
double parseDouble(String s) {
  return double.tryParse(s.replaceAll(',', '.')) ?? 0.0;
}

/// if parse dont work return 0
int parseInt(String s) {
  return (double.tryParse(s.replaceAll(',', '.')) ?? 0).floor();
}

/// if parse dont work return 0
String parseData(String s) {
  try {
    final DateFormat inFormat = DateFormat('yyyy-MM-dd');
    DateTime date = inFormat.parse(s);

    final DateFormat outFormat = DateFormat('dd/MM/yyyy');
    return outFormat.format(date);
  } catch (error) {
    throw const FormatException();
  }
}


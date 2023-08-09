
import '../helper_methods.dart';

extension EnumTimeExtension on Enum {
  String getString() => enumToString(this).toUpperCase();
  int getIndex() => index;
}

// ignore_for_file: no_default_cases

import '../schemas/moon_high_way/generated/moon_high_way.schema.graphql.dart';

extension EnumExtension on EnumLiftStatus {
  String get toEnumString {
    switch (this) {
      case EnumLiftStatus.OPEN:
        return 'OPEN';
      case EnumLiftStatus.CLOSED:
        return 'CLOSED';
      case EnumLiftStatus.HOLD:
        return 'HOLD';
      default:
        return '';
    }
  }
}

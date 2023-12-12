class CustomDateTime {
  const CustomDateTime({required this.dateTime});

  final DateTime dateTime;
}

CustomDateTime customDateTimeFromJson(dynamic data) =>
    CustomDateTime(dateTime: DateTime.parse(data as String));

dynamic customDateTimeToJson(CustomDateTime time) =>
    time.dateTime.toIso8601String();

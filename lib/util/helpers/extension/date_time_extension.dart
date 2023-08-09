part of et_app_util;

extension DateTimeExtension on DateTime? {
  List<int> getAllDays() =>
      List<int>.generate(totalDaysInMonth(), (i) => i + 1);

  bool isEqualTo(DateTime? dateTime) => this == dateTime;

  List<DateTime> getAllDaysDateTime() => this == null
      ? <DateTime>[]
      : List<DateTime>.generate(
          totalDaysInMonth(),
          (i) => DateTime(this!.year, this!.month, i + 1),
        );

  int totalDaysInMonth() {
    if (this == null) return 0;
    var firstDayOfCurrentMonth = DateTime.utc(this!.year, this!.month, 1);
    var firstDayNextMonth = DateTime.utc(
        firstDayOfCurrentMonth.year, firstDayOfCurrentMonth.month + 1, 1);
    return firstDayNextMonth.difference(firstDayOfCurrentMonth).inDays;
  }
}

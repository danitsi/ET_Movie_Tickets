
extension ExceptionExtension on Object {
  Future<Object> logAsync(StackTrace? stackTrace) async {
    if (runtimeType == Exception) {
      //await FirebaseCrashlytics.instance.recordError(this, stackTrace);
    }
    return this;
  }

  Object log(StackTrace? stackTrace) async {
    if (runtimeType == Exception) {
      //FirebaseCrashlytics.instance.recordError(this, stackTrace);
    }
    return this;
  }
}

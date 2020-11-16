abstract class FailureSearch implements Exception{
  final dynamic message;
  FailureSearch({this.message});
}

class InvalidTextError implements FailureSearch{
  @override
  final dynamic message;
  InvalidTextError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "InvalidTextError";
    return "InvalidTextError: $message";
  }
}

class DataSourceError implements FailureSearch{
  @override
  final dynamic message;
  DataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "DataSourceError";
    return "DataSourceError: $message";
  }
}
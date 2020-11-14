abstract class FailureSearch implements Exception{}

class InvalidTextError implements FailureSearch{
  final dynamic message;
  InvalidTextError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "InvalidTextError";
    return "InvalidTextError: $message";
  }
}

class DataSourceError implements FailureSearch{
  final dynamic message;
  DataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "DataSourceError";
    return "DataSourceError: $message";
  }
}
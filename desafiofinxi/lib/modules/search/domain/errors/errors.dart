abstract class FailureSearch implements Exception{
  final dynamic message;
  FailureSearch({this.message});
}

class InvalidEntityError implements FailureSearch{
  @override
  final dynamic message;
  InvalidEntityError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "InvalidGifError";
    return "InvalidGifError: $message";
  }
}

class DeleteGifError implements FailureSearch{
  @override
  final dynamic message;
  DeleteGifError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "InvalidGifError";
    return "InvalidGifError: $message";
  }
}

class DeleteGifDataSourceError implements FailureSearch{
  @override
  final dynamic message;
  DeleteGifDataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "InvalidGifError";
    return "InvalidGifError: $message";
  }
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
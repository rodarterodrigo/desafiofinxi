abstract class FailureView implements Exception{}

class IndexError implements FailureView{
  final dynamic message;
  IndexError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "IndexError";
    return "IndexError: $message";
  }
}
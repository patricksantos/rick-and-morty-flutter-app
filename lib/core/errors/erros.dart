class Failure implements Exception {}

class ErrorApi extends Failure {
  final String message;

  ErrorApi(this.message);
}

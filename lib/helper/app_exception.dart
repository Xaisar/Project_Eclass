class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error during communication");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "invalid requst");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "unauthorised");
}

class UnprocessableException extends AppException {
  UnprocessableException([message]) : super(message, "unprocessable entity");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid Input");
}

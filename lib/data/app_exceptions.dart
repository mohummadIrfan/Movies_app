class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchException extends AppException {
  FetchException([String? message])
      : super(message, "Error During Communications");
}

class BadException extends AppException {
  BadException([String? message]) : super(message, "Network Error");
}

class AuthenticationException extends AppException {
  AuthenticationException([String? message])
      : super(message, "Authentication Error");
}

class InputException extends AppException {
  InputException([String? message]) : super(message, "Input Error");
}

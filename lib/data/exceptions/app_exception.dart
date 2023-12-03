class AppException implements Exception{
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString(){
    return '$prefix $message';
  }
}

class FetchException extends AppException{
  FetchException([ String? message]) : super(message!, 'Error fetching Data');

}

class BadException extends AppException{
  BadException([String? message]) : super(message!, 'Invalid request');
}

class UnAuthorisedException extends AppException{
  UnAuthorisedException([String? message]) : super(message!, 'UnAuthorised request');
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message!, 'Invalid Input Exception');
}


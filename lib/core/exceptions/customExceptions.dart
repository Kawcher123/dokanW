
abstract class Failure {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message) : super([message]);
}

class CacheFailure  extends Failure {
  final String message;

  CacheFailure(this.message) : super([message]);
}



class BadRequestFailure extends Failure {
  final String message;

  BadRequestFailure(this.message) : super([message]);
}

class UnauthorisedFailure extends Failure {
  final String message;

  UnauthorisedFailure(this.message) : super([message]);
}

class InvalidInputFailure extends Failure {
  final String message;

  InvalidInputFailure(this.message) : super([message]);
}

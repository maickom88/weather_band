class Failure implements Exception {
  String get message => message;
}

class ServerError extends Failure {
  String get message => 'Unexpected error';
}

class NotAuthorized extends Failure {
  String get message => 'Unauthorized requisition ';
}

class NotFound extends Failure {
  String get message => 'Not found';
}

class NoContent extends Failure {
  String get message => 'No content';
}

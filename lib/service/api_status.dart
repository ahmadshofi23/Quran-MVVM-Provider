class Success {
  int? code;
  Object? response;
  String? status;
  Success({this.code, this.status, this.response});
}

class Failure {
  int? code;
  String? errorResponse;
  String? status;
  Failure({this.code, this.status, this.errorResponse});
}

import 'custom_error.dart';

enum Status {
  success,
  error,
}

class Result<T> {
  Status? status;
  T? data;
  CustomError? error;
  Map<String, String>? errors;

  Result.success(this.data){
    status=Status.success;
  }
  

  Result.error({
    String ?title,
    String ?message,
    int code = 0,
    CustomError ?error,
  }) {
    status = Status.error;
    this.error = error ??
        CustomError(
          code: code,
          title: title,
          message: message,
        );
    errors = {};
  }

  Result.errors(this.errors) {
    status = Status.error;
  }
}

class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.idle() : status = Status.IDLE;
  ApiResponse.loading({this.message}) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.support(this.message) : status = Status.SUPPORT;
  ApiResponse.notFound(this.message) : status = Status.NOT_FOUND;
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

  bool isSuccessResponseWithBody() {
    return status == Status.SUCCESS && data != null;
  }

  bool isSuccessResponse() {
    return status == Status.SUCCESS;
  }
}

enum Status {
  IDLE,
  LOADING,
  SUCCESS,
  ERROR,
  SUPPORT,
  NOT_FOUND,
}

extension StatusExtension on Status {
  String get name {
    switch (this) {
      case Status.IDLE:
        return "IDLE";
      case Status.LOADING:
        return "LOADING";
        case Status.SUCCESS:
        return "Success";
        case Status.ERROR:
        return "Error";
        case Status.SUPPORT:
        return "SUPPORT";
        case Status.NOT_FOUND:
        return "NOT_FOUND";
      default:
        return "N/A";
    }
  }
}
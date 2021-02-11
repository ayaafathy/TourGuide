class HttpException implements Exception {
  HttpException(this.msg);
  final String msg;

  @override
  String toString() {
    return msg;
  }
}

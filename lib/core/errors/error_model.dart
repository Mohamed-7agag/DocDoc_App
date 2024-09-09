class ErrorModel {
  final int code;
  final String message;

  ErrorModel({required this.code, required this.message});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      message: jsonData["message"],
      code: jsonData["code"],
    );
  }
}

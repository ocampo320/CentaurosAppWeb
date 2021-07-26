class CustomError {
  final int? code;
  final String? title;
  final String? message;

  const CustomError({
    this.code = 0,
    this.title,
    this.message,
  });
}

// ignore_for_file: constant_identifier_names

enum AppError { NOT_FOUND, ERROR_DETECTED, NO_INTERNET, SERVER_ERROR }

class MyError {
  final AppError key;
  final String? message;

  const MyError({
    required this.key,
    this.message,
  });
}

import 'dart:io';

/// Get message from an exeption
///
/// get the message from passed exception
String getMessageFromException(dynamic e) {
  String result = e.toString();

  if (e is ServerExceptionWithMessage) {
    result = e.message;
  }

  if (e is HttpException) {
    result = e.message;
  }

  if (e is CubitException) {
    result = e.message;
  }

  if (e is BlocException) {
    result = e.message;
  }

  if (e is RepositoryException) {
    result = e.message;
  }

  if (e is UseCaseException) {
    result = e.message;
  }

  if (e is DataSourceException) {
    result = e.message;
  }

  if (e is UnknownException) {
    result = e.message;
  }

  return result;
}

String getStackFromException(dynamic e) {
  String result = e.toString();

  if (e is ServerExceptionWithMessage) {
    result = e.message;
  }

  if (e is HttpException) {
    result = e.message;
  }

  if (e is CubitException) {
    result = e.message;
  }

  if (e is BlocException) {
    result = e.message;
  }

  if (e is RepositoryException) {
    result = e.message;
  }

  if (e is UseCaseException) {
    result = e.message;
  }

  if (e is DataSourceException) {
    result = e.stack;
  }

  if (e is UnknownException) {
    result = e.message;
  }

  return result;
}

class ServerException implements Exception {}

/// Server Exception With Message
class ServerExceptionWithMessage implements Exception {
  final String message;
  ServerExceptionWithMessage({
    required this.message,
  });
}

/// Cubit Exception
class CubitException implements Exception {
  final String message;
  CubitException({
    required this.message,
  });
}

/// Bloc Exception
class BlocException implements Exception {
  final String message;
  BlocException({
    required this.message,
  });
}

/// Repository Exception
class RepositoryException implements Exception {
  final String message;
  RepositoryException({
    required this.message,
  });
}

/// UseCase Exception
class UseCaseException implements Exception {
  final String message;
  UseCaseException({
    required this.message,
  });
}

class DataSourceException implements Exception {
  final String message;
  final String stack;
  DataSourceException({
    required this.message,
    required this.stack,
  });
}

class EntityException implements Exception {
  final String message;
  EntityException({
    required this.message,
  });
}

class UnknownException implements Exception {
  final String message;
  UnknownException({
    required this.message,
  });
}

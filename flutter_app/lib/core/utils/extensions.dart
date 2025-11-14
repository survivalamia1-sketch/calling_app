import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import '../error/failures.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R getRight() => (this as Right<L, R>).value;
  L getLeft() => (this as Left<L, R>).value;

  Widget when({
    required Widget Function(L failure) left,
    required Widget Function(R data) right,
  }) {
    return fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }
}

extension FailureExtension on Failure {
  String get errorMessage => message;
}

extension DateTimeExtension on DateTime {
  String get formattedDate {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }

  String get formattedDateTime {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeAll {
    return split(' ').map((word) => word.capitalize).join(' ');
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  void showErrorSnackBar(String message) {
    showSnackBar(message, isError: true);
  }

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

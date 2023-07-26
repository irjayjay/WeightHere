// ignore_for_file: constant_identifier_names
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:weight_here/common/widgets/modals/snackbar.dart';

enum ErrorTypes {
  NotFound,
  AccountExists, // Auth account exists
  EmailInvalid, // Formatting of auth email invalid.
  PasswordLength, // Auth password too short.
  DeleteImpossible, // Can't delete record.
  CreateImpossible, // Can't create record.
  UpdateImpossible, // Can't update record.
}

/// Domain error class.
class AppError {
  final ErrorTypes error;
  final String? message;

  AppError({required this.error, this.message});
}

typedef EitherExt<T> = Either<AppError, T>;

/// Print the error message if [Left], else do [ifRight].
extension EitherExtension<T> on EitherExt<T> {
  leftElseRight(BuildContext context, [void Function(T right)? ifRight]) {
    either(
      (left) {
        if (left.message != null) {
          SimpleTextSnackbar().call(context, left.message!);
        }
      },
      (right) => ifRight?.call(right),
    );
  }
}

typedef EitherFuture<T> = Future<EitherExt<T>>;

/// Print the error message if [Left], else do [ifRight].
extension EitherFutureExtension<T> on EitherFuture<T> {
  leftElseRight(BuildContext context, [void Function(T right)? ifRight]) {
    either(
      (left) {
        if (left.message != null) {
          SimpleTextSnackbar().call(context, left.message!);
        }
      },
      (right) => ifRight?.call(right),
    );
  }
}

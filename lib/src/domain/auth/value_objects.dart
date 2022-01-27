import 'package:dartz/dartz.dart';
import 'package:expense_tracker/src/domain/core/error/value_failure.dart';
import 'package:expense_tracker/src/domain/core/value_object.dart';
import 'package:expense_tracker/src/domain/core/valur_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

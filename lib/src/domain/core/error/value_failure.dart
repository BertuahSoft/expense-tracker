import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  // @Implements<Failure>()
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;

  const factory ValueFailure.multiline({required T failedValue}) = Multiline<T>;
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
}

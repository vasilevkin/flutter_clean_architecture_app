import 'package:dartz/dartz.dart';
import '../error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String source) {
    try {
      final integer = int.parse(source);
      if (integer < 0) {
        throw FormatException();
      }
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}

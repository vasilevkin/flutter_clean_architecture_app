// @dart=2.9
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_app/core/error/failures.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}

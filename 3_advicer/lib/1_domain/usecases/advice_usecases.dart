import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  /// Get data from Repository layer.
  ///
  /// Then proceed business logic here.
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return right(const AdviceEntity(id: 0, advice: "You got a new advice"));
    // return left(ServerFailure());
  }
}

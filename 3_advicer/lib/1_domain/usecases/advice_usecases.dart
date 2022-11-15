import 'package:advicer/1_domain/entities/advice_entity.dart';

class AdviceUseCases {
  /// Get data from Repository layer.
  ///
  /// Then proceed business logic here.
  Future<AdviceEntity> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return const AdviceEntity(id: 0, advice: "You got a new advice");
  }
}

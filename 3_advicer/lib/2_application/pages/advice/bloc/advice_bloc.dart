import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  // Import multi use cases if needed
  final AdviceUseCases adviceUseCases;

  AdviceBloc({required this.adviceUseCases}) : super(AdviceInitial()) {
    // Handle BLoC events
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceLoadingState());
      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
          (failure) =>
              emit(AdviceErrorState(message: _mapFailuresToMessage(failure))),
          (advice) => emit(AdviceLoadedState(advice: advice.advice)));
    });

    on<AdviceEvent>((event, emit) {});
  }

  /// Filter Failure to show the corresponding msg
  String _mapFailuresToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Network error...";
      case CacheFailure:
        return "Failed to get cache..";
      default:
        return "Something's wrong..";
    }
  }
}

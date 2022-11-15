import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    // Import multi use cases if needed
    final AdviceUseCases adviceUseCases = AdviceUseCases();

    // Handle BLoC events
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceLoadingState());
      final advice = await adviceUseCases.getAdvice();
      emit(AdviceLoadedState(advice: advice.advice));
    });

    on<AdviceEvent>((event, emit) {});
  }
}

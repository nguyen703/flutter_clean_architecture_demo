part of 'advice_bloc.dart';

@immutable
abstract class AdviceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceInitial extends AdviceState {}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  AdviceLoadedState({required this.advice});

  final String advice;

  @override
  List<Object?> get props => [advice];
}

class AdviceErrorState extends AdviceState {
  AdviceErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

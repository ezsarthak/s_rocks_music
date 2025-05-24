part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class SuccessState extends HomeActionState {
  final List<MusicServiceModel> services;
  SuccessState(this.services);
}

class ErrorState extends HomeActionState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
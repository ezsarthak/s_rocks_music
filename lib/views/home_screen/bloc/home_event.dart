part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class SucsessEvent extends HomeEvent {
  final List<MusicServiceModel> services;
  SucsessEvent(this.services);
}

class ErrorEvent extends HomeEvent {
  final String errorMessage;
  ErrorEvent(this.errorMessage);
}

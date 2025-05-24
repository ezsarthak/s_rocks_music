import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta/meta.dart';
import 'package:s_rocks_music/data/models/failure.dart';
import 'package:s_rocks_music/data/models/music_service_model.dart';
import 'package:s_rocks_music/viewmodels/home_viewmodel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeViewmodel _homeViewmodel = HomeViewmodel();
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<SucsessEvent>(successEvent);
    on<ErrorEvent>(errorEvent);
  }
  void homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    await emit.forEach<Either<Failure, List<MusicServiceModel>>>(
      _homeViewmodel.getMusicServices(),
      onData:
          (either) =>
              either.fold((l) => ErrorState(l.message), (r) => SuccessState(r)),
      onError: (error, stackTrace) => ErrorState(error.toString()),
    );
  }

  void successEvent(SucsessEvent event, Emitter<HomeState> emit) {
    emit(SuccessState(event.services));
  }

  void errorEvent(ErrorEvent event, Emitter<HomeState> emit) {
    emit(ErrorState(event.errorMessage));
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:s_rocks_music/data/models/failure.dart';
import 'package:s_rocks_music/data/models/music_service_model.dart';
import 'package:s_rocks_music/core/services/database_service.dart';

class HomeViewmodel {
  final DatabaseService _databaseService = DatabaseService();

  Stream<Either<Failure, List<MusicServiceModel>>> getMusicServices() {
    return _databaseService.getMusicServices().map((snapshot) {
      try {
        if (snapshot.docs.isEmpty || snapshot.hashCode == 0) {
          return Left(Failure('No music services available'));
        }
        List<MusicServiceModel> musicServices =
            snapshot.docs.map((doc) => doc.data()).toList();
        return Right(musicServices);
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    });
  }
}

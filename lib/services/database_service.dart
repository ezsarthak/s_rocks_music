import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s_rocks_music/models/music_service_model.dart';

const String musicServiceRef = 'music_services';

class DatabaseService {
  final _firestrore = FirebaseFirestore.instance;

  late final CollectionReference<MusicServiceModel> _musicServicesCollection;
  DatabaseService() {
    _musicServicesCollection = _firestrore
        .collection(musicServiceRef)
        .withConverter<MusicServiceModel>(
          fromFirestore:
              (snapshot, _) => MusicServiceModel.fromJson(snapshot.data()!),
          toFirestore: (_, __) {
            return {};
          },
        );
  }

  Stream<QuerySnapshot<MusicServiceModel>>  getMusicServices() {
    return _musicServicesCollection.snapshots();
  }
}

import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:informasi_akademik_firebase/models/mapel.dart';

class MapelProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _mapelId;
  String _kodeMapel;
  String _mataPelajaran;
  String _pengajar;
  var uuid = Uuid();

  //Getters
  String get kodeMapel => _kodeMapel;
  String get mataPelajaran => _mataPelajaran;
  String get pengajar => _pengajar;

  //Setters
  changeKodeMapel(String value) {
    _kodeMapel = value;
    notifyListeners();
  }

  changeMataPelajaran(String value) {
    _mataPelajaran = value;
    notifyListeners();
  }

  changePengajar(String value) {
    _pengajar = value;
    notifyListeners();
  }

  //read
  loadValues(Mapel mapel) {
    _mapelId = mapel.mapelId;
    _kodeMapel = mapel.kodeMapel;
    _mataPelajaran = mapel.mataPelajaran;
    _pengajar = mapel.pengajar;
  }

  //create/update
  saveMapel() {
    print(_mapelId);
    if (_mapelId == null) {
      var newMapel = Mapel(
        mapelId: uuid.v4(),
        kodeMapel: kodeMapel,
        mataPelajaran: mataPelajaran,
        pengajar: pengajar,
      );
      firestoreService.saveMapel(newMapel);
    } else {
      //Update
      var updatedMapel = Mapel(
        mapelId: _mapelId,
        kodeMapel: _kodeMapel,
        mataPelajaran: _mataPelajaran,
        pengajar: _pengajar,
      );
      firestoreService.saveMapel(updatedMapel);
    }
  }

  //delete
  removeMapel(String mapelId) {
    firestoreService.removeMapel(mapelId);
  }
}

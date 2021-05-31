import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:informasi_akademik_firebase/models/siswa.dart';

class SiswaProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _siswaId;
  int _nim;
  String _namaSiswa;
  String _jenisKelamin;
  var uuid = Uuid();

  //Getters
  int get nim => _nim;
  String get namaSiswa => _namaSiswa;
  String get jenisKelamin => _jenisKelamin;

  //Setters
  changeNim(String value) {
    _nim = int.parse(value);
    notifyListeners();
  }

  changeNamaSiswa(String value) {
    _namaSiswa = value;
    notifyListeners();
  }

  changeJenisKelamin(String value) {
    _jenisKelamin = value;
    notifyListeners();
  }

  //read
  loadValues(Siswa siswa) {
    _nim = siswa.nim;
    _namaSiswa = siswa.namaSiswa;
    _jenisKelamin = siswa.jenisKelamin;
  }

//create/update
  saveSiswa() {
    print(_siswaId);
    if (_siswaId == null) {
      var newSiswa = Siswa(
          nim: nim,
          namaSiswa: namaSiswa,
          jenisKelamin: jenisKelamin,
          siswaId: uuid.v4());
      firestoreService.saveSiswa(newSiswa);
    } else {
      //Update
      var updatedSiswa = Siswa(
          nim: nim,
          namaSiswa: namaSiswa,
          jenisKelamin: jenisKelamin,
          siswaId: _siswaId);
      firestoreService.saveSiswa(updatedSiswa);
    }
  }

//delete
  removeSiswa(String siswaId) {
    firestoreService.removeSiswa(siswaId);
  }
}

import 'package:flutter/material.dart';
import 'package:informasi_akademik_firebase/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:informasi_akademik_firebase/models/siswa.dart';
import 'package:informasi_akademik_firebase/services/sign_in.dart';

class SiswaProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _siswaId;
  int _nim;
  String _namaSiswa;
  String _jenisKelamin;
  String _dataUser;
  var uuid = Uuid();

  //Getters
  String get siswaId => _siswaId;
  int get nim => _nim;
  String get namaSiswa => _namaSiswa;
  String get jenisKelamin => _jenisKelamin;
  String get dataUser => _dataUser;

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

  changeDataUser() {
    _dataUser = currentUsers;
    notifyListeners();
  }

  //read
  loadValues(Siswa siswa) {
    _siswaId = siswa.siswaId;
    _nim = siswa.nim;
    _namaSiswa = siswa.namaSiswa;
    _jenisKelamin = siswa.jenisKelamin;
    _dataUser = siswa.dataUser;
  }

  //create/update
  saveSiswa() {
    print(_siswaId);
    if (_siswaId == null) {
      var newSiswa = Siswa(
        siswaId: uuid.v4(),
        nim: nim,
        namaSiswa: namaSiswa,
        jenisKelamin: jenisKelamin,
        dataUser: currentUsers,
      );
      firestoreService.saveSiswa(newSiswa);
    } else {
      //Update
      var updatedSiswa = Siswa(
        siswaId: _siswaId,
        nim: _nim,
        namaSiswa: _namaSiswa,
        jenisKelamin: _jenisKelamin,
        dataUser: _dataUser,
      );
      firestoreService.saveSiswa(updatedSiswa);
    }
  }

  //delete
  removeSiswa(String siswaId) {
    firestoreService.removeSiswa(siswaId);
  }
}

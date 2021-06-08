class Siswa {
  final String siswaId;
  final int nim;
  final String namaSiswa;
  final String jenisKelamin;
  final String dataUser;

  Siswa({
    this.siswaId,
    this.nim,
    this.namaSiswa,
    this.jenisKelamin,
    this.dataUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'siswaId': siswaId,
      'nim': nim,
      'namaSiswa': namaSiswa,
      'jenisKelamin': jenisKelamin,
      'dataUser': dataUser,
    };
  }

  Siswa.fromFirestore(Map<String, dynamic> firestore)
      : siswaId = firestore['siswaId'],
        nim = firestore['nim'],
        namaSiswa = firestore['namaSiswa'],
        jenisKelamin = firestore['jenisKelamin'],
        dataUser = firestore['dataUser'];
}

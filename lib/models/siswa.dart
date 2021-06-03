class Siswa {
  final String siswaId;
  final int nim;
  final String namaSiswa;
  final String jenisKelamin;

  Siswa({
    this.siswaId,
    this.nim,
    this.namaSiswa,
    this.jenisKelamin,
  });

  Map<String, dynamic> toMap() {
    return {
      'siswaId': siswaId,
      'nim': nim,
      'namaSiswa': namaSiswa,
      'jenisKelamin': jenisKelamin,
    };
  }

  Siswa.fromFirestore(Map<String, dynamic> firestore)
      : siswaId = firestore['siswaId'],
        nim = firestore['nim'],
        namaSiswa = firestore['namaSiswa'],
        jenisKelamin = firestore['jenisKelamin'];
}

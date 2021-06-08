class Mapel {
  final String mapelId;
  final String kodeMapel;
  final String mataPelajaran;
  final String pengajar;
  final String dataUser;

  Mapel({
    this.mapelId,
    this.kodeMapel,
    this.mataPelajaran,
    this.pengajar,
    this.dataUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'mapelId': mapelId,
      'kodeMapel': kodeMapel,
      'mataPelajaran': mataPelajaran,
      'pengajar': pengajar,
      'dataUser': dataUser,
    };
  }

  Mapel.fromFirestore(Map<String, dynamic> firestore)
      : mapelId = firestore['mapelId'],
        kodeMapel = firestore['kodeMapel'],
        mataPelajaran = firestore['mataPelajaran'],
        pengajar = firestore['pengajar'],
        dataUser = firestore['dataUser'];
}

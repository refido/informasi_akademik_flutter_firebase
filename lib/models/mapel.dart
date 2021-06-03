class Mapel {
  final String mapelId;
  final String kodeMapel;
  final String mataPelajaran;
  final String pengajar;

  Mapel({
    this.mapelId,
    this.kodeMapel,
    this.mataPelajaran,
    this.pengajar,
  });

  Map<String, dynamic> toMap() {
    return {
      'mapelId': mapelId,
      'kodeMapel': kodeMapel,
      'mataPelajaran': mataPelajaran,
      'pengajar': pengajar,
    };
  }

  Mapel.fromFirestore(Map<String, dynamic> firestore)
      : mapelId = firestore['mapelId'],
        kodeMapel = firestore['kodeMapel'],
        mataPelajaran = firestore['mataPelajaran'],
        pengajar = firestore['pengajar'];
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:informasi_akademik_firebase/models/mapel.dart';
import 'package:informasi_akademik_firebase/models/product.dart';
import 'package:informasi_akademik_firebase/models/siswa.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //siswa
  Future<void> saveSiswa(Siswa siswa) {
    return _db.collection('siswas').doc(siswa.siswaId).set(siswa.toMap());
  }

  Stream<List<Siswa>> getSiswas() {
    return _db.collection('siswas').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Siswa.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeSiswa(String siswaId) {
    return _db.collection('siswas').doc(siswaId).delete();
  }

  //mapel
  Future<void> saveMapel(Mapel mapel) {
    return _db.collection('mapels').doc(mapel.mapelId).set(mapel.toMap());
  }

  Stream<List<Mapel>> getMapels() {
    return _db.collection('mapels').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Mapel.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeMapel(String mapelId) {
    return _db.collection('mapels').doc(mapelId).delete();
  }

  //product
  Future<void> saveProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.productId)
        .set(product.toMap());
  }

  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Product.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeProduct(String productId) {
    return _db.collection('products').doc(productId).delete();
  }
}

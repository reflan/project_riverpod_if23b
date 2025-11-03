import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/legacy.dart';

class MahasiswaNotifier extends StateNotifier<List<DocumentSnapshot>> {
  MahasiswaNotifier() : super([]);

  Stream<List<DocumentSnapshot>> streamData() {
    return FirebaseFirestore.instance
        .collection('mahasiswa')
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }
}

final MahasiswaProvider =
    StateNotifierProvider<MahasiswaNotifier, List<DocumentSnapshot>>(
      (ref) => MahasiswaNotifier(),
    );

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Simplified wrapper for Firestore.
class FirestoreService {
  final db = FirebaseFirestore.instance;

  Future<void> deleteDoc(String id, String path) {
    return db.collection(path).doc(id).delete().onError((e, _) {
      debugPrint("Error deleting document: $e");
    });
  }

  Future<void> createDoc(String path, Map<String, dynamic> doc) async {
    await db.collection(path).add(doc).then(
      (value) => value,
      onError: (e) {
        debugPrint("Error creating document: $e");
      },
    );
  }

  Future<void> updateDoc(String path, String id, Map<String, dynamic> doc) {
    return db.collection(path).doc(id).update(doc).onError((e, _) {
      debugPrint("Error updating document: $e");
    });
  }

  Future<List<Map<String, dynamic>>> readDocs(String path) async {
    return getSnapshots(path).then((list) {
      return list.map((doc) => doc.data()).toList();
    });
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSnapshots(
    String path,
  ) async {
    final snapshot = db.collection(path).get();
    return snapshot.then(
      (snapshot) => snapshot.docs,
      onError: (e) {
        debugPrint("Error reading documents: $e");
      },
    );
  }

  Stream<List<Map<String, dynamic>>> docStream(String path) {
    return db
        .collection(path)
        .snapshots()
        .asBroadcastStream()
        .map((event) {
          return event.docs.map((doc) => doc.data()).toList();
        })
        .asBroadcastStream()
        .handleError((e) {
          debugPrint("Error fetching stream: $e");
        });
  }

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapshotStream(
      String path) {
    return db.collection(path).snapshots().map((event) {
      return event.docs;
    }).handleError((e) {
      debugPrint("Error fetching stream: $e");
    });
  }
}

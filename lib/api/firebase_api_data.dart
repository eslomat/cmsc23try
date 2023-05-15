import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addData(Map<String, dynamic> data) async {
    try {
      final docRef = await db.collection("data").add(data);
      await db.collection("data").doc(docRef.id).update({'id': docRef.id});

      return "Successfully added data!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Stream<QuerySnapshot> getAllData() {
    return db.collection("data").snapshots();
  }
}

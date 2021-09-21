import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final databaseReference = FirebaseFirestore.instance;

  Future<QuerySnapshot> checkUserAvailableUsingPhone(String phoneNumber) {
    return databaseReference.collection("libraries").where("libraryPhone", isEqualTo: phoneNumber).get();
  }

  Future<String?> addUser(var data) async {
    String? libraryId;
    await databaseReference.collection('libraries').add(data).then((value) {
      libraryId = value.id;
    });
    return libraryId;
  }

  Future<QuerySnapshot> fetchBooks(String? libraryId) {
    return databaseReference.collection('books').where('libraryID', isEqualTo: libraryId).orderBy("createdAt", descending: true).get();
  }

  Future<String?> addBook(var data) async {
    String? bookDocId;
    await databaseReference.collection('books').add(data).then((value) {
      bookDocId = value.id;
    });
    return bookDocId;
  }

  Future<void> updateBook(var data, String? id) async {
    await databaseReference.collection('books').doc(id).update(data);
  }

  Future<void> deleteBook(String? id) async {
    await databaseReference.collection('books').doc(id).delete();
  }
}

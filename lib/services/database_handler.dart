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
    return databaseReference.collection('books').where('libraryId', isEqualTo: libraryId).orderBy("createdAt", descending: true).get();
  }

  Future<QuerySnapshot> fetchIssueRequests(String? libraryId) async {
    return databaseReference.collection('issueRequests').where('libraryId', isEqualTo: libraryId).orderBy("createdAt", descending: true).get();
  }

  Future<void> updateIssueRequest(var data) async {
    return databaseReference.collection('issueRequests').doc(data['docId']).update(data);
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

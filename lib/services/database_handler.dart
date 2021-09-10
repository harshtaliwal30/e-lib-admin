import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final databaseReference = FirebaseFirestore.instance;

  Future<QuerySnapshot> fetchBooks() {
    return databaseReference.collection('books').where('libraryID', isEqualTo: 'm6PGEiB3niFyQi75uRHI').get();
  }

  Future<void> addBook(var data) async {
    await databaseReference.collection('books').add(data);
  }

  Future<void> updateBook(var data, String? id) async {
    await databaseReference.collection('books').doc(id).update(data);
  }
}

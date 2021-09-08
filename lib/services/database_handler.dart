import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHandler {
  final databaseReference = FirebaseFirestore.instance;

  Future<QuerySnapshot> fetchBooks() {
    return databaseReference.collection('books').where('libraryID', isEqualTo: 'm6PGEiB3niFyQi75uRHI').get();
  }
}

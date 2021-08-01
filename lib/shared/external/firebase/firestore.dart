import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riven/shared/domain/datasources/document_db.dart';

class FirestoreDatasource implements DocumentDBDatasource {
  late CollectionReference _collectionReference;

  FirestoreDatasource({required String collectionName}) {
    _collectionReference =
        FirebaseFirestore.instance.collection(collectionName);
  }

  Future<List<Object>> getAllDocuments() async {
    final documents = await _collectionReference.get();
    return documents.docs.toList();
  }
}

class FirebaseApp {}

import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Database {
  Future<void> createBusiness(Map<String, dynamic> businessData);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid !=null);
  final String uid;

  Future<void> createBusiness(Map<String, dynamic> businessData) async {
    final path = '/users/$uid/businesses/business_abc';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(businessData);
  }
}
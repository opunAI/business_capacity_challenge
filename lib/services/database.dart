import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opun_challenge/models/business.dart';

abstract class Database {
  Future<void> createBusiness(Business business);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid !=null);
  final String uid;

  Future<void> createBusiness(Business business) async {
    final path = '/users/$uid/businesses/business_abc';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(business.toMap());
  }
}
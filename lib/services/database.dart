import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opun_challenge/models/business.dart';
import 'package:opun_challenge/services/api_path.dart';

abstract class Database {
  Future<void> createBusiness(Business business);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid !=null);
  final String uid;

  Future<void> createBusiness(Business business) => _setData(
    path: APIPath.business(uid, 'business_abc'),
    data: business.toMap(),
  );

  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }
}
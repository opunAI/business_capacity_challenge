import 'package:meta/meta.dart';
import 'package:opun_challenge/models/business.dart';
import 'package:opun_challenge/services/api_path.dart';
import 'package:opun_challenge/services/firestore_service.dart';

abstract class Database {
  Future<void> createBusiness(Business business);
  Stream<List<Business>> businessStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> createBusiness(Business business) => _service.setData(
        path: APIPath.business(uid, 'business_abc'),
        data: business.toMap(),
      );

  Stream<List<Business>> businessStream() => _service.collectionStream(
        path: APIPath.businesses(uid),
        builder: (data) => Business.fromMap(data),
      );


}

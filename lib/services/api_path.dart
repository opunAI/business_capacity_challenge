class APIPath {
  static String business(String uid, String businessId) => 'users/$uid/businesses/businessId';
  static String businesses(String uid) => 'users/$uid/businesses';
}
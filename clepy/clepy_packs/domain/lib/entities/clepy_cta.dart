class ClepyCta {
  String uid;
  String location;
  int order;
  String urlPicture;
  String route;
  String uidRoute;

  ClepyCta(
      {required this.uid,
      required this.order,
      required this.urlPicture,
      required this.location,
      required this.route,
      required this.uidRoute});

  factory ClepyCta.fromMap(Map<String, dynamic> data) {
    return ClepyCta(
      uid: data['uid'],
      location: data['location'],
      urlPicture: data['urlPicture'],
      order: data['order'],
      route: data['route'],
      uidRoute: data['uidRoute'],
    );
  }
}

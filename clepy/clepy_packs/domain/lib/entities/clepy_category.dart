class ClepyCategory {
  String uid;
  String title;
  String urlPicture;

  ClepyCategory({
    required this.uid,
    required this.urlPicture,
    required this.title,
  });

  factory ClepyCategory.fromMap(Map<String, dynamic> data) {
    return ClepyCategory(
      uid: data['uid'],
      title: data['title'],
      urlPicture: data['urlPicture'],
    );
  }
}

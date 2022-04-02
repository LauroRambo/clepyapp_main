class ClepyProduct {
  String uid;
  String name;
  String urlPicture;
  String description;
  String address;
  double rating;
  double price;

  ClepyProduct({
    required this.uid,
    required this.name,
    required this.urlPicture,
    required this.description,
    required this.address,
    required this.price,
    required this.rating,
  });

  factory ClepyProduct.fromMap(Map<String, dynamic> data) {
    return ClepyProduct(
      uid: data['uid'],
      name: data['name'],
      urlPicture: data['urlPicture'],
      description: data['description'],
      address: data['address'],
      price: data['price'],
      rating: data['rating'],
    );
  }

  void toMap(){

  }
}

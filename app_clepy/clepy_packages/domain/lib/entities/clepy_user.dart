import 'package:domain/entities/clepy_product.dart';
import 'package:domain/entities/clepy_rent.dart';
import 'package:domain/enums/clepy_type_user.dart';

class ClepyUser {
  final String uid;
  final String name;
  final ClepyTypeUser clepyTypeUser;
  ClepyUser(
      {required this.uid, required this.name, required this.clepyTypeUser});
}

class ClepyStandartUser extends ClepyUser {
  final List<String> keyWords;
  final String urlProfilePicture;
  final List<ClepyRent> rents;
  final List<ClepyProduct> myProducts;

  ClepyStandartUser(
      {required String uid,
      required String name,
      required ClepyTypeUser clepyTypeUser,
      required this.keyWords,
      required this.urlProfilePicture,
      required this.rents,
      required this.myProducts})
      : super(
          uid: uid,
          name: name,
          clepyTypeUser: clepyTypeUser,
        );

  factory ClepyStandartUser.fromMap(Map<String, dynamic> data) {
    List<ClepyProduct> myProducts = [];
    List<ClepyRent> rents = [];

    data['rents'].forEach((product) {
      rents.add(ClepyRent.fromMap(product));
    });

    data['myProducts'].forEach((product) {
      myProducts.add(ClepyProduct.fromMap(product));
    });

    return ClepyStandartUser(
      uid: data['uid'],
      name: data['name'],
      clepyTypeUser: data['clepyTypeUser'],
      keyWords: data['keyWords'],
      urlProfilePicture: data['urlProfilePicture'],
      rents: rents,
      myProducts: myProducts,
    );
  }
}

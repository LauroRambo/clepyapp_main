import 'package:domain/entities/clepy_product.dart';
import 'package:domain/entities/clepy_rent.dart';
import 'package:domain/enums/clepy_type_user.dart';

class ClepyUser {
  final String uid;
  final String name;
  final String email;
  final ClepyTypeUser clepyTypeUser;
  ClepyUser(
      {required this.uid,
      required this.name,
      required this.clepyTypeUser,
      required this.email});
}

class ClepyStandartUser extends ClepyUser {
  final List<String> keyWords;
  final String urlProfilePicture;

  ClepyStandartUser({
    required String uid,
    required String name,
    required String email,
    required ClepyTypeUser clepyTypeUser,
    required this.keyWords,
    required this.urlProfilePicture,
  }) : super(
          uid: uid,
          name: name,
          clepyTypeUser: clepyTypeUser,
          email: email,
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
      clepyTypeUser: ClepyTypeUser.values[data['clepyTypeUser']],
      keyWords: data['keyWords'],
      urlProfilePicture: data['urlProfilePicture'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'uid': uid,
      'name': name,
      'clepyTypeUser': clepyTypeUser.index,
      'keyWords': keyWords,
      'urlProfilePicture': urlProfilePicture,
    };
    return map;
  }
}

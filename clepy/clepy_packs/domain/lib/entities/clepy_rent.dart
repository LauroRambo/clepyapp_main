import 'package:domain/entities/clepy_product.dart';
import 'package:domain/enums/type_rent.dart';

class ClepyRent {
  String uid;
  TypeRent type;
  ClepyRent({
    required this.uid,
    required this.type,
  });

  factory ClepyRent.fromMap(Map<String, dynamic> data) {
    return ClepyRent(uid: data['uid'], type: TypeRent.values[data['typeRent']]);
  }
}

class ClepyRentDetail extends ClepyRent {
  String uidLocator;
  String uidLessee;
  DateTime dateRent;
  DateTime dateEndRent;
  bool enabledChat;
  List<ClepyProduct> clepyProduct;
  double totalValue;

  ClepyRentDetail({
    required String uid,
    required TypeRent type,
    required this.uidLocator,
    required this.uidLessee,
    required this.dateRent,
    required this.dateEndRent,
    required this.enabledChat,
    required this.clepyProduct,
    required this.totalValue,
  }) : super(
          uid: uid,
          type: type,
        );

  factory ClepyRentDetail.fromMap({required Map<String, dynamic> dados}) {
    return ClepyRentDetail(
      uid: dados['uid'],
      type: TypeRent.values[dados['type']],
      uidLocator: dados['uidLocator'],
      uidLessee: dados['uidLessee'],
      dateRent: dados['dateRent'],
      dateEndRent: dados['dateEndRent'],
      enabledChat: dados['enabledChat'],
      clepyProduct: dados['clepyProduct'],
      totalValue: dados['totalValue'],
    );
  }
  Map<String, dynamic> toMap() {
    var products = [];
    clepyProduct.forEach((element) {
      products.add(element.toMap());
    });
    return {
      'uid': uid,
      'type': type.index,
      'uidLocator': uidLocator,
      'uidLessee': uidLessee,
      'dateRent': dateRent,
      'dateEndRent': dateEndRent,
      'enabledChat': enabledChat,
      'clepyProduct': products,
      'totalValue': totalValue,
    };
  }
}

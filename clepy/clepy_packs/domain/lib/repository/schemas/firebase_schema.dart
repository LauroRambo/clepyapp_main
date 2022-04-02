import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/clepy_query.dart';
import 'package:domain/enums/collections.dart';

class FirebaseSchema {
  final ClepyCollections table;
  late final CollectionReference collection;
  FirebaseSchema({required this.table}) {
    // durante a inicialização da classe devemos passar o enum da construção
    // o flutter trabalha com ENUM de maneira literal (enumerados) então fazemos a operação para retirar o nome da tabela do enum
    collection = FirebaseFirestore.instance.collection(
      table.toString().split(".")[1],
    );
  }

  Future create(Map<String, dynamic> data, {String? uid}) async {
    if (uid == null) {
      return await collection.add(data);
    } else {
      return await collection.doc(uid).set(data);
    }
  }

  Future update(String id, Map<String, dynamic> data) async {
    return collection.doc(id).update(data);
  }

  Future<DocumentSnapshot<Object?>> getById(id) async {
    return await collection.doc(id).get();
  }

  Future<QuerySnapshot<Object?>> get(List<ClepyQuery> query) async {
    // carrega com campos iniciais da busca
    Query _query = collection.where(
      query[0].field,
      isEqualTo: query[0].isEqualTo,
      isNotEqualTo: query[0].isNotEqualTo,
      isLessThan: query[0].isLessThan,
      isLessThanOrEqualTo: query[0].isLessThanOrEqualTo,
      isGreaterThan: query[0].isGreaterThan,
      isGreaterThanOrEqualTo: query[0].isGreaterThanOrEqualTo,
      arrayContains: query[0].arrayContains,
      arrayContainsAny: query[0].arrayContainsAny,
      whereIn: query[0].whereIn,
      whereNotIn: query[0].whereNotIn,
      isNull: query[0].isNull,
    );

    // realiza um loop com todos os valores para montar query
    for (var element in query) {
      if (element.toString() != query[0].toString()) {
        _query.where(
          element.field,
          isEqualTo: element.isEqualTo,
          isNotEqualTo: element.isNotEqualTo,
          isLessThan: element.isLessThan,
          isLessThanOrEqualTo: element.isLessThanOrEqualTo,
          isGreaterThan: element.isGreaterThan,
          isGreaterThanOrEqualTo: element.isGreaterThanOrEqualTo,
          arrayContains: element.arrayContains,
          arrayContainsAny: element.arrayContainsAny,
          whereIn: element.whereIn,
          whereNotIn: element.whereNotIn,
          isNull: element.isNull,
        );
      }
    }

    return await _query.get();
  }

  Future<QuerySnapshot<Object?>> getByOrder(
      List<ClepyQuery> query, String field) async {
    // carrega com campos iniciais da busca
    Query _query = collection.where(
      query[0].field,
      isEqualTo: query[0].isEqualTo,
      isNotEqualTo: query[0].isNotEqualTo,
      isLessThan: query[0].isLessThan,
      isLessThanOrEqualTo: query[0].isLessThanOrEqualTo,
      isGreaterThan: query[0].isGreaterThan,
      isGreaterThanOrEqualTo: query[0].isGreaterThanOrEqualTo,
      arrayContains: query[0].arrayContains,
      arrayContainsAny: query[0].arrayContainsAny,
      whereIn: query[0].whereIn,
      whereNotIn: query[0].whereNotIn,
      isNull: query[0].isNull,
    );

    // realiza um loop com todos os valores para montar query
    for (var element in query) {
      if (element.toString() != query[0].toString()) {
        _query.where(
          element.field,
          isEqualTo: element.isEqualTo,
          isNotEqualTo: element.isNotEqualTo,
          isLessThan: element.isLessThan,
          isLessThanOrEqualTo: element.isLessThanOrEqualTo,
          isGreaterThan: element.isGreaterThan,
          isGreaterThanOrEqualTo: element.isGreaterThanOrEqualTo,
          arrayContains: element.arrayContains,
          arrayContainsAny: element.arrayContainsAny,
          whereIn: element.whereIn,
          whereNotIn: element.whereNotIn,
          isNull: element.isNull,
        );
      }
    }

    return await _query.orderBy(field).get();
  }
}

import 'package:domain/enums/collections.dart';
import 'package:domain/repository/schemas/firebase_schema.dart';

class CtasRepository extends FirebaseSchema {
  CtasRepository() : super(table: ClepyCollections.ctas);
}

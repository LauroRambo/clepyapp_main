import 'package:domain/enums/collections.dart';
import 'package:domain/repository/schemas/firebase_schema.dart';

class UserRepository extends FirebaseSchema {
  UserRepository() : super(table: ClepyCollections.users);
}

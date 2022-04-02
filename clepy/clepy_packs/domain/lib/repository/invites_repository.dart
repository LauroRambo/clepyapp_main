import 'package:domain/enums/collections.dart';
import 'package:domain/repository/schemas/firebase_schema.dart';

class InvitesRepository extends FirebaseSchema {
  InvitesRepository() : super(table: ClepyCollections.invites);
}

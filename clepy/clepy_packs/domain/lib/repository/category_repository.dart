import 'package:domain/enums/collections.dart';
import 'package:domain/repository/schemas/firebase_schema.dart';

class CategoryRepository extends FirebaseSchema {
  CategoryRepository() : super(table: ClepyCollections.category);
}

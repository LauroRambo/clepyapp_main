import 'package:domain/enums/collections.dart';
import 'package:domain/repository/schemas/firebase_schema.dart';

class ProductsRepository extends FirebaseSchema {
  ProductsRepository() : super(table: ClepyCollections.products);
}

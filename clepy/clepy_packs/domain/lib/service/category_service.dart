import 'package:domain/domain.dart';
import 'package:domain/entities/clepy_category.dart';
import 'package:domain/repository/category_repository.dart';

class CategoryService extends CategoryRepository {
  Future<List<ClepyCategory>> getAll() async {
    List<ClepyCategory> products = [];
    try {
      ClepyQuery query = ClepyQuery(
        'active',
        isEqualTo: 1,
      );

      await get([query]).then((documents) {
        for (var element in documents.docs) {
          products.add(
              ClepyCategory.fromMap(element.data() as Map<String, dynamic>));
        }
      });
    } catch (e) {}

    return products;
  }
}

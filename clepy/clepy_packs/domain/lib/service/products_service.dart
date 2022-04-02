import 'package:domain/domain.dart';
import 'package:domain/repository/products_repository.dart';

class ProductsService extends ProductsRepository {
  Future<List<ClepyProduct>> getProductByCategory(String uidCategory) async {
    List<ClepyProduct> products = [];
    ClepyQuery query = ClepyQuery(
      'uidCategory',
      isEqualTo: 'ixge1D94l6iyvkeGiCf8',
    );

    await get([query]).then((documents) {
      for (var element in documents.docs) {
        products.add(
          ClepyProduct.fromMap(
            element.data() as Map<String, dynamic>,
          ),
        );
      }
    });

    return products;
  }
}

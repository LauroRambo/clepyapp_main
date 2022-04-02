import 'package:domain/domain.dart';
import 'package:domain/entities/clepy_cta.dart';
import 'package:domain/repository/ctas_repository.dart';

class CtasService extends CtasRepository {
  Future<List<ClepyCta>> getCta(String location) async {
    List<ClepyCta> products = [];
    ClepyQuery query = ClepyQuery(
      'location',
      isEqualTo: location,
    );

    await getByOrder([query], 'order').then((documents) {
      for (var element in documents.docs) {
        products.add(ClepyCta.fromMap(element.data() as Map<String, dynamic>));
      }
    });
    print('total ${products.length}');
    return products;
  }
}

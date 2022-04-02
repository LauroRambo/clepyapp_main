import 'package:clepy_cta/ctas/home_header_cta.dart';
import 'package:clepy_feed/screens/feed_screen.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';


class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeaderCta(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Categorias',
            style: TextStyle(
              color: ClepyColors.brandPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: double.infinity,
          child: FutureBuilder(
            future: CategoryService().getAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return ListView.builder(
                    itemCount: (snapshot.data as List<ClepyCategory>).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ClepyCategory category =
                          (snapshot.data as List<ClepyCategory>)[index];
                      return SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(category.urlPicture),
                        ),
                      );
                    },
                  );
                default:
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  );
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Destaques',
            style: TextStyle(
              color: ClepyColors.brandPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: FeedScreen(),
        )
      ],
    );
  }
}

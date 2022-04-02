import 'package:clepy_ui/components/ctas/horizontal_large_cta.dart';
import 'package:domain/entities/clepy_cta.dart';
import 'package:domain/service/ctas_service.dart';
import 'package:flutter/material.dart';

class HomeHeaderCta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: FutureBuilder(
        future: CtasService().getCta('home'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              int list = 0;
              if (snapshot.data != null) {
                list = (snapshot.data as List<ClepyCta>).length;
              }

              return ListView.builder(
                itemCount: list,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ClepyCta cta = (snapshot.data as List<ClepyCta>)[index];
                  return HorizontalLargeCTA(
                    idObject: cta.uidRoute,
                    route: cta.route,
                    urlImage: cta.urlPicture,
                  );
                },
              );
            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  List<String> imagens = [
    'assets/imagens/bem_vindo.png',
    'assets/imagens/alugar.png',
    'assets/imagens/ganhe_clepy.png',
  ];
  List<String> titulo = [
    'Bem Vindo',
    'Encontre o que precisa',
    'Disponibilize seus itens para aluguel',
  ];
  List<String> texto = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac nulla facilisis, viverra metus eu, efficitur magna. Suspendisse pulvinar auctor massa',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac nulla facilisis, viverra metus eu, efficitur magna. Suspendisse pulvinar auctor massa',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac nulla facilisis, viverra metus eu, efficitur magna. Suspendisse pulvinar auctor massa',
  ];
  SwiperController _controller = new SwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.centerRight,
              width: double.infinity,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                icon: Icon(
                  CupertinoIcons.clear_circled,
                  color: ClepyColors.brandLight,
                ),
              ),
            ),
            Expanded(
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(imagens[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          titulo[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ClepyColors.brandPrimary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          texto[index],
                          style: TextStyle(
                            color: ClepyColors.brandPrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 30,
                          ),
                          child: PrimaryButton(
                            onTap: () {
                              Navigator.pushNamed(context, 'home');
                            },
                            label: "Pular",
                            labelColor: Colors.white,
                            backGroundColors: const [
                              Colors.black12,
                              Colors.black12,
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                  ),
                ),
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

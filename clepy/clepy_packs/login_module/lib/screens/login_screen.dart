import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ClepyColors.brandLight.withOpacity(0.2),
      ),
      body: BackGround(
        widget: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 80,
                child: Image.asset('assets/imagens/logo-horizontal.png'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Olá, que bom ver você aqui! ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  //isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  //isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: PrimaryButton(
                onTap: () {},
                label: 'Entrar',
                height: 45,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: PrimaryButton(
                onTap: () {
                  Navigator.of(context).pushNamed('singin');
                },
                label: 'Criar um nova conta',
                backGroundColors: [
                  ClepyColors.brandLight.withOpacity(0.2),
                  ClepyColors.brandLight.withOpacity(0.4)
                ],
                labelColor: Colors.black54,
                height: 45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Esqueceu sua senha?',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

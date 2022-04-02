import 'package:clepy_ui/clepy_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:login_module/bloc/new_user_bloc.dart';
import 'package:login_module/bloc/new_user_event.dart';
import 'package:login_module/bloc/new_user_state.dart';

class NewUserScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final nome = TextEditingController();
  final codigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClepyColors.brandLight.withOpacity(0.2),
        elevation: 0,
      ),
      body: BackGround(
        widget: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: BlocProvider(
                create: (_) => NewUserBloc(NewUserStateInitial()),
                child: BlocBuilder<NewUserBloc, NewUserState>(
                    builder: (context, state) {
                  if (state is NewUserStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewUserStateError) {
                    return Column(
                      children: [
                        Text(
                            'Ops tivemos um erro ${state.typeError == 1 ? 'ao validar seu convite' : 'seu email ja foi cadastrado anteriormente'}'),
                        PrimaryButton(
                          onTap: () {
                            BlocProvider.of<NewUserBloc>(context).add(
                              NewUserEventConfirmError(),
                            );
                          },
                          label: 'Confirmar',
                        )
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          height: 80,
                          child:
                              Image.asset('assets/imagens/logo-horizontal.png'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white54,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      labelText: 'Seu E-mail',
                                      //isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          !value.contains('@') ||
                                          !value.contains('.')) {
                                        return 'Insira um email valido';
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: nome,
                                  decoration: const InputDecoration(
                                    labelText: 'Seu Nome',
                                    //isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: codigo,
                                  decoration: const InputDecoration(
                                    labelText: 'Seu Código de Convite',
                                    //isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: senha,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Senha',
                                    //isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                  validator: (value) {
                                    if (value == "" || value!.length < 6) {
                                      return "Insira uma senha de ao menos 6 digitos";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Selecione algumas catégorias do seu interesse:',
                                  style: TextStyle(
                                      color: ClepyColors.brandPrimary),
                                ),
                              ),
                              MultiSelectContainer(
                                itemsDecoration: MultiSelectDecorations(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        ClepyColors.brandLight.withOpacity(0.1),
                                        ClepyColors.brandLight.withOpacity(0.2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  selectedDecoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        ClepyColors.brandPrimary,
                                        ClepyColors.brandPrimary
                                            .withOpacity(0.9)
                                      ],
                                    ),
                                    border: Border.all(
                                        color: ClepyColors.brandLight),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                items: [
                                  MultiSelectCard(
                                    value: 'oYBUt3gkCLMhJTLsiViw',
                                    label: 'Photo e vídeo',
                                  ),
                                  MultiSelectCard(
                                    value: '77HasYubpPCEFbIsKaoB',
                                    label: 'Fitness',
                                  ),
                                ],
                                onChange: (allSelectedItems, selectedItem) {},
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          'Ao clicar em "Continuar" você concorda com os nossos ',
                                      children: [
                                        TextSpan(
                                          text:
                                              'Termos de Uso e politica de privacidade.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ClepyColors.brandPrimary,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              PrimaryButton(
                                onTap: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  } else {
                                    ClepyUser user = ClepyUser(
                                      uid: '',
                                      name: nome.text,
                                      clepyTypeUser: ClepyTypeUser.standart,
                                      email: email.text,
                                    );
                                    BlocProvider.of<NewUserBloc>(context).add(
                                      NewUserEventSubmitNewUser(
                                        context,
                                        user: user,
                                        invite: codigo.text,
                                        password: senha.text,
                                      ),
                                    );
                                  }
                                },
                                label: 'Cadastrar',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              )),
        ),
      ),
    );
  }
}

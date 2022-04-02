import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_module/bloc/new_user_event.dart';
import 'package:login_module/bloc/new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc(NewUserState initialState) : super(initialState) {
    on<NewUserEvent>((event, emit) async {
      // verificando o evento
      if (event is NewUserEventSubmitNewUser) {
        emit(NewUserStateLoading());
        // verificando o convite
        if (await InvitesServie().ValidInvite(event.invite) == false) {
          emit(NewUserStateError(user: event.user, typeError: 1));
          return;
        }
        String uid = await LoginService()
            .newUserWithEMailAndPassword(event.user.email, event.password);

        if (uid == 'erro') {
          emit(NewUserStateError(user: event.user, typeError: 2));
          return;
        }

        ClepyStandartUser user = ClepyStandartUser(
          uid: uid,
          name: event.user.name,
          email: event.user.email,
          clepyTypeUser: ClepyTypeUser.standart,
          keyWords: [],
          urlProfilePicture: 'urlProfilePicture',
        );

        await LoginService().insertNewUser(user);

        Navigator.of(event.context).pushReplacementNamed('home');
      } else if (event is NewUserEventConfirmError) {
        emit(NewUserStateErrorConfirm());
      }
    });
  }
}

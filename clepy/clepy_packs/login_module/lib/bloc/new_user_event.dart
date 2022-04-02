import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NewUserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewUserEventSubmitNewUser extends NewUserEvent {
  final ClepyUser user;
  final String invite;
  final String password;
  final BuildContext context;
  NewUserEventSubmitNewUser(this.context,
      {required this.user, required this.invite, required this.password});
}

class NewUserEventConfirmError extends NewUserEvent {
  NewUserEventConfirmError();
}

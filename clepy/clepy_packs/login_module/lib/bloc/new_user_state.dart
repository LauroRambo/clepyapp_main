import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class NewUserState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewUserStateInitial extends NewUserState {}

class NewUserStateError extends NewUserState {
  final ClepyUser user;
  final int typeError;
  NewUserStateError({required this.user, required this.typeError});
}

class NewUserStateErrorConfirm extends NewUserState {
  NewUserStateErrorConfirm();
}

class NewUserStateLoading extends NewUserState {}

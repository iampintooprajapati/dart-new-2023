import 'package:flutter/material.dart';
import 'package:new_bloc/model/user_model.dart';

@immutable
abstract class UsersState {}

abstract class UsersActionState extends UsersState {}

class UsersInitial extends UsersState {}

class UsersFetchingLoadingState extends UsersState {}

class UsersFetchingErrorState extends UsersState {}

class UsersFetchingSuccessfulState extends UsersState {
  final List<UserModel> users;
  UsersFetchingSuccessfulState({
    required this.users,
  });
}

class UsersAdditionSuccessState extends UsersActionState {}

class UsersAdditionErrorState extends UsersActionState {}

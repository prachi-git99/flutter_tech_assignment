import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../model/user_model.dart';

@immutable
abstract class HomeState extends Equatable {}

class UserLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends HomeState {
  final List<UserModel> users;
  List<UserModel> searchResults = [];

  UserLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

class UserErrorState extends HomeState {
  final String error;

  UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

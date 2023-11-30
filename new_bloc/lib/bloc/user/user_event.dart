import 'package:flutter/material.dart';

@immutable
abstract class UsersEvent {}

class UsersInitialFetchEvent extends UsersEvent {}

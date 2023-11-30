
import 'package:flutter/material.dart';

@immutable
abstract class PostsEvent {}


class PostsInitialFetchEvent extends PostsEvent{}


class PostAddEvent extends PostsEvent{}
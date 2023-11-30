import 'package:bloc/bloc.dart';
import 'package:new_bloc/bloc/user/user_state.dart';
import 'package:new_bloc/model/user_model.dart';
import 'package:new_bloc/repo/user_repo.dart';

import 'user_event.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersInitialFetchEvent>(usersInitialFetchEvent);
  }

  Future<void> usersInitialFetchEvent(
      UsersInitialFetchEvent event, Emitter<UsersState> emit) async {
    emit(UsersFetchingLoadingState());
    List<UserModel> users = await UsersRepo.fetchUsers();

    emit(UsersFetchingSuccessfulState(users: users));
  }
}

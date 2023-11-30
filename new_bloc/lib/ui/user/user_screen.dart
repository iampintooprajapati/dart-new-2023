import 'package:flutter/material.dart';
import 'package:new_bloc/bloc/user/user_bloc.dart';
import 'package:new_bloc/bloc/user/user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/bloc/user/user_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UsersBloc usersBloc;

  @override
  void initState() {
    usersBloc = context.read<UsersBloc>();
    usersBloc.add(UsersInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
        if (state is UsersInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        if (state is UsersFetchingSuccessfulState) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.users[index].name.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(state.users[index].email.toString())
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: state.users.length);
        }
        return const SizedBox();
      }),
    ));
  }
}

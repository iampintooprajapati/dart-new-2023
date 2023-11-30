import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/bloc/posts/posts_bloc.dart';
import 'package:new_bloc/bloc/user/user_bloc.dart';
import 'package:new_bloc/ui/posts/posts.dart';
import 'package:new_bloc/ui/user/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "BLoC API",
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BlocProvider(
                      create: (context) => context.read<PostsBloc>(),
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => PostsBloc(),
                          ),
                        ],
                        child: const PostsScreen(),
                      ),
                    );
                  }),
                );
              },
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: Colors.black,
              ),
              child: const Text(
                "Posts",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BlocProvider(
                        create: (context) => context.read<UsersBloc>(),
                        child: MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => UsersBloc(),
                            ),
                          ],
                          child: const UserScreen(),
                        ),
                      );
                    }),
                  );
                },
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Users",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ))
          ],
        ),
      ),
    ));
  }
}

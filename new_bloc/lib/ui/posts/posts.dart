import 'package:flutter/material.dart';
import 'package:new_bloc/bloc/posts/posts_bloc.dart';
import 'package:new_bloc/bloc/posts/posts_event.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/bloc/posts/posts_state.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late PostsBloc postsBloc;

  @override
  void initState() {
    postsBloc = context.read<PostsBloc>();
    postsBloc.add(PostsInitialFetchEvent());
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
          "Posts",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is PostsInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        if (state is PostFetchingSuccessfulState) {
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
                        state.posts[index].title,
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(state.posts[index].body)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: state.posts.length);
        }
        return const SizedBox();
      }),
    ));
  }
}

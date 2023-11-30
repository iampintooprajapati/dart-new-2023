import 'package:new_bloc/bloc/posts/posts_event.dart';
import 'package:new_bloc/bloc/posts/posts_state.dart';
import 'package:new_bloc/model/posts_model.dart';
import 'package:new_bloc/repo/posts_repo.dart';
import 'package:bloc/bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  Future<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostsModel> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }
}

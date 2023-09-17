import 'package:flutter/material.dart';
import 'package:flutter_application_1/BLOC/post_provider.dart';
import 'BLOC/post_bloc.dart';


class PostDetail extends StatelessWidget {
  //final PostBloc _postBloc = PostBloc();

  @override
  Widget build(BuildContext context) {
    //在build裡面取得bloc

    PostBloc postBloc = PostProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(postBloc.selectedPost.title),
      ),
      body: Text(postBloc.selectedPost.body),
    );
  }
}
//自己實作一個InheritedWidget(provider就是InheritedWidget的一種)
//InheritedWidget是一個抽象類別，提供public的變數、物件

import 'package:flutter/material.dart';
import 'post_bloc.dart';
class PostProvider extends InheritedWidget{

  final PostBloc postBloc = PostBloc();
  //可以提供給其他Widget使用的變數、物件

  PostProvider({Key? key, required Widget child}) : super(key: key, child: child);
  //初始化一個PostProvider

  //建立靜態方法，方便其他Widget(subwidget)取得PostProvider這個物件
  static PostBloc of(BuildContext context){//subwidget提供的context
    return (context.dependOnInheritedWidgetOfExactType<PostProvider>() as PostProvider).postBloc;
    //往上搜尋有無型態叫PostBloc的InheritedWidget物件，有的話就回傳
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
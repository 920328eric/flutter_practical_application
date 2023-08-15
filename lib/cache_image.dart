//連接網路下載圖片，第二次開啟app時，不用網路也能看到圖片(有判斷是否已經下載過讀片)


import 'dart:io';//存取檔案，看是否存在

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart'; //可以直接取到documents的folder的位置

import 'package:dio/dio.dart';

class CacheImage extends StatelessWidget {
  final String url;
  CacheImage(this.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImageWidget(url),
      builder: (context, AsyncSnapshot<Widget> snapshot){
        //FutureBuilder<Widget> 中指定了泛型類型為 Widget，以確保 snapshot.data 的類型是正確的
        if(!snapshot.hasData) return Container();

        return snapshot.data!; // ! 來確定 snapshot.data 不是空值
      },
    );
  }

  Future<Widget> getImageWidget(String url)async{
    Directory docDir = await getApplicationCacheDirectory();
    String docPath = docDir.path; //存在documents的根目錄
    String cachePath = '$docPath/cache_images'; //存在documents下面的subfolder
    String fileName = url.split('/').last; //取最後一個，通常是檔案位置
    File imageFile = File('$docPath/$fileName'); //把path變成file的物件，藉由file物件看是否存在
    Directory(cachePath).createSync(recursive: true); //cache_images可能不存在,目錄不存在就生成

    if(await imageFile.exists()){
      return Image.file(imageFile);
    }

    downloadImage(url, imageFile.path);
    return Image.network(url);
  }
  
  Future<Response> downloadImage(String url,String filePath){ //執行下載，取得dio物件
    return HttpHelper().dio.download(url, filePath);
  } 

}



class HttpHelper{ //避免create太多dio的物件
  static HttpHelper _object = HttpHelper._(); //定義了一個名為 _object 的靜態私有變數，用來儲存 HttpHelper 類別的唯一實例
  
  Dio dio = Dio(); //用來發起網路請求的物件
  
  factory HttpHelper(){ //定義了一個工廠建構函式，它用來建立並返回 HttpHelper 類別的實例
    return _object;
  }//使用工廠建構函式的好處是，你可以在建構函式內部實現更多邏輯，比如根據條件返回不同的實例，或者使用物件池等方式來管理物件的建立和銷毀
  //此處被用來確保只有一個 HttpHelper 實例被建立，並且返回同一個實例，以避免多次建立 HttpHelper 物件

  HttpHelper._();
  //定義了一個私有的命名建構函式，這表示只有在類別內部才能直接呼叫這個建構函式。這也是為了確保只能在類別內部建立實例
} 
//這段程式碼的設計思路是，透過使用單例模式，
//將 HttpHelper 類別設計成只有一個實例的類別，
//從而避免在應用程式中建立多個不必要的 Dio 實例，
//降低了記憶體消耗，提高了程式碼的執行效率。
//當你需要進行網路請求時，
//可以透過 HttpHelper() 的工廠建構函式取得 HttpHelper 的唯一實例，
//並使用它的 dio 成員變數來發起網路請求。這樣，在整個應用程式中，
//都會共用同一個 Dio 實例，避免了不必要的資源浪費。
import 'package:json_annotation/json_annotation.dart';

part 'JSON_Serialize_module_Auto.g.dart';//include 到另一個 dart file 
//還需下載build_runner套件
//然後在終端機輸入 dart pub run build_runner build
//就會自動生成JSON_Serialize_module_Auto.g.dart(必要存在的檔案)

@JsonSerializable()
class Post{

  late int userId;
  late int id;
  late String title;
  late String body;

  //基本建構值
  Post(this.userId,this.id,this.title,this.body);

  factory Post.fromJson(
    Map<String,dynamic> json    
  ) => _$PostFromJson(json);

  Map<String,dynamic> toJson() => _$PostToJson(this); //回傳一個Map<String,dynamic>的物件
}
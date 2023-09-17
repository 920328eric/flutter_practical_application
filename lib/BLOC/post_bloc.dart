import 'package:http/http.dart' as http;

import 'package:flutter_application_1/serialize module/JSON_Serialize_module_Auto.dart';

class PostBloc {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  //final無法被改變

  //可被改變
  late Post selectedPost;

  Future getData(){
    return http.get(Uri.parse(host));
  }
}
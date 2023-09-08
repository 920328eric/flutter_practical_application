class Postmanual{

  //body、id 和 title 是非空（non-nullable）類型，
  //但在構造函數中沒有進行初始化，導致編譯器報錯。
  //你需要在構造函數中對這些字段進行初始化，或者將它們標記為 late，
  //表示它們會在稍後被初始化。

  late int userId;
  late int id;
  late String title;
  late String body;

  //基本建構值
  Postmanual(this.userId,this.id,this.title,this.body);
  //仿map建構值
  Postmanual.fromMap(Map<String,dynamic> map){
    //?? 0 如果 'userId' 在 Map 中不存在或者其值為 null，
    //那麼 userId 將被設置為 0，否則它將被設置為 'userId' 在 Map 中的值。
    userId = map['userId']?? 0;
    id = map['id']?? 0;
    title = map['title']?? '';
    body = map['body']?? '';
  }
  //<JSON,value>
  //String開頭的map (JSON基本上開頭都是String)
  //<dynamic>，它通常用於表示泛型類型是非受限的，可以接受各種不同類型的數據
}
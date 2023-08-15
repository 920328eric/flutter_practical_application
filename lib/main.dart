import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/rendering.dart';
//debugPaintSizeEnabled = true; //把隱藏的框架用虛線表示出來

import 'package:http/http.dart' as http;//因為要用http.get

import 'dart:convert';//因為要用json.decode,轉換資料格式

import 'sqliteHelper.dart';//資料庫module

import 'cache_image.dart';//連接網路下載圖片，第二次開啟app時，不用網路也能看到圖片(有判斷是否已經下載過讀片)


void main() => runApp(MaterialApp(
      home: HomePageimage(),
    ));

// void main(){
//   return runApp(MaterialApp());
// }

//切換頁面
//--------------------------------------------------
// void main() => runApp(MaterialApp(
//       initialRoute: '/',//從根開始
//       routes: {
//       '/': (context){return  MyAppchangepage();},
//       '/page2': (context){return Page2();}},
//     ));
//--------------------------------------

//statefulwidget 模板
// class MyApp extends StatefulWidget {
//   @override
//   _MAppState createState() => _MAppState();
// }
// class _MAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//       ),
//       body: Container(),
//     );
//   }
// }


class HomePagecubes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      body: Row(
        children: <Widget>[
          const Text(
            'Demo',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.green,
                fontStyle: FontStyle.italic),
          ),
          Container(
            color: Colors.greenAccent,
            width: 20.0,
          ),
          Container(
            color: Colors.red,
            width: 100.0,
            height: 100.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            color: Colors.blue,
            width: 100.0,
            height: 100.0,
          )
        ],
      ),
    );
  }
}

//按按鈕隨機切換顏色
//-------------------------------------
class HomePagechagecolorcubes extends StatefulWidget {
  @override
  HomePage2State createState() => HomePage2State();
}
class HomePage2State extends State<HomePagechagecolorcubes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.forward),
          onPressed: () {
            setState(() {});
          }),
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: getColor(),
            width: 100.0,
            height: 100.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            color: getColor(),
            width: 100.0,
            height: 100.0,
          )
        ],
      ),
    );
  }

  Color getColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }
}
//-------------------------------------


class HomePagtextincube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body: Container(
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
            //borderRadius: BorderRadius.circular(10.0),
          ),
          // width: 100.0,
          // height: 200.0,
          constraints: const BoxConstraints(
            minWidth: 200.0,
            minHeight: 200.0,
          ),

          // color: Colors.yellowAccent,
          //因為會跟decoration有衝突

          child: const Text('My Cotainer Demo'),
        ));
  }
}

class HomePagecard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body: const SizedBox(
          width: 100.0,
          height: 50.0,
          child: Card(
            child: Text(
              'card demo',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
  }
}

class HomePageinputtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    //為了讓外部event也可以取得TextFiel的文字

    return Scaffold(
        appBar: AppBar(
          title: const Text('TextField Demo'),
        ),
        body: TextField(
          controller: controller,
          // onChanged: (text){
          //   print('onChanged');
          //   print(text);
          // },
          onEditingComplete: () {
            print('onEditingComplete');
            print(controller.text);
          },
          // onSubmitted: (text){
          //   print('onSubmitted');
          //   print(text);
          // },
          decoration: InputDecoration(
              icon: const Icon(Icons.calendar_today),
              labelText: '日期',
              //suffix: Icon(Icons.close), //focus才會出現
              //suffixIcon: Icon(Icons.remove),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent)),
              helperText: '日期格式: YYYY/MM/DD',
              hintText: '輸入位置',
              suffix: IconButton(
                  onPressed: () {
                    FocusScope.of(context)
                        .requestFocus(FocusNode()); //讓鍵盤可以收起，專換focus達到此效果
                  },
                  icon: const Icon(Icons.close))),
        ));
  }
}

class HomePagelistview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            //動態產生,scroll的時候才會產生新的
            return Card(
              child: Container(
                height: 150,
                color: Colors.yellowAccent,
                child: Text('$index'),
              ),
            );
          },
        )
        // ListView(
        //     children: List.generate(10, (index){//需要設定數量
        //     return Card(child: Container(
        //       height: 150,
        //       color: Colors.greenAccent,
        //       child: Text('$index'),
        //     ),
        //   );
        //   }
        // ),
        // )
        );
  }
}

class HomePageimage extends StatelessWidget {
  final String bannerimg =
      'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Projects/Outlet/Amazon_OutletDeals_Desktop_TW.jpg';
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true; //把隱藏的框架用虛線表示出來
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      body: Image.asset('lib/images/loyalty.jpg'),
      // Image.network(
      //   bannerimg,
      //   height: 100.0,
      //   alignment: Alignment.bottomCenter,
      //   //fit: BoxFit.cover,
      // ), //Image.network是一個box，裡面再跑NetworkImage
    );
  }
}

class HomePagegridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp Demo'),
        ),
        body:
            // GridView.count(
            //   // scrollDirection: ,//調整排列方向，預設直向
            //   crossAxisCount: 2,//決定寬度(幾個方塊)
            //   childAspectRatio: 2/3,//只能調整寬長比，寬是固定的
            //   children: List.generate(100, (index) {
            //     return Card(
            //         child: Container(
            //           color: Colors.green,
            //           child: Text('Index:$index'),
            //     )
            //   );
            //   }),
            // )
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //調整寬度
                  maxCrossAxisExtent: 400,
                  // childAspectRatio: 2/3,
                ),
                // const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   childAspectRatio: 2/3,
                //   ),
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(
                    color: Colors.green,
                    child: Text('Index:$index'),
                  ));
                }));
  }
}

//--------------------------------------------
//點選底下icon做畫面切換
class changscreenMyApp extends StatefulWidget {//點擊icon畫面切換
  @override
  _MAppState createState() => _MAppState();
}

class _MAppState extends State<changscreenMyApp> {//點擊icon畫面切換
  int index = 0;
  List<Widget> pages = [
    Container(color: Colors.red),
    Container(color: Colors.yellow,),
    Container(color: Colors.blue,),
    Container(color: Colors.green,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp Demo'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int idx){
          setState(() {
            index = idx;
          });
        },
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add,color: Colors.black87,), 
          label: 'Add',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color: Colors.black87,), 
          label: 'Account'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.close,color: Colors.black87,), 
          label: 'Close'),
        BottomNavigationBarItem(
          icon: Icon(Icons.build,color: Colors.black87,),
          label: 'Build'),
      ],
       selectedLabelStyle:  const TextStyle ( // 選中狀態下
        color: Colors.blue,
        fontSize: 20, 
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle( // 未選中狀態下
        color: Colors.grey, 
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      ),
      body: pages[index],
    );
  }
}
//--------------------------------------------



//----------------------------------------------------------
//從 Page2 返回時，Page1 中的 _displayText 變數將更新為 Page2 返回的值
class MyAppchangepage extends StatefulWidget {
  @override
  _MApp2State createState() => _MApp2State();
}

class _MApp2State extends State<MyAppchangepage> {
  // 全局變數用來存儲要顯示在body中的值
  String _displayText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1'),),
      body: Container(
        color: Colors.red,
        child: Text(_displayText),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // Navigator.pushNamed(context, '/page2');
        
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return Page2(textData: _displayText);
        })).then((value){
            // 接收從 Page2 返回的 value
            setState(() {
            _displayText = value ?? ''; // 如果 value 為 null，則設置為空字符串
        });
      });
    }));
  }
}
class Page2 extends StatelessWidget {
  final String? textData;//安全性null修正: String 要?//被聲明為選擇性的
  Page2({Key? key,@required this.textData}):super(key: key);//安全性null修正: Key 要?
  //key 參數是選擇性的// textData 參數使用了 @required 註釋，表示這個參數是必需的，不能是空值
  //選擇性 Key 主要用於特殊情況，例如動態生成小部件列表時，可以將它們與特定的 Key 關聯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: SizedBox.expand(child: Container(
        color: Colors.green,
        child: Text('$textData'),//安全性null修正: $textData略過默認允許null
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context,'ppppppp');
      },),
    );
  }
}
//---------------------------------------------------


//----------------------------------------------------------
//運用api,還有和Http網路連接
//FutureBuilder不會用，不過還是能用出同樣的效果
class Myhomeapi extends StatefulWidget {
  @override
  _MhomeapiState createState() => _MhomeapiState();
}

class _MhomeapiState extends State<Myhomeapi> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  List datas=[];
  @override
  void initState(){
    super.initState();
  }

  // getData()async{
  //   var response = await http.get(Uri.parse(host));
  //   print(response.body);
  // }

  getData(){
    http.get(Uri.parse(host)).then((response){
      setState(() {
        datas = jsonDecode(response.body);
      });
      //print(datas.length);
    });
  }

  // getData(){
  //   return http.get(Uri.parse(host));
  // }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutterBuilder'),
      ),
      // body: 
      // FutureBuilder(
      //   future: getData(),
      //   builder: (context,snap){
      //   if(!snap.hasData){
      //     return Container();
      //   }

      //   List datas = jsonDecode(snap.data?.body);

      //   return ListView.builder(
      //   itemCount: datas.length,
      //   itemBuilder: (context,idx){
      //     var data = datas[idx];
      //     return ListTile(
      //       title: Text(data['title']),
      //       subtitle: Text(data['body']),
      //       );
      //   },
      // );
      // }),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context,idx){
          var data = datas[idx];
          return ListTile(
            title: Text(data['title']),
            subtitle: Text(data['body']),
            );
        },
      )
    );
  }
}
// -----------------------------------------------------


//-------------------------------------------------------------
//資料庫的使用
class MyAppsql extends StatefulWidget {
  @override
  _MAppsqlState createState() => _MAppsqlState();
}

class _MAppsqlState extends State<MyAppsql> {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  final sqlhelp = SqliteHelper();

  getallpost()async{
    await sqlhelp.open();
    return await sqlhelp.queryall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //網路上抓資料寫進資料庫
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.http),
        onPressed: ()async{
          await sqlhelp.open();
          var response = await http.get(Uri.parse(url));//因為是非同步，所以要加await
          List datas = jsonDecode(response.body);//必須轉換格式
          datas.forEach((element) async {
            return await sqlhelp.insert(element);
          });
          // datas.forEach((element) async => sqlhelp.insert(element));
          setState(() {
            
          });
      }),
      appBar: AppBar(
        title: Text('Sqlite in flutter'),
      ),
      body: FutureBuilder(
        //抓取資料庫的資料呈現出來
        future: getallpost(),
        builder: (context,snapshot){//AsyncSnapshot 是一個用於表示異步操作快照的物件
          if(snapshot.hasData){
            List datas = snapshot.data as List;
            return ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: ()async{//游標點下去就進行刪除
                    await sqlhelp.delere(datas[index]['id']);
                    setState(() {
                      //資料更動後，記得更新畫面
                    });
                  },
                  child:ListTile(
                    title: Text(datas[index]['title']),),);
            });
          }
          return Container();
      }),
    );
  }
}
//---------------------------------------------------------


//---------------------------------------------------------
//連接網路下載圖片，第二次開啟app時，不用網路也能看到圖片(有判斷是否已經下載過讀片)
class MyAppnowifiimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CacheImage("https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Projects/Outlet/Amazon_OutletDeals_Desktop_TW.jpg"),
      ),
    );
  }
}
//----------------------------------------------------------
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
      home: changscreenMyApp(),
    ));

//statefulwidget 模板
// class MyApp extends StatefulWidget {
//   @override
//   _MAppState createState() => _MAppState();
// }
//
// class _MAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
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



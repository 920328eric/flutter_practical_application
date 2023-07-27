import 'package:flutter/material.dart';

import 'dart:math';

void main() => runApp(MaterialApp(
      home: HomePagecard(),
    ));

class HomePagecubes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp Demo'),
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
            margin: EdgeInsets.only(left: 10.0),
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
          child: Icon(Icons.forward),
          onPressed: () {
            setState(() {});
          }),
      appBar: AppBar(
        title: Text('MyApp Demo'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            color: getColor(),
            width: 100.0,
            height: 100.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
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
          title: Text('MyApp Demo'),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(30.0),
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
          title: Text('MyApp Demo'),
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

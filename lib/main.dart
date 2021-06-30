import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '10生命周期.dart';
import '11state管理.dart';
import '12父widget管理state.dart';
import '1简单路由打开页面.dart';
import '2路由传递参数.dart';
import '5引用外部包.dart';
import '8StatelessWidget.dart';
import '9context应用.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "index": (context) => NewRoute(),
        "context": (context) => ContextRoute(),
        "lifeCycle": (context) => LifeCycleRoute(),
        "state": (context) => StateRoute(),
        "parent": (context) => ParentRoute(),
        "arg": (context) {
          Map map = ModalRoute.of(context)!.settings.arguments as Map;
          return TipRoute(text: map['text']);
        },
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _json = '';

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  void _incrementCounter() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    setState(() => _counter++);
  }

  void loadAsset() async {
    var json = await rootBundle.loadString('assets/text.txt');
    setState(() => _json = json);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("1.简单路由打开一个新页面"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("2.路由传递参数"),
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return TipRoute(text: "这是参数");
                }));

                print("新页面的返回值: $result");
              },
            ),
            FlatButton(
              child: Text("3.命名路由"),
              onPressed: () => Navigator.pushNamed(context, "index"),
            ),
            FlatButton(
                child: Text("4.命名路由传参"),
                onPressed: () {
                  Navigator.pushNamed(context, "arg", arguments: {"text": "t"});
                }),
            RandomWordsWidget(),
            Text('$_json'),
            Text('7.显示一个图片'),
            Image.asset('assets/images/header.png'),
            Echo(text: "8.StatelessWidget"),
            FlatButton(
              child: Text("9.context应用"),
              onPressed: () => Navigator.pushNamed(context, "context"),
            ),
            FlatButton(
              child: Text("10.widget生命周期"),
              onPressed: () => Navigator.pushNamed(context, "lifeCycle"),
            ),
            FlatButton(
              child: Text("11.state管理"),
              onPressed: () => Navigator.pushNamed(context, "state"),
            ),
            FlatButton(
              child: Text("12.父widget管理state"),
              onPressed: () => Navigator.pushNamed(context, "state"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

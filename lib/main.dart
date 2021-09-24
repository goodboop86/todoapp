import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: Colors.green,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Todo App'),
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
  List<Widget> myToDoList = [];

  Widget myLeftContainer(BuildContext context, color) {
    // 画面サイズの取得
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    double leftContainerHeight = screenHeight * 0.25;
    double leftContainerWidth = screenWidth * 0.5;

    return Container(
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
      ),
      height: leftContainerHeight,
      width: leftContainerWidth,
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Text(
          'HOGEHOGE $_counter',
          style: TextStyle(
              fontSize: 16.0, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Text(
          'fugafugafugafuga $_counter;',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ]),
    );
  }

  Widget myRightContainer(BuildContext context) {
    // 画面サイズの取得
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    double rightContainerHeight = screenHeight * 0.2;
    double rightContainerWidth = screenWidth * 0.5;

    return Container(
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.green,
      ),
      height: rightContainerHeight,
      width: rightContainerWidth,
      padding: EdgeInsets.all(10),
      child: Text(
        'piyo $_counter;',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget myListContainer(BuildContext, context) {
    // 画面サイズの取得
    final Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    double listHeight = screenHeight * 0.2;
    double listWidth = screenWidth;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      width: listWidth,
      height: listHeight,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 2,
          child: myLeftContainer(context, Color(0xFF943530)),
        ),
        SizedBox(width: 10),
        Expanded(flex: 3, child: myRightContainer(context)),
      ]),
    );
  }

  void _addMyToDoList(BuildContext context, Widget myListContainer) {
    setState(() {
      myToDoList.add(myListContainer);
      _counter++;
    });
  }

  void _deleteMyToDoList(BuildContext context) {
    myToDoList.removeAt(0);
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.title,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
            padding: const EdgeInsets.all(10),
            itemCount: myToDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return myListContainer(BuildContext, context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add',
        onPressed: () =>
            {_addMyToDoList(context, myListContainer(BuildContext, context))},
        child: const Icon(
          Icons.post_add,
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_playground/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0), // 底部栏的高度
          child: Container(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // 处理底部按钮1点击事件
                  },
                  child: Text('Button 1'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // 处理底部按钮2点击事件
                  },
                  child: Text('Button 2'),
                ),
                // 可以添加更多的底部按钮
              ],
            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(
                    fontFamily: 'Goldman',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Image.asset(
                  'assets/avatar/wechat_avatar.jpg',
                  height: 40,
                  width: 40,
                ),
                TextButton(
                  onPressed: () {
                    loggerN.i('next page is welcom');
                    Navigator.pushNamed(
                      context,
                      'welcome',
                      arguments: MissMaid(age: '??', name: 'nayo'),
                    );
                  },
                  child: const Text('你到达了门口, 缓缓推开门...'),
                ),
                ElevatedButton(
                  child: const Text("撤退"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text("login"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                ),
                ElevatedButton(
                  child: const Text("focus test"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'testFocus');
                  },
                ),
                ElevatedButton(
                  child: const Text("nest test"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'nestView');
                  },
                ),
                ElevatedButton(
                  child: const Text("test_sliver_app_bar"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'test_sliver_app_bar');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MissMaid {
  String name;
  String age;

  MissMaid({required this.name, required this.age});
}

import 'package:flutter/material.dart';
import 'package:myapp/utils/LocalStorageService.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    LocalStorageService.init();
    return FutureBuilder(
      future: LocalStorageService.storage.ready,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data) {
          dynamic data = LocalStorageService.getItem('hey');
          print(data);

          return MyApp();
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: NetworkImage('https://image.shutterstock.com/image-photo/white-transparent-leaf-on-mirror-260nw-1029171697.jpg'),
            ),
            Image(
              image: AssetImage('assets/image.png'),
            ),
            Text(
              'Hey guys!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.grey[600],
                fontFamily: 'IndieFlower',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LocalStorageService.setItem('hey', 'Hello world');
        },
        child: Icon(
            Icons.add,
        ),
      ),
    );
  }
}

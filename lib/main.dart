import 'package:flutter/material.dart';
import 'package:soyoon_app/first_page.dart';
import 'package:soyoon_app/sec_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoons Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _ScaffoldKEy = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _ScaffoldKEy.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _ScaffoldKEy,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                color: Colors.amber,
              )),
              ListTile(
                title: Text("Home"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SecondPage();
                  }));
                },
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.black),
                  onPressed: () => _openDrawer(),
                )),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:soyoon_app/first_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';

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
  final GlobalKey<ScaffoldState> _ScaffoldKEy = GlobalKey<ScaffoldState>();
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
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Resume"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(),
                  ),
                );
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
                icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                onPressed: () => _openDrawer(),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 90,
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                    text: 'I am  ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: [
                      TextSpan(
                          text: 'Yoon,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
              ),
              RichText(
                  text: const TextSpan(
                      text: 'Front end Developer',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ))),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse(
                        "https://www.linkedin.com/in/soyoon-lee-75ab66199"),
                    builder: (context, followlink) => GestureDetector(
                      onTap: followlink,
                      child: SvgPicture.asset("assets/linkedin.svg",
                          height: 50, width: 50),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse("https://github.com/sy2bgreat"),
                    builder: (context, followlink) => GestureDetector(
                        onTap: followlink,
                        child: SvgPicture.asset("assets/github.svg",
                            height: 50, width: 50)),
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "hong3su3@gmail.com",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}

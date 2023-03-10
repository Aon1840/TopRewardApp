import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Login page',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page login'),
    );
  }
}

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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 70, right: 50, left: 50),
                  child: Image.asset(
                    'assets/images/tops_super_market_logo.png',
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Log in Now',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Please login to continue using our app',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 30, right: 50, left: 50),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black)),
                        hintText: 'Email'),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 10, right: 50, left: 50),
                  child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          hintText: 'Password'))),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: TextButton(
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.grey),
              ),
              onPressed: () {},
            ),
          ),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text("Log in"),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text("Log in Facebook"),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text(
                          "Log in Google",
                          style: TextStyle(
                              color: Colors.grey),
                        ),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text("Log in Apple"),
                        onPressed: () {},
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}

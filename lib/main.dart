import 'dart:html';

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architectserver ',
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Architect offical site'),
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

  void discordLink() async {
    var uri = Uri.parse("https://discord.gg/fceRQczsFV");
    if (await canLaunchUrl(uri))
      await launchUrl(uri);
    else
      // can't launch url, there is some error
      throw "Could not launch $uri";
  }

  @override
  Widget build(BuildContext context) {
    const IconData discord = IconData(0xf04f0, fontFamily: 'MaterialIcons');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double half_width = width * .5;
    double half_height = height * .5;
    double Quarter_width = width * .25;
    double Quarter_height = height * .25;

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
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[200],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: half_height,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //decoration for the outer wrapper
              //color: Color.fromARGB(255, 114, 114, 114),
              borderRadius: BorderRadius.circular(
                  10), //border radius exactly to ClipRRect
              image: DecorationImage(
                  //image: const NetworkImage("https://picsum.photos/id/237/200/300"),
                  image: const AssetImage("assets/Second arrow.png"),
                  opacity: 0.1,
                  fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: ClipRRect(
              //to clip overflown positioned containers.
              borderRadius: BorderRadius.circular(10),
              //if we set border radius on container, the overflown content get displayed at corner.
              child: Container(
                  child: Stack(
                children: <Widget>[
                  //Stack helps to overlap widgets
                  Positioned(
                      left: Quarter_width - 20,
                      top: Quarter_height * .25,
                      child: Container(
                          height: half_width,
                          width: half_width,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 160, 160, 160)
                                  .withOpacity(0.2)))),
                  Positioned(
                      //positioned helps to position widget wherever we want.
                      top: Quarter_height * -0.1,
                      left: half_width - 220, //position of the widget
                      child: Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(
                                      0.2) //background color with opacity
                              ))),

                  Positioned(
                    //main content container postition.
                    child: ModelViewer(
                      src: 'assets/vertical hour.glb',
                      //'https://modelviewer.dev/shared-assets/models/Astronaut.glb',

                      alt: "A 3D model of an astronaut",
                      ar: true,
                      autoRotate: true,
                      cameraControls: false,
                    ),
                  )
                ],
              )),
            ),
          ),
          SizedBox(
            width: half_width,
            child: Column(
              
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    //controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    //controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password, register by joining discord',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.login),
                        label: Text("login")),
                    ElevatedButton.icon(
                        onPressed: discordLink,
                        icon: Icon(discord),
                        label: Text("join discord")),
                  ],
                ),
              ],
            ),
          ),
        Spacer()],
        
      ),

      // ModelViewer(
      //     src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
      //     alt: "A 3D model of an astronaut",
      //     ar: true,
      //     autoRotate: true,
      //     cameraControls: false,
      //   ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

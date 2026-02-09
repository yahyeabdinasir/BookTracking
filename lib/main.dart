import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_tracking/screen/homeScreen.dart';
import 'package:read_tracking/screen/favorite_file.dart';
import 'package:read_tracking/screen/safeFile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orangeAccent)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // so this current index holds the value from the ontap index
  int _currentInedx = 0;

  final List<Widget> _Screens = [
    Homescreen(),

    FavoriteFile(),
    Safefile(),
    //
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("A.Reader"),
      ),

      body: _Screens[_currentInedx],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // currentIndex this is the names prameter along with the botton navigation and we strored the current index
        // to flutter know the active page
        currentIndex: _currentInedx,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "save"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "favorite",
          ),
        ],
        //  selectedItemColor means the active color
        //  unselectedItemColor also means those who are the unactive
        selectedItemColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Theme.of(context).colorScheme.onInverseSurface,
        onTap: (value) {
          print(value);
          setState(() {
            // so the current index holds to the index value of the current page
            _currentInedx = value;
          });
          print(_currentInedx);
        },
      ),
    );
  }

  //
  // Widget icon(IconData home) {}
}

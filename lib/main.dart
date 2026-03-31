import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/screen/bookDetails.dart';
import 'package:read_tracking/screen/homeScreen.dart';
import 'package:read_tracking/screen/favorite_file.dart';
import 'package:read_tracking/screen/practice.dart';
import 'package:read_tracking/screen/safeFile.dart';
import 'package:read_tracking/service/googleApi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // defining the routes  of the application
      initialRoute: '/',

      routes: {
        "/homeScreen": (context) => Homescreen(),
        '/safeFile': (context) => Safefile(),

        '/favorite': (context) => FavoriteFile(),
        '/detailScreen': (context) => DetailsScreen(),
        '/practice' : (context) => Practice()
      },
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
  Googleapi Network = Googleapi();

  void SearchBooks(String query) async {
    try {
      List<Books>? data = await Network.SearchBooks(query);
      // iterating over the titiles
      for (var eachBook in data!) {
        print(eachBook.title);
      }
      // print(data);
      // print(" this is the data from the main dart  , ${data.toString()}");
    } catch (e) {
      print("something went wrong   , $e");
    }
  }

  // void SearchBooks(String query) async {
  //   try {
  //     List<Books>? data = await Network.SearchBooks(query);
  //     print("This is the data from main.dart: ${data?.length} books");
  //   } catch (e) {
  //     print("Something went wrong: $e");
  //   }
  // }

  final List<Widget> _Screens = [Homescreen(), Safefile(), FavoriteFile() , Practice()];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
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
          BottomNavigationBarItem(icon: Icon(Icons.face) , label: "play")
        ],
        //  selectedItemColor means the active color
        //  unselectedItemColor also means those who are the unactive
        selectedItemColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Theme.of(context).colorScheme.onInverseSurface,
        onTap: (value) {
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

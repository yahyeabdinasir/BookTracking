import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/screen/bookDetails.dart';
import 'package:read_tracking/service/googleApi.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHome();
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Googleapi Network = Googleapi();
  List<Books> data = [];

  // initialisin the controller  text for the editable text  of the user
  TextEditingController _TextContorller = TextEditingController();




  void SearchBook(String Query) async {
    try {
      List<Books>? _result = await Network.SearchBooks(Query);
      print(_result);
      //  ui update  that means the data was a null and now we strore the resrult from the api that is how it works
      setState(() {
        data = _result ?? [];
      });

      for (var eachitem in data) {
        print("this is the  from the home screen  ${eachitem.authors}");
      }
    } catch (e) {
      print("something wrong with this  ${e} ");
    }
  }



  @override
  void initState() {
    super.initState();

    _TextContorller.addListener(() {
      print('this is going user type ${_TextContorller.text}');

    });
  }
@override
  void dispose() {
    // TODO: implement dispose
  print("❌ Controller waa la dispose gareeyay");
  _TextContorller.dispose();
  super.dispose();

  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),

            child: TextField(
              
              // this used to get the text from the user
              controller: _TextContorller,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                 fillColor: Colors.white,

                label: Text("Search for a book"),
                hintText: "enter a book",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffix: IconButton(
                  icon: Icon(Icons.search),

                  onPressed: () {
                    // callin the api then passin the user input to the api
                    SearchBook(_TextContorller.text);
                  }
                ),
              ),
              onSubmitted: (Query) {
                SearchBook(Query);
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  // mainAxisSpacing: 2
              ),
              itemBuilder: (context, index) {
                // print("this is the context ${context}");
                Books book = data[index];
                print("this is the books as below index , ${book}");
                final imageUrl = book.thumbmail.trim();

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme.surfaceBright,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),

                  child: Column(

                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                          //  navigate to the details screem
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => DetailsScreen()
                            ),);




                          });
                          print("hello there this si the gesture  ");
                  },

                        child: Padding(
                          padding: const EdgeInsetsGeometry.all(15),
                          child: Card(
                            child: SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: Image.network(imageUrl,
                                fit: BoxFit.fill,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.broken_image, size: 40),
                                  );
                                },
                              )
                            ),
                          ),
                        ),
                      ),
                      Text(book.title,
                      style:  Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(book.authors.isNotEmpty
                          ? book.authors.join(" & ")
                          : "No author",style: Theme.of(context).textTheme.titleMedium,
                        //  so this is the properties that we use to make clip and fit the text when there is the overflow of the text
                        //  so that is how we can use them  so the elipse makes shorter the larget text along with the ..
                        //  while the clip attribute also make them fit  the entire  text without overflow
                        //  and also the visible and fade attribute  they put the top of it each text without the overflow
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,


                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

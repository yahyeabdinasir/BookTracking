import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();


  void SubmitFrom() {
    if (_formkey.currentState!.validate()) {
      print("Name: {nameController.text}");
      print("email ${emaiController.text}");
      print("password ${passwordController.text}");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Form Submitted Successfully")));
      }
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Text("flutter form desing"),
          ),
          centerTitle: true,
          // backgroundColor: Theme.of(context).highlightColor,
        ),
        body: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            // color: Theme.of(context).highlightColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(

                      controller: nameController,

                      decoration: InputDecoration(
                        labelText: "Name",
                      ),




                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required ";
                        }
                        return null;
                      }

                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: emaiController,
                    decoration: InputDecoration(
                        labelText: "input your email address"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email is required";
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 10,),


                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "passwpord is required";
                      }
                      return null;
                    },


                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: SubmitFrom,
                      child: Text("Submitted ")


                  )

                ],
              ),
            ),
          )
          ,

        ));


    }

}

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
  bool isHidden = true;
  String SelectedItems = "female";

  void SubmitFrom() {
    if (_formkey.currentState!.validate()) {
      print("Name: ${nameController.text}");
      print("email ${emaiController.text}");
      print("password ${passwordController.text}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Form Submitted Successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(padding: const EdgeInsets.all(20)),
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
                SizedBox(height: 30),
                Icon(Icons.calendar_today, size: 80, color: Colors.blue),
                SizedBox(height: 20),

                Text("Welcome Back",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center

                ),
                SizedBox(height: 55),


                TextFormField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  fontWeight: FontWeight.bold,
                  ),
                  controller: nameController,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.message),
                    hintText: "Enter the name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required ";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  controller: emaiController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter the emai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.red,
                      )
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                TextFormField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  // making the password invisible
                  obscureText: isHidden,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isHidden ? Icons.visibility : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                    ),

                    hintText: "Enter the password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "passwpord is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                    ),


                    onPressed: SubmitFrom,
                    child: Text("Submitted "),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
//
// class  extends StatefulWidget {
//   const ({super.key});
//
//   @override
//   State<> createState() => _State();
// }
//
// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }



//  designing the dropdown items form field

// DropdownButtonFormField(
//   borderRadius: BorderRadius.circular(10),
//
//   value: SelectedItems,
//   items: ["female", "male", "others"].map((toElement) {
//     return DropdownMenuItem(
//       value: toElement,
//       child: Text(toElement),
//     );
//   }).toList(),
//   onChanged: (value) {
//     setState(() {
//       SelectedItems = value!;
//     });
//   },
// ),
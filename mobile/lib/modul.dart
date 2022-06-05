import 'package:flutter/material.dart';

class Modul extends StatelessWidget {
  const Modul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 255, 212, 76)),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 255, 212, 76),
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                //color: Colors.blue,
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chapter 1",
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "How to Become a great writer",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(30),
                        child: Image.asset("assets/vector_upload.png")),
                    SizedBox(
                      height: 150,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                        border: Border(
                            top: BorderSide(color: Colors.white, width: 1)),
                      ),
                      child: Center(
                          child: Text(
                        "Upload your assigment here!",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 170),
                  height: 40,
                  width: 170,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Color.fromARGB(255, 255, 212, 105)),
                      onPressed: () {},
                      child: Text(
                        "Start Learn",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      )),
                ),
              ),
            ],
          )),
    );
  }
}

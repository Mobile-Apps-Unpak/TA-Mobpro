import 'package:flutter/material.dart';

class SignSuccess extends StatelessWidget {
  const SignSuccess({Key? key}) : super(key: key);

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
        body: Container(
            child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 50, top: 40),
                        child: Text(
                          "Sign Up Success",
                          style: TextStyle(fontSize: 17),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          "Waiting Confirmation",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                ))
          ],
        )),
      ),
    );
  }
}

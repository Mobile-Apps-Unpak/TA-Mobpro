import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo_study2.png", width: 150),
        backgroundColor: Color.fromARGB(255, 255, 212, 76),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 212, 76),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                //height: 245,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "' Learning First '",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Image.asset("assets/vector_home.png"),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  //color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(20),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              child: Image.asset(
                                                "assets/chat_home.png",
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text("Chat Member")
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(20),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/video_home.png",
                                              width: 5,
                                              height: 5,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text("Video")
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(25),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/modul_home.png",
                                              width: 5,
                                              height: 5,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text("Modul")
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(30),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/lainnya_home.png",
                                              width: 5,
                                              height: 5,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text("Lainnya")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            margin: EdgeInsets.only(top: 200),
            //color: Colors.white,
            child: SizedBox(
              height: 35,
              child: TextField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Search',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 625),
            padding: EdgeInsets.only(bottom: 10),
            height: 80,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.home_outlined,
                            size: 35,
                            color: Color.fromARGB(255, 252, 160, 43),
                          )),
                      Text("Home",
                          style: TextStyle(
                              color: Color.fromARGB(255, 252, 160, 43)))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.school_outlined,
                            size: 35,
                            color: Colors.grey,
                          )),
                      Text(
                        "Study",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.payment,
                            size: 35,
                            color: Colors.grey,
                          )),
                      Text(
                        "Payment",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_outlined,
                            size: 35,
                            color: Colors.grey,
                          )),
                      Text(
                        "Profile",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ]),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 550),
                padding: EdgeInsets.all(10),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50)),
                child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 252, 160, 43),
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

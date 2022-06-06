import 'package:flutter/material.dart';
import 'package:mobile/screen/chat.dart';
import 'package:mobile/modul.dart';
import 'package:mobile/screen/study.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo_study2.png", width: 150),
        backgroundColor: const Color.fromARGB(255, 255, 212, 76),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 212, 76),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              //height: 245,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Text(
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
                margin: const EdgeInsets.only(top: 30),
                //color: Colors.red,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
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
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => const Chat(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: SizedBox(
                                              width: 10,
                                              height: 10,
                                              child: Image.asset(
                                                "assets/chat_home.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Chat Member"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => const Study(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/video_home.png",
                                              width: 5,
                                              height: 5,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Video")
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => const Modul(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(25),
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/modul_home.png",
                                              width: 5,
                                              height: 5,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Modul")
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
                                            color: const Color.fromARGB(
                                                255, 253, 235, 179),
                                          ),
                                          child: Image.asset(
                                            "assets/lainnya_home.png",
                                            width: 5,
                                            height: 5,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Lainnya")
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
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            margin: const EdgeInsets.only(top: 200),
            //color: Colors.white,
            child: SizedBox(
              height: 35,
              child: TextField(
                  decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Search',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/screen/chat.dart';
import 'package:mobile/screen/modul.dart';
import 'package:mobile/screen/package.dart';
import 'package:mobile/screen/webview/video_webview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo_study2.png", width: w * 0.4),
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
              height: h * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/vector_home.png"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: h * .03),
                //color: Colors.red,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: h * 0.4,
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
                                                builder: (_) => const Modul(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(25),
                                            height: h * 0.12,
                                            width: w * 0.24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/modul_home.png",
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: h * 0.02),
                                        const Text(
                                          "Modul",
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    const VideoView(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            height: h * 0.12,
                                            width: w * 0.24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/video_home.png",
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: h * 0.02),
                                        const Text("Video")
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.05),
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
                                            height: h * 0.12,
                                            width: w * 0.24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: SizedBox(
                                              child: Image.asset(
                                                "assets/chat_home.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: h * 0.02),
                                        const Text("Chat"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => const Package(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(30),
                                            height: h * 0.12,
                                            width: w * 0.24,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color.fromARGB(
                                                  255, 253, 235, 179),
                                            ),
                                            child: Image.asset(
                                              "assets/lainnya_home.png",
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: h * 0.02),
                                        const Text("Package")
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
            margin: EdgeInsets.only(top: h * .25),
            height: h * 0.15,
            //color: Colors.white,
            child: const Center(
              child: Text(
                "' Learn Something New! '",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

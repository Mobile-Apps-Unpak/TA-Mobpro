import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffd44c),
      body: ListView(
        children: [
          Container(
            color: const Color(0xffffd44c),
            height: 130,
            child: Image.asset('assets/study.png'),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.width * 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        //backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffc4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('test'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffFED403),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('test'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CircleAvatar(
                        radius: 30,
                        //backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        //backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffc4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('test'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffFED403),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('test'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CircleAvatar(
                        radius: 30,
                        //backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TextField(
                        decoration: InputDecoration(hintText: 'Enter message'),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

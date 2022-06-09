import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Chat Tutor'),
        backgroundColor: const Color(0xffffd44c),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: w * .02,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: w * .5,
                        height: h * .07,
                        decoration: BoxDecoration(
                          color: const Color(0xffc4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Can\'t talk use whatsapp only'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: w * .5,
                        height: h * .07,
                        decoration: BoxDecoration(
                          color: const Color(0xffFED403),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Kenapa Dah?'),
                      ),
                      SizedBox(
                        width: w * .02,
                      ),
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: w * .02,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: w * .5,
                        height: h * .07,
                        decoration: BoxDecoration(
                          color: const Color(0xffc4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Disuruh Fahrul'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        width: w * .5,
                        height: h * .07,
                        decoration: BoxDecoration(
                          color: const Color(0xffFED403),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Oke bang'),
                      ),
                      SizedBox(
                        width: w * .02,
                      ),
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
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
                  width: w * 0.75,
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
          ),
        ],
      ),
    );
  }
}

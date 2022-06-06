import 'package:flutter/material.dart';

class Modul extends StatelessWidget {
  const Modul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 212, 76),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 212, 76),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            //color: Colors.blue,
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chapter 1",
                  style: TextStyle(fontSize: 19),
                ),
                const SizedBox(height: 25),
                const Text(
                  "How to Become a great writer",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    child: Image.asset("assets/vector_upload.png")),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 170),
              height: 40,
              width: 170,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: const Color.fromARGB(255, 255, 212, 105)),
                onPressed: () {},
                child: const Text(
                  "Start Learn",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

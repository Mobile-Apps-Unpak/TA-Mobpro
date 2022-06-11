import 'package:flutter/material.dart';
import 'package:mobile/screen/webview/modul_view.dart';

class Modul extends StatelessWidget {
  const Modul(this.id, this.index, this.title, this.url, {Key? key})
      : super(key: key);

  final String? id;
  final String? index;
  final String? title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 212, 76),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
            padding: EdgeInsets.fromLTRB(w * .08, h * .06, w * .08, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chapter ' + index.toString(),
                  style: const TextStyle(fontSize: 19),
                ),
                SizedBox(height: h * .02),
                Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: h * .02),
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
              margin: EdgeInsets.only(top: h * .4),
              height: h * .05,
              width: w * .5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: const Color.fromARGB(255, 255, 212, 105)),
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ModulView(url),
                    ),
                  );
                },
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

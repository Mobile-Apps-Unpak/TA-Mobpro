import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/list_modul.dart';
import 'package:mobile/screen/webview/video_webview.dart';

class Study extends StatefulWidget {
  final String? id;
  const Study(this.id, {Key? key}) : super(key: key);

  @override
  State<Study> createState() => _StudyState();
}

class _StudyState extends State<Study> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  String name = '';

  @override
  void initState() {
    users
        .doc(widget.id)
        .snapshots()
        .listen((DocumentSnapshot<Object?> snapshot) {
      name = snapshot.get('name').toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffd44c),
      body: getName(),
    );
  }

  FutureBuilder<DocumentSnapshot<Object?>> getName() {
    return FutureBuilder(
      future: users.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            return studyWidget(context);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget studyWidget(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: h * .02, vertical: w * .05),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Hey, ' + name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: h * .01,
                ),
                Container(
                  height: h * .1,
                  width: w * 1,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F7F9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Image.asset('assets/vector_study2.png'),
                ),
                SizedBox(
                  height: h * .02,
                ),
                Row(
                  children: [
                    Container(
                      height: h * .25,
                      width: w * .4,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F7F9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Image.asset('assets/vector_study3.png'),
                    ),
                    Container(
                      height: h * .2,
                      width: w * .45,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F7F9),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: h * .005, horizontal: w * .005),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Modul',
                              style: TextStyle(fontSize: 20),
                            ),
                            const Text(
                              'Pelajari materi lebih mudah dengan e-book pdf !',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                child: const Text('Read More'),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ListModul(widget.id),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * .02,
                ),
                Row(
                  children: [
                    Container(
                      height: h * .25,
                      width: w * .4,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F7F9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Image.asset('assets/vector_study4.png'),
                    ),
                    Container(
                      height: h * .2,
                      width: w * .45,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F7F9),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: h * .005, horizontal: w * .005),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Video',
                              style: TextStyle(fontSize: 20),
                            ),
                            const Text(
                              'Belajar ga perlu ribet!, pelajari materi dengan video learning!',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                child: const Text('Read More'),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const VideoView(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
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

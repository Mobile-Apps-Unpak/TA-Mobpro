import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserProgress extends StatefulWidget {
  final String? id;
  const UserProgress(this.id, {Key? key}) : super(key: key);

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  final CollectionReference progress =
      FirebaseFirestore.instance.collection('study_progress');

  String index = '';
  String title = '';
  String lastRead = '';
  String lastReadTitle = '';
  String tempCount = '';
  int count = 0;

  @override
  void initState() {
    progress
        .doc(widget.id)
        .snapshots()
        .listen((DocumentSnapshot<Object?> snapshot) {
      index = snapshot.get('index').toString();
      title = snapshot.get('title').toString();
      lastRead = snapshot.get('lastRead').toString();
      lastReadTitle = snapshot.get('lastReadTitle').toString();

      tempCount = snapshot.get('count').toString();
      count = int.parse(tempCount);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          'Study Progress',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getProgress(),
    );
  }

  FutureBuilder<DocumentSnapshot<Object?>> getProgress() {
    return FutureBuilder(
      future: progress.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            return userProgress(context);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        if (count == 0) {
          return noProgress(context);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget noProgress(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/vector.png', width: w * 0.6, height: h * 0.3),
          SizedBox(height: h * .02),
          const Text(
            'No Progress!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: h * .02),
          const Text(
            'You Must Read Modul First!',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget userProgress(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: w * .05,
                right: w * .05,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * .02,
                  ),
                  Container(
                    width: w * .9,
                    height: h * .65,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 143, 120, 44),
                        image: const DecorationImage(
                            image: AssetImage("assets/vector_progress.jpeg"),
                            opacity: .7,
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w * 1,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: Colors.white,
                              )),
                            ),
                            child: const Center(
                              child: Text(
                                "Current Progress",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * .02,
                          ),
                          Center(
                            child: Text(
                              title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: h * .05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                index + " / " + count.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * .02,
                          ),
                          LinearPercentIndicator(
                            lineHeight: 15,
                            percent: ((int.parse(index) / count)),
                            progressColor: const Color(0xffffd44c),
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(
                            height: h * .05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircularPercentIndicator(
                                radius: 170,
                                lineWidth: 25,
                                percent: ((int.parse(index) / count)),
                                progressColor: const Color(0xffffd44c),
                                backgroundColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(
                                  ((int.parse(index) / count) * 100)
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Container(
                    width: w * .9,
                    height: h * .25,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 170, 143, 52),
                        image: const DecorationImage(
                            image: AssetImage("assets/vector_progress.jpeg"),
                            opacity: .7,
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w * 1,
                            decoration: const BoxDecoration(
                              //color: Colors.red,
                              border: Border(
                                  bottom: BorderSide(
                                color: Colors.white,
                              )),
                            ),
                            child: const Center(
                              child: Text(
                                "Last Reading",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * .02,
                          ),
                          Text(
                            lastReadTitle,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: h * .01,
                          ),
                          Text(
                            'Chapter ' + lastRead,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  int count = 0;

  @override
  void initState() {
    progress
        .doc(widget.id)
        .snapshots()
        .listen((DocumentSnapshot<Object?> snapshot) {
      index = snapshot.get('index').toString();
      title = snapshot.get('title').toString();
      count = snapshot.get('count');
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
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget userProgress(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
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
                      child: Text(index + ' / ' + count.toString()),
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
                      child: Text(title),
                    ),
                    SizedBox(
                      width: w * .02,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
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
                      child: Text(
                        ((int.parse(index) / count) * 100).toString(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

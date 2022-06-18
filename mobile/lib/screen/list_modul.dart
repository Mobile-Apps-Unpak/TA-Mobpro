import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/mainpage_screen/modul.dart';
import 'package:mobile/utils/progress_data.dart';

import '../widget/appbar_with_leading.dart';

class ListModul extends StatefulWidget {
  final String? id;
  const ListModul(this.id, {Key? key}) : super(key: key);

  @override
  State<ListModul> createState() => _ListModulState();
}

class _ListModulState extends State<ListModul> {
  final CollectionReference modul =
      FirebaseFirestore.instance.collection('modul');

  String index = '';
  String title = '';
  String url = '';
  String currentProgress = '';
  String currentProgressTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithLeading(context, 'List Modul'),
      body: StreamBuilder<QuerySnapshot>(
        stream: modul.orderBy('index', descending: false).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('Empty Data'),
              );
            } else {
              return ListView(
                  children: snapshot.data!.docs
                      .map(
                        (e) => dataModul(
                          index: e['index'],
                          title: e['title'],
                          url: e['url'],
                        ),
                      )
                      .toList());
            }
          } else {
            return CircularProgressIndicator(
              color: Theme.of(context).iconTheme.color,
            );
          }
        },
      ),
    );
  }

  Widget dataModul({String? index, String? title, String? url}) {
    return ListTile(
      title: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () async {
          currentProgress =
              await ProgressData().getLastRead(widget.id, 'index');

          currentProgressTitle =
              await ProgressData().getLastRead(widget.id, 'title');

          int numIndex = int.parse(index!);
          int numCProgress = int.parse(currentProgress);

          if ((numCProgress + 1) >= numIndex) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Modul(widget.id, index, title, url,
                    currentProgress, currentProgressTitle),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'You Must Read Chapter ' +
                      (numIndex - 1).toString() +
                      ' First',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/book.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chapter ' + index!,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

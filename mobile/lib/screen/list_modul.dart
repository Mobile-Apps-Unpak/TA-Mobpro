import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screen/modul.dart';
import 'package:mobile/utils/progress_data.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'List Modul',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget dataModul({String? index, String? title, String? url}) {
    return ListTile(
      title: Card(
        child: InkWell(
          onTap: () async {
            ProgressData.updateProgress(
              widget.id,
              index,
              title,
              await ProgressData().countModul(),
            );

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Modul(widget.id, index, title, url),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chapter ' + index!,
                  style: const TextStyle(color: Colors.black54),
                ),
                Text(
                  title!,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

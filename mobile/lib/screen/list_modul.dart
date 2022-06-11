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
  String currentProgress = '';
  String currentProgressTitle = '';

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
      title: Container(
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () async {
            currentProgress =
                await ProgressData().getLastRead(widget.id, 'index');

            currentProgressTitle =
                await ProgressData().getLastRead(widget.id, 'title');

            if (int.parse(currentProgress) < int.parse(index!)) {
              ProgressData.updateProgress(
                widget.id,
                index,
                title,
                await ProgressData().countModul(),
                index,
                title,
              );
            } else {
              ProgressData.updateProgress(
                widget.id,
                currentProgress,
                currentProgressTitle,
                await ProgressData().countModul(),
                index,
                title,
              );
            }

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Modul(widget.id, index, title, url),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
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
                        image: AssetImage('assets/book.png'),
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
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        title!,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

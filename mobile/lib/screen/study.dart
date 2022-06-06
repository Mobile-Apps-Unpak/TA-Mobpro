import 'package:flutter/material.dart';

class Study extends StatelessWidget {
  const Study({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffd44c),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Hey,',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 330,
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F7F9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Image.asset('assets/vector_study2.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 190,
                        width: 155,
                        decoration: const BoxDecoration(
                          color: Color(0xffF5F7F9),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image.asset('assets/vector_study3.png'),
                      ),
                      Container(
                        height: 157,
                        width: 194,
                        decoration: const BoxDecoration(
                          color: Color(0xffF5F7F9),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 190,
                        width: 155,
                        decoration: const BoxDecoration(
                          color: Color(0xffF5F7F9),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image.asset('assets/vector_study4.png'),
                      ),
                      Container(
                        height: 157,
                        width: 194,
                        decoration: const BoxDecoration(
                          color: Color(0xffF5F7F9),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                  onPressed: () {},
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
      ),
    );
  }
}

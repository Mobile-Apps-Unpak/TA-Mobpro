import 'package:flutter/material.dart';

class SignSuccess extends StatelessWidget {
  const SignSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 212, 76),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 212, 76),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 50, top: 40),
                        child: const Text(
                          "Sign Up Request",
                          style: TextStyle(fontSize: 17),
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Waiting Confirmation",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

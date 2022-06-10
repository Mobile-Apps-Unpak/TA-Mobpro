import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/report_app.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  User? user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  final reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          //Button Back to Previous Page
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: const Text(
            "Contact Us",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: const [],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            const Text(
              "There's a problem with this App? Tell Us!",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: h * 0.04, horizontal: w * 0.05),
              child: Column(
                children: [
                  TextFormField(
                    controller: reportController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10.0,
                      ),
                    ),
                    minLines: 5,
                    maxLines: 10,
                  ),
                  SizedBox(height: h * .02),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ReportApp.inputReport(
                          reportController.text.trim(),
                        ).then((value) => Navigator.pop(context));
                      }
                    },
                    child: const Text("Submit",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40),
                      primary: const Color.fromARGB(255, 255, 212, 76),
                    ),
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

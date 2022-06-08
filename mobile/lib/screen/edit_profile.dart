import 'package:flutter/material.dart';
import 'package:mobile/utils/userdata.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final schoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
            //Button Back to Previous Page
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 75),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            actions: const [],
            backgroundColor: Colors.white,
            elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 230,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TextField Full Name
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 2),
                    //TextField Phone Number
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 2),
                    //TextField School
                    TextFormField(
                      controller: schoolController,
                      decoration: InputDecoration(
                        hintText: 'School',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Button for Submit
              ElevatedButton(
                onPressed: () async {
                  await UserData.updateData(
                    nameController.text.trim(),
                    phoneController.text.trim(),
                    schoolController.text.trim(),
                  ).then((value) => Navigator.pop(context));
                },
                child: const Text("Save",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  shape: const StadiumBorder(),
                  primary: const Color.fromARGB(255, 255, 212, 76),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

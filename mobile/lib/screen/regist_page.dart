import 'package:flutter/material.dart';
import 'package:mobile/utils/auth_service.dart';
import 'package:mobile/utils/progress_data.dart';
import 'package:mobile/utils/userdata.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final schoolController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            title: const Text(
              "Let's Gets Started",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: const [],
            backgroundColor: Colors.white,
            elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Sign up your account",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: h * 0.04, horizontal: w * 0.05),
                child: Column(
                  children: [
                    //TextField Full Name
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                    SizedBox(height: h * .03),
                    //TextField Email
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                    SizedBox(height: h * .03),
                    //TextField Phone Number
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r'^[0-9]').hasMatch(value)) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                    SizedBox(height: h * .03),
                    //TextField School
                    TextFormField(
                      controller: schoolController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'School',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                    SizedBox(height: h * .03),
                    //TextField Password
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'Password need at least 8 Character';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                    SizedBox(height: h * .03),
                    //TextField Repeat Password
                    TextFormField(
                      controller: passwordConfirmationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter confirmation password';
                        }

                        if (value != passwordController.text) {
                          return 'Password Doesn\'t match';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Repeat Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                    SizedBox(height: h * .03),

                    //Button for Register
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await AuthServices.createUser(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );

                          await UserData.inputData(
                            emailController.text.trim(),
                            nameController.text.trim(),
                            phoneController.text.trim(),
                            schoolController.text.trim(),
                          );

                          await ProgressData.inputProgress('', '', 0);

                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 40),
                        shape: const StadiumBorder(),
                        primary: const Color.fromARGB(255, 255, 212, 76),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

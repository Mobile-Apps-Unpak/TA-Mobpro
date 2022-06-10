import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/auth_service.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _newPasswordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Password'),
                    //Validasi TextFormField
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'New Password need at least 8 Character';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: h * .015,
                  ),
                  TextFormField(
                    controller: _passwordConfirmationController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repeat New Password'),
                    //Validasi TextFormField
                    validator: (value) {
                      if (value!.isEmpty ||
                          value != _newPasswordController.text) {
                        return 'Password Doesn\'t match';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: h * .025,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 255, 212, 76)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(
                            () {
                              AuthServices.updatePassword(
                                _newPasswordController.text.trim(),
                              )
                                  .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Password has been Changed, User need to login back',
                                        ),
                                      ),
                                    ),
                                  )
                                  .then((value) =>
                                      FirebaseAuth.instance.signOut());
                            },
                          );
                        }
                      },
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

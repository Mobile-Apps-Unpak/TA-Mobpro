import 'package:flutter/material.dart';
import 'package:mobile/screen/splashscreen.dart';
import 'package:mobile/utils/auth_service.dart';
import 'package:mobile/utils/payment_service.dart';
import 'package:mobile/utils/progress_data.dart';
import 'package:mobile/utils/userdata.dart';

class RelogPage extends StatefulWidget {
  final String? id;
  const RelogPage(this.id, {Key? key}) : super(key: key);

  @override
  State<RelogPage> createState() => _RelogPageState();
}

class _RelogPageState extends State<RelogPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _enableAbsorb = true;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: h * .1),
                  Image.asset('assets/images/vector_login.png',
                      width: w * 0.6, height: h * 0.3),
                  SizedBox(height: h * .02),
                  const Text(
                    'Relogin Account',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: h * .0115),
                  const Text(
                    'You need to relog before deleting account',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        w * .09, h * .025, w * .09, h * .025),
                    child: Column(
                      children: [
                        //TextField for Username
                        TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter E-mail';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: h * .022),
                        //TextField for Password
                        TextFormField(
                          controller: _passwordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_open),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Button Submit for Login
                  AbsorbPointer(
                    absorbing: !_enableAbsorb,
                    child: ElevatedButton(
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(w * 0.38, h * 0.055),
                        shape: const StadiumBorder(),
                        primary: const Color.fromARGB(255, 255, 212, 76),
                      ),
                      onPressed: () async {
                        try {
                          _enableAbsorb = false;
                          setState(() {});
                          await AuthServices.deleteUser(
                            widget.id,
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        } catch (e) {
                          errorMessage = e.toString();
                          _enableAbsorb = true;
                          setState(() {});
                        }

                        if (errorMessage == '') {
                          await UserData.deleteData(widget.id)
                              .then(
                                (value) async =>
                                    await ProgressData.deleteProgress(widget.id)
                                        .then(
                                  (value) async =>
                                      await PaymentService.deleteOrder(
                                          widget.id),
                                ),
                              )
                              .then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data User Berhasil Dihapus'),
                                  ),
                                ),
                              );

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const SplashScreen(),
                            ),
                          );
                        }
                      },
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

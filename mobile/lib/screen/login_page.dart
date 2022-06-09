import 'package:flutter/material.dart';
import 'package:mobile/screen/regist_page.dart';
import 'package:mobile/utils/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                  Image.asset('assets/vector_login.png',
                      width: w * 0.6, height: h * 0.3),
                  SizedBox(height: h * .02),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  SizedBox(height: h * .0115),
                  const Text(
                    'log in to your account',
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
                          controller: emailController,
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
                          controller: passwordController,
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
                  ElevatedButton(
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(w * 0.38, h * 0.055),
                      shape: const StadiumBorder(),
                      primary: const Color.fromARGB(255, 255, 212, 76),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await AuthServices.signIn(emailController.text.trim(),
                            passwordController.text.trim());
                      }
                    },
                  ),
                  SizedBox(height: h * .025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const RegistPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 212, 76),
                              fontSize: 12),
                        ),
                        style: TextButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 212, 76)),
                      ),
                    ],
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

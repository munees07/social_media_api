import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media/view/homepage.dart';

class LoginPage extends StatelessWidget {
  final String email;
  final String password;
  LoginPage({super.key, required this.email, required this.password});

  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.black12),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(20),
                    TextFormField(
                      controller: emailController,
                      decoration:
                          const InputDecoration(hintText: 'Enter a Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(20),
                    TextFormField(
                      controller: passwordController,
                      decoration:
                          const InputDecoration(hintText: 'Enter a password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(40),
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            //Login
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        },
                        child: const Text('Login'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

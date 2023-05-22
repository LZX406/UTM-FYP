// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/Services/Account_service.dart';
import 'package:myapp/utils.dart';

class RegisterPage extends StatefulWidget {
  final switchpage;
  const RegisterPage({super.key, this.switchpage});
  @override
  State<RegisterPage> createState() => Register();
}

class Register extends State<RegisterPage> {
  String? errorMessage = '';
  bool Created = true;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final PasswordController2 = TextEditingController();
  final UsernameController = TextEditingController();

  Future<void> create() async {
    try {
      await Auth().create(
          email: EmailController.text, password: PasswordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        Created = false;
      });
    }
  }

  String validatecontroller() {
    if (EmailController.text.isEmpty) {
      return "Email is required";
    }
    if (UsernameController.text.isEmpty) {
      return "Username is required";
    }
    if (PasswordController.text.isEmpty) {
      return "Password is required";
    }
    if (PasswordController.text != PasswordController2.text) {
      return "Incorrect Confirm Password";
    }
    return "Validate complete";
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(
        width: double.infinity,
        height: 800 * fem,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            // registerpagesHi (101:5)
            padding:
                EdgeInsets.fromLTRB(40 * fem, 200 * fem, 44 * fem, 0 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/page-1/images/pexels-monstera-63733052-1-2-bg.png',
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x3f000000),
                  offset: Offset(0 * fem, 4 * fem),
                  blurRadius: 2 * fem,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // autogroup6ixrpVn (HUB9hLXJPnriZZ7Zcu6iXr)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),

                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      controller: EmailController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                Container(
                  // autogroup8brsgAc (HUB9vAVG6Tbqw8gonh8BRS)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: TextField(
                    controller: UsernameController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.people, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Username',
                    ),
                  ),
                ),
                Container(
                  // autogroup8brsgAc (HUB9vAVG6Tbqw8gonh8BRS)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: TextField(
                    controller: PasswordController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Password',
                    ),
                  ),
                ),
                Container(
                  // autogroupwu6yzKi (HUBA3pwACgCeX7epikWu6Y)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 30 * fem),
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: TextField(
                    controller: PasswordController2,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                Container(
                  // autogrouprzdnsXv (HUBADez7gpoCXqCKexRzdn)
                  margin: EdgeInsets.fromLTRB(
                      70 * fem, 0 * fem, 71 * fem, 47 * fem),
                  width: double.infinity,
                  height: 47 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                    color: const Color(0xffdde0e6),
                  ),
                  child: Center(
                    child: Center(
                        child: TextButton(
                      onPressed: () async {
                        errorMessage = validatecontroller();
                        if (errorMessage == "Validate complete") {
                          await create();
                          if (Created == true) {
                            setState(() {
                              errorMessage = 'Create successful';
                            });
                            Accountservice().CreateUser(
                                username: UsernameController.text,
                                email: EmailController.text,
                                password: PasswordController.text);
                          }
                        }
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  backgroundColor: Colors.black,
                                  insetPadding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 40),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 14),
                                        Text(
                                          errorMessage!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    )),
                  ),
                ),
                Center(
                  // alreadyhaveaccountvm6 (102:27)
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        16 * fem, 0 * fem, 0 * fem, 14 * fem),
                    child: Text(
                      'Already have account?',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Center(
                  // signinhereRxk (102:28)
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        11 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        widget.switchpage();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Sign in here',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          decoration: TextDecoration.underline,
                          color: const Color(0xff1e25de),
                          decorationColor: const Color(0xff1e25de),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

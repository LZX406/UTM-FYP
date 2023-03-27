// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/RegisterPage/register-page.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => Login();
}

class Login extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  Switchpage() {
    if (isLogin) {
      setState(() {
        isLogin = false;
      });
    } else {
      setState(() {
        isLogin = true;
      });
    }
  }

  Future<void> signin() async {
    try {
      await Auth()
          .sign(email: EmailController.text, password: PasswordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    if (isLogin) {
      return SizedBox(
          width: double.infinity,
          height: 800 * fem,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              // registerpagesHi (101:5)
              padding:
                  EdgeInsets.fromLTRB(40 * fem, 150 * fem, 44 * fem, 200 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
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
                  const SizedBox(
                    height: 50,
                  ),
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
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 15 * fem),
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
                  SizedBox(
                    height: 36,
                    child: Text(
                      errorMessage == '' ? '' : '$errorMessage',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color.fromARGB(255, 255, 0, 0),
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
                    child: TextButton(
                      onPressed: () async {
                        await signin();
                      },
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    // alreadyhaveaccountvm6 (102:27)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          16 * fem, 0 * fem, 0 * fem, 14 * fem),
                      child: Text(
                        'Create new account?',
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
                          setState(() {
                            isLogin = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Sign up here',
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
          ));
    } else {
      return RegisterPage(switchpage: Switchpage);
    }
  }
}

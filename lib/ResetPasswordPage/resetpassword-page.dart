// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/utils.dart';

class ResetPasswordPage extends StatefulWidget {
  final Resetpasswordpage;
  const ResetPasswordPage({Key? key, this.Resetpasswordpage}) : super(key: key);
  @override
  State<ResetPasswordPage> createState() => ResetPassword();
}

class ResetPassword extends State<ResetPasswordPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool resetPassword = false;
  final EmailController = TextEditingController();
  bool passwordVisible = true;

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

  Future<void> resetpassword() async {
    try {
      await Auth().resetpassword(EmailController.text);
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
                    // autogrouprzdnsXv (HUBADez7gpoCXqCKexRzdn)
                    margin: EdgeInsets.fromLTRB(
                        50 * fem, 47 * fem, 51 * fem, 47 * fem),
                    width: double.infinity,
                    height: 47 * fem,

                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                      color: const Color(0xffdde0e6),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        await resetpassword();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const dialog(
                                message:
                                    "A reset password email had been send to your email",
                              );
                            });
                      },
                      child: Text(
                        'Reset Password',
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
                        'Return login page?',
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
                          widget.Resetpasswordpage();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Login here',
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
        ));
  }
}

// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class ProfilePage extends StatefulWidget {
  final User_Account? UserAccount;
  const ProfilePage({Key? key, this.UserAccount}) : super(key: key);
  @override
  State<ProfilePage> createState() => Profile();
}

Future<void> signout() async {
  await Auth().signOut();
}

class Profile extends State<ProfilePage> {
  String? email;
  String? user;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SizedBox(
      width: 360 * fem,
      child: SizedBox(
        // profilepageLmn (116:2)
        width: double.infinity,
        height: 800 * fem,
        child: Stack(
          children: [
            Positioned(
              // profileHeQ (116:18)
              left: 149.5 * fem,
              top: 121 * fem,
              child: Center(
                child: Align(
                  child: SizedBox(
                    width: 61 * fem,
                    height: 25 * fem,
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // mailregister9gc (116:47)
              left: 15 * fem,
              top: 183 * fem,
              child: Align(
                child: SizedBox(
                  width: 74 * fem,
                  height: 15 * fem,
                  child: Text(
                    'MAIL register',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      decoration: TextDecoration.none,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle38pGx (116:48)
              left: 15 * fem,
              top: 207 * fem,
              child: Align(
                child: SizedBox(
                  width: 324 * fem,
                  height: 32 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // usernameregisterKDi (116:49)
              left: 15 * fem,
              top: 280.5 * fem,
              child: Align(
                child: SizedBox(
                  width: 105 * fem,
                  height: 15 * fem,
                  child: Text(
                    'Username register',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      decoration: TextDecoration.none,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle39QFA (116:50)
              left: 15 * fem,
              top: 307 * fem,
              child: Align(
                child: SizedBox(
                  width: 324 * fem,
                  height: 40 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // mailgmailcomKsv (116:61)
              left: 20 * fem,
              top: 215.5 * fem,
              child: Align(
                child: SizedBox(
                  width: 330 * fem,
                  height: 15 * fem,
                  child: Text(
                    widget.UserAccount?.email ?? '',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      decoration: TextDecoration.none,
                      color: const Color(0xffffffff),
                      decorationColor: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // username1d7v (117:68)
              left: 20 * fem,
              top: 319.5 * fem,
              child: Align(
                child: SizedBox(
                  width: 62 * fem,
                  height: 15 * fem,
                  child: Text(
                    widget.UserAccount?.username ?? '',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group28aU (117:86)
              left: 111 * fem,
              top: 407 * fem,
              child: Container(
                width: 132 * fem,
                height: 43 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffffffff)),
                  borderRadius: BorderRadius.circular(25 * fem),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        decoration: TextDecoration.none,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group8yLC (117:89)
              left: 111 * fem,
              top: 543 * fem,
              child: Container(
                width: 150 * fem,
                height: 56 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffff0000)),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    signout();
                  },
                  child: Center(
                    child: Text(
                      'Log out',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        decoration: TextDecoration.none,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

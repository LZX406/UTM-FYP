// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => Profile();
}

class Profile extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return FutureBuilder(builder: (context, snapshot) {
      if (snapshot.hasData) {
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
                  top: 71 * fem,
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
                  top: 133 * fem,
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
                  top: 157 * fem,
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
                  top: 230.5 * fem,
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
                  top: 257 * fem,
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
                  top: 165.5 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 92 * fem,
                      height: 15 * fem,
                      child: Text(
                        'mail@gmail.com',
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
                  top: 269.5 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 62 * fem,
                      height: 15 * fem,
                      child: Text(
                        'username1',
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
                  top: 357 * fem,
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
                  left: 0 * fem,
                  top: 743 * fem,
                  child: Container(
                    width: 360 * fem,
                    height: 56 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffff0000)),
                    ),
                    child: Center(
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
                top: 71 * fem,
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
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // mailregister9gc (116:47)
                left: 15 * fem,
                top: 133 * fem,
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
                        decoration: TextDecoration.none,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle38pGx (116:48)
                left: 15 * fem,
                top: 157 * fem,
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
                top: 230.5 * fem,
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
                top: 257 * fem,
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
                top: 165.5 * fem,
                child: Align(
                  child: SizedBox(
                    width: 92 * fem,
                    height: 15 * fem,
                    child: Text(
                      'mail not found',
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
                top: 269.5 * fem,
                child: Align(
                  child: SizedBox(
                    width: 200 * fem,
                    height: 15 * fem,
                    child: Text(
                      'name not found',
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
                // group28aU (117:86)
                left: 111 * fem,
                top: 357 * fem,
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
                left: 0 * fem,
                top: 743 * fem,
                child: Container(
                  width: 360 * fem,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffff0000)),
                  ),
                  child: Center(
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
    });
  }
}

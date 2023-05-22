// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/ProfilePage/profile-page-edit.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/Services/notification.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class ProfilePage extends StatefulWidget {
  final User_Account? UserAccount;
  final refreshpage;
  const ProfilePage({Key? key, this.UserAccount, this.refreshpage})
      : super(key: key);
  @override
  State<ProfilePage> createState() => Profile();
}

Future<void> signout(User_Account? user) async {
  if (user?.username != "Admin") {
    NotificationService().RemoveToken(user: user!);
  }
  await Auth().signOut();
}

class Profile extends State<ProfilePage> {
  String? email;
  String? user;
  bool Edit = false;
  @override
  initState() {
    super.initState();
  }

  void changestate(bool state) {
    setState(() {
      Edit = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    if (Edit == false) {
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
                top: 183 * fem,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.white)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.mail,
                                      color: Colors.white, size: 30)),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 280,
                                height: 50,
                                child: Text(
                                  widget.UserAccount?.email ?? '',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 15 * ffem,
                                    decoration: TextDecoration.none,
                                    color: const Color(0xffffffff),
                                    decorationColor: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.white)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.person_outline,
                                      color: Colors.white, size: 30)),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 280,
                                height: 50,
                                child: Text(
                                  widget.UserAccount?.username ?? '',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 15 * ffem,
                                    decoration: TextDecoration.none,
                                    color: const Color(0xffffffff),
                                    decorationColor: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.phone_android,
                                    color: Colors.white, size: 30)),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 280,
                              height: 50,
                              child: Text(
                                widget.UserAccount?.completephonenum ?? '',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  decorationColor: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 260,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.edit,
                                  color: Colors.white, size: 30)),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 280,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                changestate(true);
                              },
                              child: Text(
                                'Edit Profile',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 20 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.key_off,
                                  color: Colors.white, size: 30)),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 280,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                Auth().resetpassword(widget.UserAccount!.email);
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
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.logout,
                                  color: Colors.white, size: 30)),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 280,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                signout(widget.UserAccount);
                              },
                              child: Text(
                                'Log out',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 20 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
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
            ],
          ),
        ),
      );
    } else {
      return ProfilePageEdit(
        refreshpage: widget.refreshpage,
        UserAccount: widget.UserAccount,
        changestate: changestate,
      );
    }
  }
}

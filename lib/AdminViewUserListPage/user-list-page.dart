// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Services/Account_service.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/user.dart';

class UserListPage extends StatefulWidget {
  final User_Account? UserAccount;
  const UserListPage({Key? key, this.UserAccount}) : super(key: key);
  @override
  State<UserListPage> createState() => UserList();
}

class UserList extends State<UserListPage> {
  List<User_Account?>? Userlist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Color getcolor(User_Account user) {
    if (user.ban == false) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  String getstate(User_Account user) {
    if (user.ban == false) {
      return "BAN";
    } else {
      return "UNBAN";
    }
  }

  Future<void> getalluser() async {
    List<User_Account?> list = await Accountservice().GetAllUser();
    Userlist = list;
  }

  Future<void> updatestate(User_Account user) async {
    setState(() {
      Accountservice().UpdateState(user: user);
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        height: 800 * fem,
        child: Stack(
          children: [
            Positioned(
              left: 0 * fem,
              top: 108 * fem,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  width: 360 * fem,
                  height: 51 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20 * fem,
                        top: 16 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 27 * fem,
                            height: 2 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20 * fem,
                        top: 25 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 27 * fem,
                            height: 2 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20 * fem,
                        top: 33 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 27 * fem,
                            height: 2 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 122.5 * fem,
                        top: 13 * fem,
                        child: Center(
                          child: Align(
                            child: SizedBox(
                              width: 115 * fem,
                              height: 25 * fem,
                              child: Text(
                                'User List',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125 * ffem / fem,
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
              ),
            ),
            Positioned(
              left: 0 * fem,
              top: 159 * fem,
              child: Column(
                children: [
                  SizedBox(
                    width: 360 * fem,
                    height: 500 * fem,
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffffffff)),
                      ),
                      child: FutureBuilder(
                          future: getalluser(),
                          builder: (context, snapshot) {
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: Userlist!.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  child: SizedBox(
                                    width: 360 * fem,
                                    height: 75 * fem,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: 300 * fem,
                                                    height: 20 * fem,
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      Userlist!
                                                          .elementAt(index)!
                                                          .username,
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 20 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: 300 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      'Email:    ${Userlist!.elementAt(index)!.email}',
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: SizedBox(
                                                    width: 300 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      'Last login:    ${Userlist!.elementAt(index)!.lastlogin}',
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: SizedBox(
                                                    width: 300 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      'Banned:    ${Userlist!.elementAt(index)!.ban}',
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 45 * fem,
                                                height: 30 * fem,
                                                child: TextButton(
                                                  onPressed: () {
                                                    updatestate(Userlist!
                                                        .elementAt(index)!);
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 45 * fem,
                                                    height: 30 * fem,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: getcolor(
                                                              Userlist!
                                                                  .elementAt(
                                                                      index)!)),
                                                    ),
                                                    child: Text(
                                                      getstate(Userlist!
                                                          .elementAt(index)!),
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
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
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  height: 0,
                                );
                              },
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

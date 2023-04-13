// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/AdminViewGroupListPage/group-detail-page.dart';
import 'package:myapp/Services/group_service.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/user.dart';

class AllGroupListPage extends StatefulWidget {
  final User_Account? UserAccount;
  const AllGroupListPage({Key? key, this.UserAccount}) : super(key: key);
  @override
  State<AllGroupListPage> createState() => AllGroupList();
}

class AllGroupList extends State<AllGroupListPage> {
  List<Group?>? Grouplist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Future<void> getallgroup() async {
    List<Group?> list = await Group_service().GetAllGroup();
    Grouplist = list;
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
                                'Group List',
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
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 122 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                    ),
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
                      child: FutureBuilder(
                          future: getallgroup(),
                          builder: (context, snapshot) {
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: Grouplist!.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  child: SizedBox(
                                    width: 360 * fem,
                                    height: 75 * fem,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GroupDetailPage2(
                                                      groupid: Grouplist!
                                                          .elementAt(index)!
                                                          .group_id,
                                                    )));
                                      },
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
                                                      Grouplist!
                                                          .elementAt(index)!
                                                          .group_name,
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
                                                      'Info:    ${Grouplist!.elementAt(index)!.info}',
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: 300 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      'Created by:    ${Grouplist!.elementAt(index)!.group_leader!.leader!.username}',
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: 300 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      'Member number:    ${Grouplist!.elementAt(index)!.memberlist!.length}',
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
                                            //end of column
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

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/CreateNewGroupPage/create-new-group-page.dart';
import 'package:myapp/GroupTaskListPage/group-task-list-page.dart';
import 'package:myapp/utils.dart';

class GroupListPage extends StatefulWidget {
  const GroupListPage({Key? key}) : super(key: key);
  @override
  State<GroupListPage> createState() => GroupList();
}

class GroupList extends State<GroupListPage> {
  @override
  Widget build(BuildContext context) {
    List<int> grouplist = [1, 2, 3, 6, 7, 7, 6, 5];
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        // grouplistpagetBS (101:11)
        width: double.infinity,
        height: 800 * fem,
        child: Stack(
          children: [
            Positioned(
              // group1512 (107:8)
              left: 244 * fem,
              top: 657 * fem,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNewGroupPage()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 106 * fem,
                  height: 30 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffffffff)),
                    borderRadius: BorderRadius.circular(25 * fem),
                  ),
                  child: Center(
                    child: Center(
                      child: Text(
                        'Create new group',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 10 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0 * fem,
              top: 109 * fem,
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 360 * fem,
                  height: 550 * fem,
                  child: Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffffffff)),
                      ),
                      child: FutureBuilder(builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: grouplist.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  width: 360 * fem,
                                  height: 81 * fem,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GroupTaskListPage()),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffffffff)),
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                              width: 115 * fem,
                                              height: 25 * fem,
                                              child: Text(
                                                'Alpha group',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2125 * ffem / fem,
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                              width: 153 * fem,
                                              height: 15 * fem,
                                              child: Text(
                                                'Active task: compile report',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2125 * ffem / fem,
                                                  color:
                                                      const Color(0xffffffff),
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
                        }
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 360 * fem,
                                height: 81 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffffffff)),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 115 * fem,
                                      height: 25 * fem,
                                      child: Text(
                                        'No group',
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
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 0,
                            );
                          },
                        );
                      })),
                ),
              ),
            ),
            Positioned(
              // mygroup6Jk (106:59)
              left: 0 * fem,
              top: 58 * fem,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 360 * fem,
                  height: 51 * fem,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'My group',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        height: 1.2125 * ffem / fem,
                        color: const Color.fromARGB(255, 255, 255, 255),
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

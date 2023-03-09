// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

class GroupPastTaskListPage extends StatefulWidget {
  const GroupPastTaskListPage({Key? key}) : super(key: key);
  @override
  State<GroupPastTaskListPage> createState() => GroupPastTaskList();
}

class GroupPastTaskList extends State<GroupPastTaskListPage> {
  int grouppage = 2;
  @override
  Widget build(BuildContext context) {
    List<int> grouptasklist = [1, 2, 3];
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return FutureBuilder(builder: (context, snapshot) {
      if (grouppage == 2) {
        return SizedBox(
          width: 360 * fem,
          height: 590 * fem,
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffffffff)),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: grouptasklist.length,
              itemBuilder: (context, index) {
                return Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 122 * fem,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff00ff19)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: SizedBox(
                                  width: 131 * fem,
                                  height: 15 * fem,
                                  child: Text(
                                    'COMPLETE PROJECT 1',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Align(
                                    child: SizedBox(
                                      width: 180 * fem,
                                      height: 15 * fem,
                                      child: Text(
                                        'Project link: ',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Align(
                                    child: SizedBox(
                                      width: 180 * fem,
                                      height: 15 * fem,
                                      child: Text(
                                        'start : 20/5/2023',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 92 * fem,
                                      height: 15 * fem,
                                      child: Text(
                                        'end : 25/5/2023',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Align(
                                    child: SizedBox(
                                      width: 60 * fem,
                                      height: 15 * fem,
                                      child: Text(
                                        'Progress  ',
                                        textAlign: TextAlign.left,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    child: SizedBox(
                                      width: 180 * fem,
                                      height: 15 * fem,
                                    ),
                                  ),
                                  Align(
                                    child: SizedBox(
                                      width: 50 * fem,
                                      height: 15 * fem,
                                      child: Text(
                                        ' 70%',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  width: 170 * fem,
                                  height: 15 * fem,
                                  child: Text(
                                    'Estimate end date: 23/5/2023',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 0,
                );
              },
            ),
          ),
        );
      }
      return SizedBox(
          width: 360 * fem,
          height: 590 * fem,
          child: const Text("No task available"));
    });
  }
}

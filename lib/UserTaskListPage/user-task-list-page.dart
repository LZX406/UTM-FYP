// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/UserCreateTaskPage/user-create-task-page.dart';
import 'package:myapp/UserPastTaskListPage/user-past-task-list-page.dart';
import 'package:myapp/UserTaskDetailPage/user-task-detail-page.dart';
import 'package:myapp/utils.dart';

class UserTaskListPage extends StatefulWidget {
  const UserTaskListPage({Key? key}) : super(key: key);
  @override
  State<UserTaskListPage> createState() => UserTaskList();
}

class UserTaskList extends State<UserTaskListPage> {
  int taskpage = 1;
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  @override
  Widget build(BuildContext context) {
    List<int> tasklist = [1, 2, 3, 6, 7, 7, 6, 5];
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return FutureBuilder(builder: (context, snapshot) {
      if (taskpage == 1) {
        return SizedBox(
          width: double.infinity,
          child: SizedBox(
            // usertasklistpageTTv (101:10)
            width: double.infinity,
            height: 800 * fem,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                if (details.delta.dx > 15) {
                  //right scroll
                  //increment counter
                  setState(() {
                    taskpage = 1;
                  });
                } else if (details.delta.dx < -15) {
                  //left scroll
                  //decrement counter
                  setState(() {
                    taskpage = 2;
                  });
                }
              },
              child: Stack(
                children: [
                  Positioned(
                    // group117N8 (107:334)
                    left: 0 * fem,
                    top: 58 * fem,

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
                              // line4Dg4 (107:331)
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
                              // line5jeQ (107:332)
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
                              // line6f2G (107:333)
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
                              // alphagroupBmJ (107:34)
                              left: 122.5 * fem,
                              top: 13 * fem,
                              child: Center(
                                child: Align(
                                  child: SizedBox(
                                    width: 115 * fem,
                                    height: 25 * fem,
                                    child: Text(
                                      'My Task',
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
                    // rectangle14LrU (104:88)
                    left: 0 * fem,
                    top: 109 * fem,
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
                    // rectangle20esA (106:32)
                    left: 0 * fem,
                    top: 109 * fem,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 360 * fem,
                          height: 550 * fem,
                          child: Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffffffff)),
                            ),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: tasklist.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  child: SizedBox(
                                    width: 360 * fem,
                                    height: 122 * fem,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UserTaskDetailPage()),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff00ff19)),
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                child: SizedBox(
                                                  width: 131 * fem,
                                                  height: 15 * fem,
                                                  child: Text(
                                                    'COMPLETE PROJECT 1',
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          color: const Color(
                                                              0xffffffff),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: SizedBox(
                                                      width: 92 * fem,
                                                      height: 15 * fem,
                                                      child: Text(
                                                        'end : 25/5/2023',
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          color: const Color(
                                                              0xffffffff),
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
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          color: const Color(
                                                              0xffffffff),
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          color: const Color(
                                                              0xffffffff),
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
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Container(
                                width: 180 * fem,
                                height: 56 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffffffff), width: 2),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      taskpage = 1;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Current Task',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 180 * fem,
                                height: 56 * fem,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      taskpage = 2;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'Past Task',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (taskpage == 1)
                    Positioned(
                      // rectangle20QCp (107:33)
                      left: 230 * fem,
                      top: 609 * fem,
                      child: FloatingActionButton.extended(
                          backgroundColor: Colors.black,
                          hoverColor: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UserCreateTaskPage()),
                            );
                          },
                          icon: const Icon(Icons.add_task),
                          label: const Text('Add task')),
                    ),
                ],
              ),
            ),
          ),
        );
      }
      if (taskpage == 2) {
        return const UserPastTaskListPage();
      }
      return const UserTaskListPage();
    });
  }
}

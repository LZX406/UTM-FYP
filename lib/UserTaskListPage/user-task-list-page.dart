// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/MainTabPage/Tabclass.dart';
import 'package:myapp/Services/p_task_service.dart';
import 'package:myapp/UserCreateTaskPage/user-create-task-page.dart';
import 'package:myapp/UserPastTaskListPage/user-past-task-list-page.dart';
import 'package:myapp/UserTaskDetailPage/user-task-detail-page.dart';
import 'package:myapp/models/p_task.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/user.dart';

class UserTaskListPage extends StatefulWidget {
  final refreshpage;
  final User_Account? UserAccount;
  final Icon icon;
  const UserTaskListPage({
    Key? key,
    this.UserAccount,
    this.refreshpage,
    required this.icon,
  }) : super(key: key);
  @override
  State<UserTaskListPage> createState() => UserTaskList();
}

class UserTaskList extends State<UserTaskListPage> {
  int taskpage = 1;
  List<List<Task_record?>?> Alltasklist = [];
  List<Task_record?>? Activetasklist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Switchpage(int a) {
    setState(() {
      taskpage = a;
    });
  }

  Future<void> getalltask() async {
    Alltasklist =
        await User_tasK_service().Getalltask(userid: widget.UserAccount!.uid);

    Activetasklist = Alltasklist.first;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    if (taskpage == 1) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            if (details.delta.dx > 15) {
              //right scroll
              //increment counter
              Switchpage(1);
            } else if (details.delta.dx < -15) {
              //left scroll
              //decrement counter
              Switchpage(2);
            }
          },
          child: Stack(
            children: [
              Positioned(
                // hdwallpaperhomerosimpsonshomer (107:19)
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 800 * fem,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                ),
              ),
              tab(refreshpage: widget.refreshpage, icon: widget.icon),
              Positioned(
                // group117N8 (107:334)
                left: 0 * fem,
                top: 108 * fem,

                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  width: 360 * fem,
                  height: 51 * fem,
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 300 * fem,
                        height: 25 * fem,
                        child: Align(
                          alignment: Alignment.center,
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
                ),
              ),
              Positioned(
                // rectangle14LrU (104:88)
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
                // rectangle20esA (106:32)
                left: 0 * fem,
                top: 159 * fem,
                child: Column(
                  children: [
                    SizedBox(
                      width: 360 * fem,
                      height: 540 * fem,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: FutureBuilder(
                            future: getalltask(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  children: [
                                    Container(
                                        child:
                                            LoadingAnimationWidget.hexagonDots(
                                                color: Colors.white,
                                                size: 200)),
                                    const dialog2(
                                      message: 'Loading, please wait',
                                    )
                                  ],
                                );
                              }
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: Activetasklist!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 2),
                                    child: Container(
                                      width: 360 * fem,
                                      height: 122 * fem,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[900],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserTaskDetailPage(
                                                      page: 1,
                                                      switchpage: Switchpage,
                                                      UserAccount:
                                                          widget.UserAccount,
                                                      Task: Alltasklist.first!
                                                          .elementAt(index),
                                                    )),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 0, 0),
                                        ),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 330 * fem,
                                                height: 20 * fem,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  Alltasklist.first!
                                                      .elementAt(index)!
                                                      .task_nam,
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SizedBox(
                                                width: 180 * fem,
                                                height: 15 * fem,
                                                child: Text(
                                                  'Project Link:    ${Alltasklist.first!.elementAt(index)!.link}',
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
                                            Row(
                                              children: [
                                                Align(
                                                  child: SizedBox(
                                                    width: 160 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      Alltasklist.first!
                                                                  .elementAt(
                                                                      index)!
                                                                  .startdate ==
                                                              null
                                                          ? "none"
                                                          : 'start : ${DateFormat('yyyy-MM-dd').format(Alltasklist.first!.elementAt(index)!.startdate!)}',
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
                                                  alignment: Alignment.topRight,
                                                  child: SizedBox(
                                                    width: 160 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      Alltasklist.first!
                                                                  .elementAt(
                                                                      index)!
                                                                  .enddate ==
                                                              null
                                                          ? "none"
                                                          : 'end : ${DateFormat('yyyy-MM-dd').format(Alltasklist.first!.elementAt(index)!.enddate!)}',
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
                                                      '${Alltasklist.first!.elementAt(index)!.progress} %',
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
                                              alignment: Alignment.topLeft,
                                              child: SizedBox(
                                                width: 330 * fem,
                                                height: 15 * fem,
                                                child: Text(
                                                  Alltasklist.first!
                                                              .elementAt(index)!
                                                              .estidate ==
                                                          null
                                                      ? "none"
                                                      : 'Estimate end date : ${DateFormat('yyyy-MM-dd').format(Alltasklist.first!.elementAt(index)!.enddate!)}',
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
              Positioned(
                // rectangle20QCp (107:33)
                left: 220 * fem,
                top: 609 * fem,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.blueGrey[900],
                    hoverColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserCreateTaskPage(
                                  switchpage: Switchpage,
                                  UserAccount: widget.UserAccount,
                                )),
                      );
                    },
                    icon: const Icon(Icons.add_task),
                    label: const Text('Add task')),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          currentIndex: taskpage - 1,
          onTap: (i) {
            Switchpage(i + 1);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.task_rounded),
              label: 'Current task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined),
              label: 'Past Task',
            ),
          ],
        ),
      );
    }
    return UserPastTaskListPage(
        UserAccount: widget.UserAccount,
        taskpage: taskpage,
        refreshpage: widget.refreshpage,
        switchpage: Switchpage,
        icon: widget.icon);
  }
}

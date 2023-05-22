// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/MainTabPage/Tabclass.dart';
import 'package:myapp/Services/p_task_service.dart';
import 'package:myapp/UserTaskDetailPage/user-task-detail-page.dart';
import 'package:myapp/models/p_task.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/user.dart';

class UserPastTaskListPage extends StatefulWidget {
  final User_Account? UserAccount;
  final switchpage;
  final Icon icon;
  final refreshpage;
  final taskpage;
  const UserPastTaskListPage(
      {Key? key,
      this.UserAccount,
      this.switchpage,
      required this.icon,
      this.taskpage,
      this.refreshpage})
      : super(key: key);
  @override
  State<UserPastTaskListPage> createState() => UserPastTaskList();
}

class UserPastTaskList extends State<UserPastTaskListPage> {
  List<List<Task_record?>?> Alltasklist = [];
  List<Task_record?>? Inactivetasklist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Future<void> getalltask() async {
    Alltasklist =
        await User_tasK_service().Getalltask(userid: widget.UserAccount!.uid);
    Inactivetasklist = Alltasklist.last;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          if (details.delta.dx > 15) {
            //right scroll
            //increment counter
            widget.switchpage(1);
          } else if (details.delta.dx < -15) {
            //left scroll
            //decrement counter
            widget.switchpage(2);
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
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-xfr.png',
                    fit: BoxFit.cover,
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
                                      child: LoadingAnimationWidget.hexagonDots(
                                          color: Colors.white, size: 200)),
                                  const dialog2(
                                    message: 'Loading, please wait',
                                  )
                                ],
                              );
                            }
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: Inactivetasklist!.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  child: Container(
                                    width: 360 * fem,
                                    height: 122 * fem,
                                    color: Colors.black54,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserTaskDetailPage(
                                                    page: 2,
                                                    switchpage:
                                                        widget.switchpage,
                                                    UserAccount:
                                                        widget.UserAccount,
                                                    Task: Alltasklist.last!
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
                                                Alltasklist.last!
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
                                                'Project Link:    ${Alltasklist.last!.elementAt(index)!.link}',
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
                                                    Alltasklist.last!
                                                                .elementAt(
                                                                    index)!
                                                                .startdate ==
                                                            null
                                                        ? "none"
                                                        : 'start : ${DateFormat('yyyy-MM-dd').format(Alltasklist.last!.elementAt(index)!.startdate!)}',
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
                                                    Alltasklist.last!
                                                                .elementAt(
                                                                    index)!
                                                                .enddate ==
                                                            null
                                                        ? "none"
                                                        : 'end : ${DateFormat('yyyy-MM-dd').format(Alltasklist.last!.elementAt(index)!.enddate!)}',
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
                                                    '${Alltasklist.last!.elementAt(index)!.progress} %',
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
                                                Alltasklist.last!
                                                            .elementAt(index)!
                                                            .estidate ==
                                                        null
                                                    ? "none"
                                                    : 'Estimate end date : ${DateFormat('yyyy-MM-dd').format(Alltasklist.last!.elementAt(index)!.enddate!)}',
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        currentIndex: widget.taskpage - 1,
        onTap: (i) {
          widget.switchpage(i + 1);
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
}

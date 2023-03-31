// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Services/p_task_service.dart';
import 'package:myapp/UserTaskDetailPage/user-task-detail-page.dart';
import 'package:myapp/models/p_task.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/models/user.dart';

class UserPastTaskListPage extends StatefulWidget {
  final User_Account? UserAccount;
  final switchpage;
  const UserPastTaskListPage({Key? key, this.UserAccount, this.switchpage})
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
                // group117N8 (107:334)
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
                      height: 500 * fem,
                      child: Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: FutureBuilder(
                            future: getalltask(),
                            builder: (context, snapshot) {
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: Inactivetasklist!.length,
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
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff00ff19)),
                                            ),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: 330 * fem,
                                                    height: 20 * fem,
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      Alltasklist.last!
                                                          .elementAt(index)!
                                                          .task_nam,
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
                                                  height: 10,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: 180 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      'Project Link:    ${Alltasklist.last!.elementAt(index)!.link}',
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
                                                          '${Alltasklist.last!.elementAt(index)!.progress} %',
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
                                                    width: 330 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      Alltasklist.last!
                                                                  .elementAt(
                                                                      index)!
                                                                  .estidate ==
                                                              null
                                                          ? "none"
                                                          : 'Estimate end date : ${DateFormat('yyyy-MM-dd').format(Alltasklist.last!.elementAt(index)!.enddate!)}',
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
                              );
                            }),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180 * fem,
                            height: 56 * fem,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                widget.switchpage(1);
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
                                widget.switchpage(2);
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
            ],
          ),
        ),
      ),
    );
  }
}

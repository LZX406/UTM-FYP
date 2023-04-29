// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/GroupTaskDetailPage/group-task-detail-page.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class GroupPastTaskListPage extends StatefulWidget {
  final Group? group;
  final grouppage;
  final switchpage;
  final Group_leader? group_leader;
  final User_Account? UserAccount;
  const GroupPastTaskListPage(
      {Key? key,
      this.UserAccount,
      this.switchpage,
      this.grouppage,
      this.group,
      this.group_leader})
      : super(key: key);
  @override
  State<GroupPastTaskListPage> createState() => GroupPastTaskList();
}

class GroupPastTaskList extends State<GroupPastTaskListPage> {
  int grouppage = 2;
  List<Group_Task_record?>? Inactivetasklist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Future<void> getalltask() async {
    Inactivetasklist =
        await Group_task_service().Getpasttask(groupid: widget.group!.group_id);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return FutureBuilder(
        future: getalltask(),
        builder: (context, snapshot) {
          return SizedBox(
            width: 360 * fem,
            height: 558 * fem,
            child: Container(
              alignment: Alignment.topLeft,
              child: ListView.separated(
                padding: EdgeInsets.all(0.0),
                itemCount: Inactivetasklist!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: Container(
                      width: 360 * fem,
                      height: 122 * fem,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroupTaskDetailPage(
                                      group: widget.group,
                                      grouppage: widget.grouppage,
                                      group_leader: widget.group_leader,
                                      switchpage: widget.switchpage,
                                      UserAccount: widget.UserAccount,
                                      grouptask: Inactivetasklist?[index],
                                    )),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        ),
                        child: Container(
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
                                  Inactivetasklist![index]!.task_nam,
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
                                      'Project link: ${Inactivetasklist![index]!.link}',
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
                                      'start : ${Inactivetasklist![index]!.startdate == null ? "none" : DateFormat('yyyy-MM-dd').format(Inactivetasklist![index]!.startdate!)}',
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
                                    width: 150 * fem,
                                    height: 15 * fem,
                                    child: Text(
                                      'end : ${Inactivetasklist![index]!.enddate == null ? "none" : DateFormat('yyyy-MM-dd').format(Inactivetasklist![index]!.enddate!)}',
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
                                      '${Inactivetasklist![index]!.progress} %',
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
                                  'Estimate end date: ${Inactivetasklist![index]!.estidate == null ? "none" : 'start : ${DateFormat('yyyy-MM-dd').format(Inactivetasklist![index]!.estidate!)}'}',
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
        });
  }
}

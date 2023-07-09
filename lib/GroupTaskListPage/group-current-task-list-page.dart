// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/GroupCreateTaskPage/group-create-task-page.dart';
import 'package:myapp/GroupTaskDetailPage/group-task-detail-page.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class GroupCurrentTaskListPage extends StatefulWidget {
  final grouppage;
  final Group? group;
  final Group_leader_record? group_leader;
  final switchpage;
  final User_Account? UserAccount;
  const GroupCurrentTaskListPage(
      {Key? key,
      this.UserAccount,
      this.switchpage,
      this.group,
      this.group_leader,
      this.grouppage})
      : super(key: key);
  @override
  State<GroupCurrentTaskListPage> createState() => GroupCurrentTaskList();
}

class GroupCurrentTaskList extends State<GroupCurrentTaskListPage> {
  List<Group_Task_record?>? Activetasklist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Future<void> getalltask() async {
    Activetasklist = await Group_task_service()
        .Getcurrenttask(groupid: widget.group!.group_id);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: 360 * fem,
      height: 558 * fem,
      child: Container(
        alignment: Alignment.topLeft,
        child: Stack(
          children: [
            FutureBuilder(
                future: getalltask(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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

                  if (Activetasklist!.isEmpty) {
                    return const dialog2(
                      message: 'No task available.',
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.all(0.0),
                    itemCount: Activetasklist!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
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
                                    builder: (context) => GroupTaskDetailPage(
                                          group: widget.group,
                                          grouppage: widget.grouppage,
                                          group_leader: widget.group_leader,
                                          switchpage: widget.switchpage,
                                          UserAccount: widget.UserAccount,
                                          grouptask: Activetasklist?[index],
                                        )),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
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
                                      Activetasklist![index]!.task_nam,
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
                                          'Project link: ${Activetasklist![index]!.link}',
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
                                        width: 170 * fem,
                                        height: 15 * fem,
                                        child: Text(
                                          'start : ${Activetasklist![index]!.startdate == null ? "none" : ' ${DateFormat('yyyy-MM-dd').format(Activetasklist![index]!.startdate!)}'}',
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
                                          'end : ${Activetasklist![index]!.enddate == null ? "none" : DateFormat('yyyy-MM-dd').format(Activetasklist![index]!.enddate!)}',
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
                                          '${Activetasklist![index]!.progress} %',
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
                                    width: 250 * fem,
                                    height: 15 * fem,
                                    child: Text(
                                      'Estimate end date: ${Activetasklist![index]!.estidate == null ? "none" : ' ${DateFormat('yyyy-MM-dd').format(Activetasklist![index]!.estidate!)}'}',
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
            if (widget.UserAccount!.uid == widget.group_leader?.leader_id)
              Positioned(
                // rectangle20QCp (107:33)
                left: 230 * fem,
                top: 500 * fem,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.blueGrey[900],
                    hoverColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupCreateTaskPage(
                                  UserAccount: widget.UserAccount,
                                  switchpage: widget.switchpage,
                                  group: widget.group,
                                )),
                      );
                    },
                    icon: const Icon(Icons.add_task),
                    label: const Text('Add task')),
              ),
          ],
        ),
      ),
    );
  }
}

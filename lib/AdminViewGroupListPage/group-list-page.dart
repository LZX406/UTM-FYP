// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/AdminViewGroupListPage/group-detail-page.dart';
import 'package:myapp/Dialog.dart';
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
  bool delete = false;
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Future<String?> deletegroup(Group group, String userid) async {
    String? message;
    message = await Group_service().DeleteGroup(group: group, userid: userid);
    return message;
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
                              itemCount: Grouplist!.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  child: Container(
                                    width: 360 * fem,
                                    height: 105 * fem,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: <Color>[
                                              Colors.black,
                                              Colors.black87,
                                              Colors.black54,
                                              Colors.black38,
                                              Colors.black26,
                                              Colors.black12,
                                            ]),
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.white)),
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
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: 300 * fem,
                                                  height: 30 * fem,
                                                  child: Text(
                                                    textAlign: TextAlign.center,
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
                                                alignment: Alignment.centerLeft,
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
                                                alignment: Alignment.centerLeft,
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
                                                alignment: Alignment.centerLeft,
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
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: 45 * fem,
                                              height: 30 * fem,
                                              child: TextButton(
                                                onPressed: () async {
                                                  delete = await showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            confirmationdialog(
                                                              statement: delete,
                                                            )
                                                          ],
                                                        );
                                                      });
                                                  if (delete) {
                                                    String? message = '';
                                                    message = await deletegroup(
                                                            Grouplist!
                                                                .elementAt(
                                                                    index)!,
                                                            widget.UserAccount!
                                                                .uid)
                                                        .whenComplete(() async {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Column(
                                                              children: [
                                                                Container(
                                                                    child: LoadingAnimationWidget.hexagonDots(
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            200)),
                                                                const dialog2(
                                                                  message:
                                                                      'Updating, please wait',
                                                                )
                                                              ],
                                                            );
                                                          });
                                                      await getallgroup();
                                                      Navigator.pop(context);
                                                      showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return dialog(
                                                                  message:
                                                                      message ??
                                                                          '',
                                                                );
                                                              })
                                                          .whenComplete(() {});
                                                    });
                                                  }
                                                  delete = false;
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
                                                        color: Colors.white),
                                                  ),
                                                  child: Text(
                                                    'Delete',
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
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  height: 4,
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

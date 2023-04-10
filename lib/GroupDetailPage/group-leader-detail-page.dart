// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/GroupDetailPage/group-edit-detail-page.dart';
import 'package:myapp/GroupDetailPage/group-normal-member-detail-page.dart';
import 'package:myapp/Services/group_member_service.dart';
import 'package:myapp/Services/group_service.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class GroupDetailPage extends StatefulWidget {
  final grouppage;
  final switchpage;
  final String? groupid;
  final User_Account? UserAccount;
  final refresh;
  const GroupDetailPage(
      {Key? key,
      this.UserAccount,
      this.groupid,
      this.refresh,
      this.switchpage,
      this.grouppage})
      : super(key: key);
  @override
  State<GroupDetailPage> createState() => GroupDetail();
}

class GroupDetail extends State<GroupDetailPage> {
  Group? group;
  Group_leader? groupleader;
  List<Group_member?> memberlist = [];
  bool editmode = false;
  final GroupNameController = TextEditingController();
  final GroupInfoController = TextEditingController();
  final GroupMemberController = TextEditingController();

  Future<List<Group_member?>> getgroup() async {
    group = await Group_service().GetSingleGroup(groupid: widget.groupid);
    groupleader = await Group_service().GetSingleGroupleader(group: group!);
    memberlist =
        await Group_member_service().GetGroupMember(groupid: widget.groupid);
    return memberlist;
  }

  String memberposition(int a) {
    if (a == 1) {
      return "member";
    } else if (a == 2) {
      return "manager";
    }
    return "leader";
  }

  void switchmode(bool value) {
    setState(() {
      editmode = value;
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      height: 800 * fem,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              // hdwallpaperhomerosimpsonshomer (108:377)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 799 * fem,
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-bPE.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: getgroup(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    GroupNameController.text = group!.group_name;
                    GroupInfoController.text = group!.info;
                  }
                  if (widget.UserAccount?.uid == groupleader?.leader_id &&
                      groupleader?.leader_id != null) {
                    if (editmode == false) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 55,
                            ),
                            Center(
                              child: Align(
                                child: SizedBox(
                                  width: 360 * fem,
                                  height: 25 * fem,
                                  child: Text(
                                    group?.group_name ?? '',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      height: 1.2125 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  const SizedBox(width: 300),
                                  SizedBox(
                                      width: 60,
                                      child: SizedBox(
                                        width: 30 * fem,
                                        height: 25 * fem,
                                        child: Switch(
                                          onChanged: switchmode,
                                          value: editmode,
                                          activeColor: Colors.blue,
                                          activeTrackColor: Colors.blue[100],
                                          inactiveThumbColor: Colors.grey,
                                          inactiveTrackColor: Colors.white,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    width: 330 * fem,
                                    height: 15 * fem,
                                    child: Text(
                                      'GROUP NAME',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        decoration: TextDecoration.none,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              child: SizedBox(
                                width: 330 * fem,
                                height: 20 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffffffff)),
                                  ),
                                  child: Material(
                                    color: const Color(0x00000000),
                                    child: Text(
                                      group?.group_name ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Align(
                              child: SizedBox(
                                width: 330 * fem,
                                height: 15 * fem,
                                child: Text(
                                  'Group info',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * ffem / fem,
                                    decoration: TextDecoration.none,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              child: SizedBox(
                                width: 330 * fem,
                                height: 120 * fem,
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffffffff)),
                                  ),
                                  child: Material(
                                    color: const Color(0x00000000),
                                    child: Text(
                                      group?.info ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Align(
                              child: SizedBox(
                                width: 330 * fem,
                                height: 15 * fem,
                                child: Text(
                                  'GROUP MEMBER',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * ffem / fem,
                                    decoration: TextDecoration.none,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 330 * fem,
                                  height: 320 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffffffff)),
                                    ),
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      itemCount: memberlist.length,
                                      itemBuilder: (context, index) {
                                        return Align(
                                          child: SizedBox(
                                            width: 360 * fem,
                                            height: 60 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffffffff)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Align(
                                                    child: SizedBox(
                                                      width: 140 * fem,
                                                      height: 30 * fem,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          memberlist[index]!
                                                              .member_username,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            height: 1.2125 *
                                                                ffem /
                                                                fem,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: SizedBox(
                                                        width: 168 * fem,
                                                        height: 30 * fem,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xffffffff)),
                                                          ),
                                                          child: SizedBox(
                                                            width: 168 * fem,
                                                            height: 25 * fem,
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                memberposition(
                                                                    memberlist[
                                                                            index]!
                                                                        .member_type),
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Inter',
                                                                  fontSize:
                                                                      12 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  height:
                                                                      1.2125 *
                                                                          ffem /
                                                                          fem,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: TextButton(
                                onPressed: () {
                                  widget.switchpage(widget.grouppage);
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 360 * fem,
                                  height: 57.22 * fem,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffff0000)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Back',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none,
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
                      );
                    } else {
                      return GroupEditDetailPage(
                        refresh: widget.refresh,
                        group: group,
                        group_leader: groupleader,
                        UserAccount: widget.UserAccount,
                        grouppage: widget.grouppage,
                        memberlist: memberlist,
                        memberposition: memberposition,
                        switchpage: widget.switchpage,
                        switchmode: switchmode,
                        editmode: editmode,
                      );
                    }
                  } else if (groupleader?.leader_id !=
                          widget.UserAccount!.uid &&
                      group?.group_id != null) {
                    return GroupMemberDetailPage(
                        refresh: widget.refresh,
                        memberposition: memberposition,
                        memberlist: memberlist,
                        grouppage: widget.grouppage,
                        switchpage: widget.switchpage,
                        group: group,
                        UserAccount: widget.UserAccount);
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }
}

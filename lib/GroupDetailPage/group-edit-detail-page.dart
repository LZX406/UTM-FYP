// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable, unused_local_variable, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/group_member_service.dart';
import 'package:myapp/Services/group_service.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class GroupEditDetailPage extends StatefulWidget {
  final switchmode;
  final editmode;
  final Group? group;
  final Group_leader_record? group_leader;
  final User_Account? UserAccount;
  final refresh;
  final grouppage;
  final switchpage;
  List<Group_member?> memberlist = [];
  final memberposition;
  GroupEditDetailPage(
      {Key? key,
      this.UserAccount,
      this.group,
      this.refresh,
      this.group_leader,
      this.editmode,
      required this.memberlist,
      this.switchmode,
      this.grouppage,
      this.memberposition,
      this.switchpage})
      : super(key: key);
  @override
  State<GroupEditDetailPage> createState() => GroupEditDetail();
}

class GroupEditDetail extends State<GroupEditDetailPage> {
  final GroupNameController = TextEditingController();
  final GroupInfoController = TextEditingController();
  final GroupMemberController = TextEditingController();
  bool delete = false;
  bool deletemember = false;
  String? message;
  String? checkmessage;
  List<double> extra = [];
  List<bool> showextra = [];
  @override
  initState() {
    super.initState();
    GroupNameController.text = widget.group!.group_name;
    GroupInfoController.text = widget.group!.info;

    for (var element in widget.memberlist) {
      showextra.add(false);
      extra.add(0);
    }
  }

  bool? validatenull() {
    if (GroupNameController.text.isEmpty) {
      showdialog(context, 'Group name must be filled.');
      return false;
    } else if (GroupInfoController.text.isEmpty) {
      showdialog(context, 'Group info must be filled.');
      return false;
    } else {
      return true;
    }
  }

  Future<void> refreshlist() async {
    widget.memberlist = await Group_member_service()
        .GetGroupMember(groupid: widget.group!.group_id);
    setState(() {
      extra = [];
      showextra = [];
    });
    for (var element in widget.memberlist) {
      showextra.add(false);
      extra.add(0);
    }
  }

  void switchmemberposition(String group, String userid, int position) {
    Group_member_service()
        .UpdateMember(groupid: group, userid: userid, position: position);
  }

  Future<void> update() async {
    Group newgroup = Group.create(
        widget.group!.group_id,
        GroupNameController.text,
        GroupInfoController.text,
        widget.group!.group_leader_id);

    message = Group_service()
        .UpdateGroup(group: newgroup, member_list: widget.memberlist);
  }

  bool checksameuser(String username) {
    bool exist = false;
    for (var element in widget.memberlist) {
      if (element!.member_username == username) {
        exist = true;
      }
    }
    if (username == widget.UserAccount!.username) {
      exist = true;
    }
    return exist;
  }

  Future<String?> deletegroup(Group group, String userid) async {
    String? message;
    message = await Group_service().DeleteGroup(group: group, userid: userid);
    return message;
  }

  String? removemember(Group group, String userid) {
    String? message;
    message = Group_member_service().RemoveMember(group: group, userid: userid);
    return message;
  }

  Future<String?> checkuser(String username, Group group) async {
    String? message;
    message = await Group_service().CheckUser(username, group);
    return message;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 25 * fem,
                  child: Text(
                    'NEW GROUP ',
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
                  const SizedBox(width: 260),
                  const SizedBox(
                    width: 40,
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                  SizedBox(
                      width: 60,
                      child: SizedBox(
                        width: 30 * fem,
                        height: 25 * fem,
                        child: Switch(
                          onChanged: widget.switchmode,
                          value: widget.editmode,
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xffffffff)),
                  ),
                  child: Material(
                    color: const Color(0x00000000),
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(60),
                      ],
                      maxLines: 1,
                      controller: GroupNameController,
                      style: const TextStyle(color: Colors.white),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      ),
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xffffffff)),
                  ),
                  child: Material(
                    color: const Color(0x00000000),
                    child: TextField(
                      maxLines: null,
                      controller: GroupInfoController,
                      style: const TextStyle(color: Colors.white),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      ),
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
                  height: 230 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffffffff)),
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: widget.memberlist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onPanUpdate: (DragUpdateDetails details) {
                            if (details.delta.dx > 15) {
                              setState(() {
                                extra[index] = 0;
                                showextra[index] = false;
                              });
                            } else if (details.delta.dx < -15) {
                              setState(() {
                                extra[index] = 30;
                                showextra[index] = true;
                              });
                            }
                          },
                          child: Align(
                            child: SizedBox(
                              width: 360 * fem,
                              height: 60 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
                                ),
                                child: Row(
                                  children: [
                                    Align(
                                      child: SizedBox(
                                        width: 138 * fem - extra[index],
                                        height: 30 * fem,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            widget.memberlist[index]!
                                                .member_username,
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.none,
                                              height: 1.2125 * ffem / fem,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: 168 * fem - extra[index],
                                          height: 30 * fem,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffffffff)),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      120 * fem - extra[index],
                                                  height: 25 * fem,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.memberposition(
                                                          widget
                                                              .memberlist[
                                                                  index]!
                                                              .member_type),
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        decoration:
                                                            TextDecoration.none,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 38 * fem,
                                                  height: 45 * fem,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (widget
                                                              .memberlist[
                                                                  index]!
                                                              .member_type ==
                                                          1) {
                                                        switchmemberposition(
                                                            widget.group!
                                                                .group_id,
                                                            widget
                                                                .memberlist[
                                                                    index]!
                                                                .member_id,
                                                            2);
                                                        setState(() {
                                                          widget
                                                              .memberlist[
                                                                  index]!
                                                              .member_type = 2;
                                                        });
                                                      } else {
                                                        switchmemberposition(
                                                            widget.group!
                                                                .group_id,
                                                            widget
                                                                .memberlist[
                                                                    index]!
                                                                .member_id,
                                                            1);
                                                        setState(() {
                                                          widget
                                                              .memberlist[
                                                                  index]!
                                                              .member_type = 1;
                                                        });
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .keyboard_arrow_right_outlined,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    if (showextra[index])
                                      SizedBox(
                                        height: 65,
                                        width: 2 * extra[index],
                                        child: Container(
                                            color: Colors.red,
                                            child: TextButton(
                                                onPressed: () async {
                                                  deletemember =
                                                      await showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                removedialog(
                                                                  statement:
                                                                      deletemember,
                                                                )
                                                              ],
                                                            );
                                                          });
                                                  if (deletemember) {
                                                    String? message =
                                                        removemember(
                                                            widget.group!,
                                                            widget
                                                                .memberlist[
                                                                    index]!
                                                                .member_id);
                                                    await showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return dialog(
                                                                message:
                                                                    message,
                                                              );
                                                            })
                                                        .whenComplete(() async {
                                                      widget.switchmode(true);
                                                      await refreshlist();
                                                    });
                                                    deletemember = false;
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.white,
                                                ))),
                                      )
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
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.black,
                            insetPadding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 40),
                            child: SizedBox(
                              width: 200,
                              height: 120,
                              child: Column(
                                children: [
                                  Text(
                                    'Member Username',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125 * ffem / fem,
                                      decoration: TextDecoration.none,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    height: 30,
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffffffff)),
                                      ),
                                      child: Material(
                                        color: const Color(0x00000000),
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                60),
                                          ],
                                          maxLines: 1,
                                          controller: GroupMemberController,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 60),
                                      TextButton(
                                        onPressed: () {
                                          widget.switchpage(widget.grouppage);
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          width: 60 * fem,
                                          height: 30 * fem,
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffffffff)),
                                              color: const Color(0x7fffffff),
                                            ),
                                            child: Text(
                                              'ADD',
                                              textAlign: TextAlign.center,
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
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          GroupMemberController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          width: 60 * fem,
                                          height: 30 * fem,
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffffffff)),
                                              color: const Color(0x7fffffff),
                                            ),
                                            child: Text(
                                              'CANCEL',
                                              textAlign: TextAlign.center,
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).whenComplete(
                      () async {
                        if (GroupMemberController.text.isNotEmpty) {
                          bool exist =
                              checksameuser(GroupMemberController.text);
                          if (!exist) {
                            checkmessage = await checkuser(
                                GroupMemberController.text, widget.group!);
                          } else {
                            checkmessage = "user already in group";
                          }
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return dialog(message: checkmessage);
                              });
                          await refreshlist();
                          widget.switchmode(true);
                          // setState(() {
                          //   namelist.add(GroupMemberController.text);
                          //   positionlist.add("Member");
                          // });
                        }
                      },
                    );
                  },
                  child: SizedBox(
                    width: 330 * fem,
                    height: 30 * fem,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffffffff)),
                        color: const Color(0x7fffffff),
                      ),
                      child: Text(
                        'ADD MEMBER',
                        textAlign: TextAlign.center,
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
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () async {
                delete = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          confirmationdialog(
                            statement: delete,
                          )
                        ],
                      );
                    });
                if (delete) {
                  String? message = '';
                  message =
                      await deletegroup(widget.group!, widget.UserAccount!.uid)
                          .whenComplete(() async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Container(
                                  child: LoadingAnimationWidget.hexagonDots(
                                      color: Colors.white, size: 200)),
                              const dialog2(
                                message: 'Updating, please wait',
                              )
                            ],
                          );
                        });
                    await widget.refresh();
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return dialog(
                            message: message ?? '',
                          );
                        }).whenComplete(() {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  });
                }
              },
              child: Container(
                width: 360 * fem,
                height: 38 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffff0000)),
                ),
                child: Center(
                  child: Text(
                    'Delete group',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      decoration: TextDecoration.none,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (validatenull() == true) {
                        update();
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  backgroundColor: Colors.black,
                                  insetPadding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 40),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 14),
                                        const Text(
                                          "Save successfull",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                        TextButton(
                                          onPressed: () {
                                            widget.switchpage(widget.grouppage);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 180 * fem,
                      height: 57.22 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff00ff19)),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
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
                  TextButton(
                    onPressed: () {
                      widget.switchpage(widget.grouppage);
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 180 * fem,
                      height: 57.22 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffff0000)),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

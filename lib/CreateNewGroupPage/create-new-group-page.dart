// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/group_service.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class CreateNewGroupPage extends StatefulWidget {
  final refresh;
  final UserAccount;
  const CreateNewGroupPage({Key? key, this.UserAccount, this.refresh})
      : super(key: key);
  @override
  State<CreateNewGroupPage> createState() => CreateNewGroup();
}

class CreateNewGroup extends State<CreateNewGroupPage> {
  String? message;
  List<Group_member?> memberlist = [];
  String? checkmessage;
  List<double> extra = [];
  List<bool> showextra = [];
  bool validinput = true;
  bool deletemember = false;
  final GroupNameController = TextEditingController();
  final GroupInfoController = TextEditingController();
  final GroupMemberController = TextEditingController();

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

  bool checksameuser(String username) {
    bool exist = false;

    if (username == widget.UserAccount!.username) {
      exist = true;
    } else {
      for (var element in memberlist) {
        if (element!.member_username == username) {
          exist = true;
        }
      }
    }
    return exist;
  }

  Future<bool> checkuserexist(String username) async {
    bool exist = false;

    User_Account? user = await Group_service().Check(username);
    if (user?.username == username) {
      exist = true;
    }
    return exist;
  }

  Future<void> create(var memberlist) async {
    message = "Create successful";
    message = await Group_service().CreateGroup(
        userid: widget.UserAccount!.uid,
        group_nam: GroupNameController.text,
        info: GroupInfoController.text,
        member_list: memberlist);
  }

  String memberposition(int a) {
    if (a == 1) {
      return "member";
    } else if (a == 2) {
      return "manager";
    }
    return "leader";
  }

  void switchmemberposition(Group_member member, int value) {
    member.member_type = value;
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
      child: SizedBox(
        width: double.infinity,
        child: Container(
          // createnewgrouppageJMW (108:330)
          width: double.infinity,
          height: 800.22 * fem,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Positioned(
                  // hdwallpaperhomerosimpsonshomer (108:331)
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 360 * fem,
                      height: 799 * fem,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
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
                      const SizedBox(height: 30),
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
                        child: Container(
                          width: 330 * fem,
                          height: 50 * fem,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: GroupNameController,
                            decoration: InputDecoration(
                              hintText: "Group Name",
                              hintStyle: TextStyle(color: Colors.white54),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            ),
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 16 * ffem,
                              decoration: TextDecoration.none,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: Container(
                          width: 330 * fem,
                          height: 120 * fem,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 8,
                            controller: GroupInfoController,
                            decoration: InputDecoration(
                              hintText: "Group Info",
                              hintStyle: TextStyle(color: Colors.white54),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            ),
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 14 * ffem,
                              decoration: TextDecoration.none,
                              color: const Color(0xffffffff),
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
                            height: 280 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: memberlist.length,
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: const Color(0xffffffff)),
                                          ),
                                          child: Row(
                                            children: [
                                              Align(
                                                child: SizedBox(
                                                  width:
                                                      140 * fem - extra[index],
                                                  height: 30 * fem,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      memberlist[index]!
                                                          .member_username,
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
                                              ),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: 168 * fem -
                                                        extra[index],
                                                    height: 30 * fem,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffffffff)),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 120 * fem -
                                                                extra[index],
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
                                                          SizedBox(
                                                            width: 38 * fem,
                                                            height: 45 * fem,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                if (memberlist[
                                                                            index]!
                                                                        .member_type ==
                                                                    1) {
                                                                  switchmemberposition(
                                                                      memberlist[
                                                                          index]!,
                                                                      2);
                                                                  setState(() {
                                                                    memberlist[
                                                                            index]!
                                                                        .member_type = 2;
                                                                  });
                                                                } else {
                                                                  switchmemberposition(
                                                                      memberlist[
                                                                          index]!,
                                                                      1);
                                                                  setState(() {
                                                                    memberlist[
                                                                            index]!
                                                                        .member_type = 1;
                                                                  });
                                                                }
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .keyboard_arrow_right_outlined,
                                                                color: Colors
                                                                    .white,
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
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          removedialog(
                                                                            statement:
                                                                                deletemember,
                                                                          )
                                                                        ],
                                                                      );
                                                                    });
                                                            if (deletemember) {
                                                              message =
                                                                  "remove successful";
                                                              await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return dialog(
                                                                      message:
                                                                          message,
                                                                    );
                                                                  }).whenComplete(() {
                                                                memberlist
                                                                    .removeAt(
                                                                        index);
                                                                showextra
                                                                    .removeAt(
                                                                        index);
                                                                extra.removeAt(
                                                                    index);
                                                              });
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .delete_outline,
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
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
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
                                                      color: const Color(
                                                          0xffffffff)),
                                                ),
                                                child: Material(
                                                  color:
                                                      const Color(0x00000000),
                                                  child: TextField(
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          60),
                                                    ],
                                                    maxLines: 1,
                                                    controller:
                                                        GroupMemberController,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    decoration:
                                                        const InputDecoration(
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.zero,
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
                                                    Navigator.pop(context);
                                                  },
                                                  child: SizedBox(
                                                    width: 60 * fem,
                                                    height: 30 * fem,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffffffff)),
                                                        color: const Color(
                                                            0x7fffffff),
                                                      ),
                                                      child: Text(
                                                        'ADD',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: const Color(
                                                              0xffffffff),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    GroupMemberController
                                                        .clear();
                                                    Navigator.pop(context);
                                                  },
                                                  child: SizedBox(
                                                    width: 60 * fem,
                                                    height: 30 * fem,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffffffff)),
                                                        color: const Color(
                                                            0x7fffffff),
                                                      ),
                                                      child: Text(
                                                        'CANCEL',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: const Color(
                                                              0xffffffff),
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
                                    bool user = await checkuserexist(
                                        GroupMemberController.text);
                                    if (user) {}
                                    bool exist = checksameuser(
                                        GroupMemberController.text);
                                    if (!exist && user) {
                                      setState(() {
                                        memberlist.add(Group_member.create(
                                            "new",
                                            "none",
                                            1,
                                            GroupMemberController.text));
                                        checkmessage = "User added";
                                        showextra.add(false);
                                        extra.add(0);
                                      });
                                    } else {
                                      setState(() {
                                        if (user) {
                                          checkmessage =
                                              "User already in group";
                                        } else {
                                          checkmessage = "User not exist";
                                        }
                                      });
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return dialog(message: checkmessage);
                                        });
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
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
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
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () async {
                                if (validatenull() == true) {
                                  await create(memberlist);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          children: [
                                            Container(
                                                child: LoadingAnimationWidget
                                                    .hexagonDots(
                                                        color: Colors.white,
                                                        size: 200)),
                                            dialog2(
                                              message: 'Updating, please wait',
                                            )
                                          ],
                                        );
                                      });
                                  await widget.refresh();
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            backgroundColor: Colors.black,
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 40),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25,
                                                      vertical: 30),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 14),
                                                  Text(
                                                    message ?? '',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 40),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  border: Border.all(
                                      color: const Color(0xff00ff19)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Create',
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
                              onPressed: () async {
                                Navigator.pop(context);
                                widget.refresh();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 180 * fem,
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
      ),
    );
  }
}

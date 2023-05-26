// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Services/Account_service.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class dialog extends StatelessWidget {
  final String? message;
  const dialog({super.key, this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            Text(
              message ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
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
    );
  }
}

class dialog2 extends StatelessWidget {
  final String? message;
  const dialog2({super.key, this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            Text(
              message ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class confirmationdialog extends StatelessWidget {
  final String? message;
  bool? statement;
  confirmationdialog({super.key, this.message, this.statement});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            const Text(
              'Please confirm before delete',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    statement = true;
                    Navigator.pop(context, statement);
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    statement = false;
                    Navigator.pop(context, statement);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class removedialog extends StatelessWidget {
  final String? message;
  bool? statement;
  removedialog({super.key, this.message, this.statement});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            const Text(
              'Please confirm before remove',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    statement = true;
                    Navigator.pop(context, statement);
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    statement = false;
                    Navigator.pop(context, statement);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class leavedialog extends StatelessWidget {
  final String? message;
  bool? statement;
  leavedialog({super.key, this.message, this.statement});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 14),
            const Text(
              'Please confirm before leave group',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    statement = true;
                    Navigator.pop(context, statement);
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    statement = false;
                    Navigator.pop(context, statement);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showdialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog(
          message: message,
        );
      });
}

void showprofile(BuildContext context, String uid) {
  User_Account? UserAccount;
  Future<void> getProfile() async {
    UserAccount = await Accountservice().GetProfile(uid: uid);
  }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white)),
            child: FutureBuilder(
              future: getProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      Container(
                          child: LoadingAnimationWidget.hexagonDots(
                              color: Colors.white, size: 100)),
                      const dialog2(
                        message: 'Loading, please wait',
                      )
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        "Profile",
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 25,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                          decorationColor: const Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.mail,
                                    color: Colors.white, size: 30)),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 220,
                              height: 50,
                              child: Text(
                                UserAccount?.email ?? '',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  decorationColor: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.person_outline,
                                    color: Colors.white, size: 30)),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 220,
                              height: 50,
                              child: Text(
                                UserAccount?.username ?? '',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  decorationColor: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.white)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.phone_android,
                                      color: Colors.white, size: 30)),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 220,
                                height: 50,
                                child: Text(
                                  UserAccount?.completephonenum ?? '',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                    color: const Color(0xffffffff),
                                    decorationColor: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.white)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.place,
                                      color: Colors.white, size: 30)),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 220,
                                height: 50,
                                child: Row(
                                  children: [
                                    if (UserAccount?.countrycode != '')
                                      Image.asset(
                                        'assets/flags/${UserAccount?.countrycode.toLowerCase()}.png',
                                        package: 'intl_phone_field',
                                        width: 32,
                                      ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    if (UserAccount?.countrycode != '')
                                      Text(
                                        countries[countries.indexWhere(
                                                (country) =>
                                                    country.code ==
                                                    UserAccount?.countrycode)]
                                            .name,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          color: const Color(0xffffffff),
                                          decorationColor:
                                              const Color(0xffffffff),
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
                  ],
                );
              },
            ),
          ),
        );
      });
}

// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/Account_service.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/Services/notification.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class ProfilePageEdit extends StatefulWidget {
  final User_Account? UserAccount;
  final changestate;
  final refreshpage;
  const ProfilePageEdit(
      {Key? key, this.UserAccount, this.changestate, this.refreshpage})
      : super(key: key);
  @override
  State<ProfilePageEdit> createState() => ProfileEdit(
      username: UserAccount!.username,
      completephonenum: UserAccount!.completephonenum,
      phonenum: UserAccount!.phonenum,
      countrycode: UserAccount!.countrycode);
}

class ProfileEdit extends State<ProfilePageEdit> {
  String? email;
  String? username;
  String? phonenum;
  String? completephonenum;
  String? countrycode;
  String? message;
  ProfileEdit(
      {Key? key,
      this.username,
      this.completephonenum,
      this.countrycode,
      this.phonenum});
  initState() {
    super.initState();
  }

  Future<void> update() async {
    message = await Accountservice().UpdateUser(
        completephonenum: completephonenum!,
        countrycode: countrycode!,
        phonenum: phonenum!,
        username: username!);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SizedBox(
      width: 360 * fem,
      child: SizedBox(
        // profilepageLmn (116:2)
        width: double.infinity,
        height: 800 * fem,
        child: Stack(
          children: [
            Positioned(
              // profileHeQ (116:18)
              left: 149.5 * fem,
              top: 121 * fem,
              child: Center(
                child: Align(
                  child: SizedBox(
                    width: 61 * fem,
                    height: 25 * fem,
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: const Color(0xffffffff),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // mailregister9gc (116:47)
              top: 183 * fem,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: const Icon(Icons.mail,
                                    color: Colors.white, size: 30)),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 280,
                              height: 50,
                              child: Text(
                                widget.UserAccount?.email ?? '',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  decorationColor: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: const Icon(Icons.person_outline,
                                    color: Colors.white, size: 30)),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 280,
                              height: 50,
                              child: Text(
                                username ?? '',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  decorationColor: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: const Icon(Icons.phone_android,
                                  color: Colors.white, size: 30)),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            width: 280,
                            height: 50,
                            child: IntlPhoneField(
                              autovalidateMode: AutovalidateMode.disabled,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                labelStyle: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xffffffff),
                                  decorationColor: const Color(0xffffffff),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 12 * ffem,
                                decoration: TextDecoration.none,
                                color: const Color(0xffffffff),
                                decorationColor: const Color(0xffffffff),
                              ),
                              initialCountryCode: countrycode ?? 'IN',
                              initialValue: phonenum ?? '',
                              onChanged: (phone) {
                                print(phone.number);
                                print(phone.completeNumber);
                                phonenum = phone.number;
                                completephonenum = phone.completeNumber;
                              },
                              onCountryChanged: (country) {
                                countrycode = country.code;
                                print('Country changed to: ' + country.code);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 260,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: const Icon(Icons.logout,
                                color: Colors.white, size: 30)),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 280,
                          height: 50,
                          child: TextButton(
                            onPressed: () async {
                              await update();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return dialog(
                                      message: message ?? '',
                                    );
                                  }).whenComplete(() {
                                widget.changestate(false);
                                widget.refreshpage(1);
                              });
                            },
                            child: Text(
                              'Save',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 20 * ffem,
                                decoration: TextDecoration.none,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: const Icon(Icons.logout,
                                color: Colors.white, size: 30)),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 280,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              widget.changestate(false);
                            },
                            child: Text(
                              'Cancel',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 20 * ffem,
                                decoration: TextDecoration.none,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

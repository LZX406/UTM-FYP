// ignore_for_file: camel_case_types, non_constant_identifier_names

class User_Account {
  final String password;
  final String email;
  final String username;
  final String uid;
  final String countrycode;
  final String? phonenum;
  final String? completephonenum;
  DateTime? lastlogin;
  bool ban;

  User_Account(
      {this.password = '',
      this.email = '',
      this.username = '',
      this.uid = '',
      this.lastlogin,
      this.countrycode = '',
      this.phonenum,
      this.completephonenum,
      this.ban = false});

  factory User_Account.AdminMap(map) {
    return User_Account(
      email: map['email'],
      password: map['password'],
      uid: map['uid'],
      username: map['username'],
    );
  }

  factory User_Account.Map(map) {
    return User_Account(
      email: map['email'],
      username: map['username'],
      uid: map['uid'],
      lastlogin: map['lastlogin'].toDate(),
      countrycode: map['countrycode'],
      phonenum: map['phonenum'],
      completephonenum: map['completephonenum'],
      ban: map['ban'],
    );
  }

  factory User_Account.create(map) {
    return User_Account(
      email: map['email'],
      password: map['password'],
      uid: map['uid'],
      username: map['username'],
      countrycode: map['countrycode'],
      phonenum: map['phonenum'],
      completephonenum: map['completephonenum'],
      lastlogin: map['lastlogin'].toDate(),
    );
  }
}

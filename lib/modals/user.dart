class User {
  final String? name;
  final String? email;
  final String? password;
  final String? passwordconfirmation;

  User({this.name, this.email, this.password, this.passwordconfirmation});

  factory User.fromJson(Map json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordconfirmation: json['password_confirmation'],
    );
  }

  Map toMap() {
    var map = new Map();
    map['name'] = name ?? "";
    map['email'] = email ?? "";
    map['password'] = password ?? "";
    map['password_confirmation'] = passwordconfirmation ?? "";

    return map;
  }
}

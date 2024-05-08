class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.userID,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userID: map['userID'] as String,
    );
  }
  String name;
  String email;
  String password;
  String? userID;

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? userID,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'userID': userID,
    };
  }
}
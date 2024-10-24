class UserModel {
  String? name, email;

  UserModel({this.name, this.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
    } as Map<String, dynamic>;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  String? email;
  String? password;
  String? confirmpassword;
  String? username;
  String? userType;
  String? profileImageUrl;

  Profile({
    this.email,
    this.password,
    this.confirmpassword,
    this.username,
    this.userType,
    this.profileImageUrl,
  });

  Profile copyWith({
    String? email,
    String? password,
    String? confirmpassword,
    String? username,
    String? userType,
    String? profileImageUrl,
  }) {
    return Profile(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
      username: username ?? this.username,
      userType: userType ?? this.userType,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'confirmpassword': confirmpassword,
      'username': username,
      'userType': userType,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      confirmpassword: map['confirmpassword'] != null
          ? map['confirmpassword'] as String
          : null,
      username: map['username'] != null ? map['username'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      profileImageUrl: map['profileImageUrl'] != null
          ? map['profileImageUrl'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(email: $email, password: $password, confirmpassword: $confirmpassword, username: $username, userType: $userType, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.confirmpassword == confirmpassword &&
        other.username == username &&
        other.userType == userType &&
        other.profileImageUrl == profileImageUrl;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        confirmpassword.hashCode ^
        username.hashCode ^
        userType.hashCode ^
        profileImageUrl.hashCode;
  }
}

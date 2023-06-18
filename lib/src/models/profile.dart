class Profile {
  String? email;
  String? password;
  String? confirmpassword;
  String? username;
  String? userType;
  String? profileImageUrl; // เพิ่มฟิลด์ profileImageUrl

  Profile({
    this.email,
    this.password,
    this.username,
    this.confirmpassword,
    this.profileImageUrl, // เพิ่มพารามิเตอร์ profileImageUrl
  });
}

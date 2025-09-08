class UserLogin {
  final String message;
  final String jwt;
  final String name;
  final String email;
  final String expireAt;

  UserLogin(
    this.message,
    this.jwt,
    this.name,
    this.email,
    this.expireAt,
  );

  /*factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      message: json['message'],
      jwt: json['jwt'],
      email: json['email'],
      expireAt: json['expireAt'],
    );
  }*/
}

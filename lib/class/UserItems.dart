class UserItems {
  final String jwt;
  final String name;
  final String last;
  final String email;
  final String mobile;
  final String register;
  final String subscription;
  final String status;

  UserItems(
      {required this.jwt,
      required this.name,
      required this.last,
      required this.email,
      required this.mobile,
      required this.register,
      required this.subscription,
      required this.status});

  factory UserItems.fromJson(Map<String, dynamic> json) {
    return UserItems(
      jwt: json['jwt'],
      name: json['first'],
      last: json['last'],
      email: json['email'],
      mobile: json['mobile'],
      register: json['register'],
      subscription: json['subscription'],
      status: json['status'],
    );
  }
}

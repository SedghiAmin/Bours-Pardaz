class Version {
  final String lastVersion;

  Version({
    required this.lastVersion,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      lastVersion: json['last'],
    );
  }
}

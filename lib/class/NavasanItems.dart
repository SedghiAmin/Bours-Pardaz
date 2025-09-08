class NavasanItems {
  final String symbol;
  final String vol;
  final String vol3D;
  final String pl;
  final String plp;
  final String pc;
  final String pcp;
  final String dt;

  NavasanItems(
      {required this.symbol,
      required this.vol,
      required this.vol3D,
      required this.pl,
      required this.plp,
      required this.pc,
      required this.pcp,
      required this.dt});

  factory NavasanItems.fromJson(Map<String, dynamic> json) {
    return NavasanItems(
      symbol: json['symbol'],
      vol: json['vol'],
      vol3D: json['vol3D'],
      pl: json['pl'],
      plp: json['plp'],
      pc: json['pc'],
      pcp: json['pcp'],
      dt: json['dt'],
    );
  }
}

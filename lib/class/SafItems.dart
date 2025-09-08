class SafItems {
  final String symbol;
  final String dvol;
  final String ovol;
  final String pcp;
  final String plp;
  final String vol;
  final String vol3D;
  final String dt;

  SafItems(
      {required this.symbol,
      required this.dvol,
      required this.ovol,
      required this.plp,
      required this.pcp,
      required this.vol,
      required this.vol3D,
      required this.dt});

  factory SafItems.fromJson(Map<String, dynamic> json) {
    return SafItems(
      symbol: json['symbol'],
      dvol: json['dvol'],
      ovol: json['ovol'],
      plp: json['plp'],
      pcp: json['pcp'],
      vol: json['vol'],
      vol3D: json['vol3D'],
      dt: json['dt'],
    );
  }
}

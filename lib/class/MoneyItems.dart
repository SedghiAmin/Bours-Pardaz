class MoneyItems {
  final String symbol;
  final String avgB;
  final String avgS;
  //final String vol;
  final String vol;
  final String vol3D;
  final String pl;
  final String plp;
  final String pc;
  final String pcp;
  final String dt;

  MoneyItems(
      {required this.symbol,
      required this.avgB,
      required this.avgS,
      //required this.vol,
      required this.vol,
      required this.vol3D,
      required this.pl,
      required this.plp,
      required this.pc,
      required this.pcp,
      required this.dt});

  factory MoneyItems.fromJson(Map<String, dynamic> json) {
    return MoneyItems(
      symbol: json['symbol'],
      avgB: json['avgB'],
      avgS: json['avgS'],
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

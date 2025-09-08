class TickItems {
  final String symbol;
  final String pf;
  final String pl;
  final String pmin;
  final String vol;
  final String vol3D;
  final String dt;

  TickItems(
      {required this.symbol,
      required this.pf,
      required this.pl,
      required this.pmin,
      required this.vol,
      required this.vol3D,
      required this.dt});

  factory TickItems.fromJson(Map<String, dynamic> json) {
    return TickItems(
      symbol: json['symbol'],
      pf: json['pf'],
      pl: json['pl'],
      pmin: json['pmin'],
      vol: json['vol'],
      vol3D: json['vol3D'],
      dt: json['dt'],
    );
  }
}

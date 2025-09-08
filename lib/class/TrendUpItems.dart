class TrendUpItems {
  final String symbol;
  final String pf;
  final String py;
  final String vol;
  final String vol3D;
  final String pl;
  final String plp;
  final String dt;

  TrendUpItems(
      {required this.symbol,
      required this.pf,
      required this.py,
      required this.vol,
      required this.vol3D,
      required this.pl,
      required this.plp,
      required this.dt});

  factory TrendUpItems.fromJson(Map<String, dynamic> json) {
    return TrendUpItems(
      symbol: json['symbol'],
      pf: json['pf'],
      py: json['py'],
      vol: json['vol'],
      vol3D: json['vol3D'],
      pl: json['pl'],
      plp: json['plp'],
      dt: json['dt'],
    );
  }
}

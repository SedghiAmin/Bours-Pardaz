class SusVolItems {
  final String symbol;
  final String volWW;
  final String volW;
  final String vol;
  final String vol3D;
  final String pl;
  final String plp;
  final String dt;

  SusVolItems(
      {required this.symbol,
      required this.volWW,
      required this.volW,
      required this.vol,
      required this.vol3D,
      required this.pl,
      required this.plp,
      required this.dt});

  factory SusVolItems.fromJson(Map<String, dynamic> json) {
    return SusVolItems(
      symbol: json['symbol'],
      volWW: json['volWW'],
      volW: json['volW'],
      vol: json['vol'],
      vol3D: json['vol3D'],
      pl: json['pl'],
      plp: json['plp'],
      dt: json['dt'],
    );
  }
}

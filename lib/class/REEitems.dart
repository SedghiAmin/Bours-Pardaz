class REEitems {
  final String symbol;
  final String emaF;
  final String emaS;
  final String rsi;
  final String dt;

  REEitems(
      {required this.symbol,
      required this.emaF,
      required this.emaS,
      required this.rsi,
      required this.dt});

  factory REEitems.fromJson(Map<String, dynamic> json) {
    return REEitems(
      symbol: json['symbol'],
      emaF: json['emaF'],
      emaS: json['emaS'],
      rsi: json['rsi'],
      dt: json['dt'],
    );
  }
}

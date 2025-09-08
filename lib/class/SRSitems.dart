class SRSitems {
  final String symbol;
  final String sma;
  final String rsi;
  final String main;
  final String signal;
  final String dt;

  SRSitems(
      {required this.symbol,
      required this.sma,
      required this.rsi,
      required this.main,
      required this.signal,
      required this.dt});

  factory SRSitems.fromJson(Map<String, dynamic> json) {
    return SRSitems(
      symbol: json['symbol'],
      sma: json['sma'],
      rsi: json['rsi'],
      main: json['main'],
      signal: json['signal'],
      dt: json['dt'],
    );
  }
}

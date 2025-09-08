class MESitems {
  final String symbol;
  final String sma;
  final String ema;
  final String macd;
  final String signal;
  final String stop;
  final String dt;

  MESitems(
      {required this.symbol,
      required this.sma,
      required this.ema,
      required this.macd,
      required this.signal,
      required this.stop,
      required this.dt});

  factory MESitems.fromJson(Map<String, dynamic> json) {
    return MESitems(
      symbol: json['symbol'],
      sma: json['sma'],
      ema: json['ema'],
      macd: json['macd'],
      signal: json['signal'],
      stop: json['stop'],
      dt: json['dt'],
    );
  }
}

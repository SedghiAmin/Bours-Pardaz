class RSEEitems {
  final String symbol;
  final String ema3;
  final String ema6;
  final String main;
  final String signal;
  final String rsi;
  final String dt;

  RSEEitems(
      {required this.symbol,
      required this.ema3,
      required this.ema6,
      required this.main,
      required this.signal,
      required this.rsi,
      required this.dt});

  factory RSEEitems.fromJson(Map<String, dynamic> json) {
    return RSEEitems(
      symbol: json['symbol'],
      ema3: json['ema3'],
      ema6: json['ema6'],
      main: json['main'],
      signal: json['signal'],
      rsi: json['rsi'],
      dt: json['dt'],
    );
  }
}

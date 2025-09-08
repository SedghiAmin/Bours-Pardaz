class AMitems {
  final String symbol;
  final String macd;
  final String signal;
  final String diPlus;
  final String diMinus;
  final String adx;
  final String dt;

  AMitems(
      {required this.symbol,
      required this.macd,
      required this.signal,
      required this.diPlus,
      required this.diMinus,
      required this.adx,
      required this.dt});

  factory AMitems.fromJson(Map<String, dynamic> json) {
    return AMitems(
      symbol: json['symbol'],
      macd: json['macd'],
      signal: json['signal'],
      diPlus: json['diPlus'],
      diMinus: json['diMinus'],
      adx: json['adx'],
      dt: json['dt'],
    );
  }
}

class MacdItems {
  final String symbol;
  final String macd;
  final String signal;
  final String dt;

  MacdItems(
      {required this.symbol,
      required this.macd,
      required this.signal,
      required this.dt});

  factory MacdItems.fromJson(Map<String, dynamic> json) {
    return MacdItems(
      symbol: json['symbol'],
      macd: json['macd'],
      signal: json['signal'],
      dt: json['dt'],
    );
  }
}

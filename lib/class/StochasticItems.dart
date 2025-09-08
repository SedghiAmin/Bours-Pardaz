class StochasticItems {
  final String symbol;
  final String main;
  final String signal;
  final String dt;

  StochasticItems(
      {required this.symbol,
      required this.main,
      required this.signal,
      required this.dt});

  factory StochasticItems.fromJson(Map<String, dynamic> json) {
    return StochasticItems(
      symbol: json['symbol'],
      main: json['main'],
      signal: json['signal'],
      dt: json['dt'],
    );
  }
}

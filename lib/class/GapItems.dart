class GapItems {
  final String symbol;
  final String low1;
  final String high1;
  final String low2;
  final String high2;
  final String dt;

  GapItems(
      {required this.symbol,
      required this.low1,
      required this.high1,
      required this.low2,
      required this.high2,
      required this.dt});

  factory GapItems.fromJson(Map<String, dynamic> json) {
    return GapItems(
      symbol: json['symbol'],
      low1: json['low0'],
      high1: json['high0'],
      low2: json['low1'],
      high2: json['high1'],
      dt: json['dt'],
    );
  }
}

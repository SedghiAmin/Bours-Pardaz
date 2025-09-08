class RsiItems {
  final String symbol;
  final String rsi;
  final String dt;

  RsiItems({required this.symbol, required this.rsi, required this.dt});

  factory RsiItems.fromJson(Map<String, dynamic> json) {
    return RsiItems(
      symbol: json['symbol'],
      rsi: json['rsi'],
      dt: json['dt'],
    );
  }
}

class BearItems {
  final String symbol;
  final String bearPower;
  final String dt;

  BearItems({required this.symbol, required this.bearPower, required this.dt});

  factory BearItems.fromJson(Map<String, dynamic> json) {
    return BearItems(
      symbol: json['symbol'],
      bearPower: json['bearPower'],
      dt: json['dt'],
    );
  }
}

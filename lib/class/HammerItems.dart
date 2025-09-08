class HammerItems {
  final String symbol;
  final String openn;
  final String klose;
  final String dt;

  HammerItems(
      {required this.symbol,
      required this.openn,
      required this.klose,
      required this.dt});

  factory HammerItems.fromJson(Map<String, dynamic> json) {
    return HammerItems(
      symbol: json['symbol'],
      openn: json['open'],
      klose: json['close'],
      dt: json['dt'],
    );
  }
}

class WprItems {
  final String symbol;
  final String wpr;
  final String dt;

  WprItems({required this.symbol, required this.wpr, required this.dt});

  factory WprItems.fromJson(Map<String, dynamic> json) {
    return WprItems(
      symbol: json['symbol'],
      wpr: json['wpr'],
      dt: json['dt'],
    );
  }
}

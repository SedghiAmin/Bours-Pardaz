class AdxItems {
  final String symbol;
  final String adx;
  final String plusDI;
  final String minusDI;
  final String dt;

  AdxItems(
      {required this.symbol,
      required this.adx,
      required this.plusDI,
      required this.minusDI,
      required this.dt});

  factory AdxItems.fromJson(Map<String, dynamic> json) {
    return AdxItems(
      symbol: json['symbol'],
      adx: json['adx'],
      plusDI: json['DI+'],
      minusDI: json['DI-'],
      dt: json['dt'],
    );
  }
}

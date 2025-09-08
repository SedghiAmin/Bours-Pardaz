class SarItems {
  final String symbol;
  final String sar;
  final String close;
  final String dt;

  SarItems(
      {required this.symbol,
      required this.sar,
      required this.close,
      required this.dt});

  factory SarItems.fromJson(Map<String, dynamic> json) {
    return SarItems(
      symbol: json['symbol'],
      sar: json['sar'],
      close: json['close'],
      dt: json['dt'],
    );
  }
}

class BRitems {
  final String symbol;
  final String rsi;
  final String lBand;
  final String closePrice;
  final String stopLost;
  final String dt;

  BRitems(
      {required this.symbol,
      required this.rsi,
      required this.lBand,
      required this.closePrice,
      required this.stopLost,
      required this.dt});

  factory BRitems.fromJson(Map<String, dynamic> json) {
    return BRitems(
      symbol: json['symbol'],
      rsi: json['rsi'],
      lBand: json['lband'],
      closePrice: json['close'],
      stopLost: json['stopLost'],
      dt: json['dt'],
    );
  }
}

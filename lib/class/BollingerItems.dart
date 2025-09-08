class BollingerItems {
  final String symbol;
  final String lBand;
  final String uBand;
  final String mBand;
  final String open;
  final String close;
  final String dt;

  BollingerItems(
      {required this.symbol,
      required this.lBand,
      required this.uBand,
      required this.mBand,
      required this.open,
      required this.close,
      required this.dt});

  factory BollingerItems.fromJson(Map<String, dynamic> json) {
    return BollingerItems(
      symbol: json['symbol'],
      lBand: json['lband'],
      uBand: json['uband'],
      mBand: json['mband'],
      open: json['open'],
      close: json['close'],
      dt: json['dt'],
    );
  }
}

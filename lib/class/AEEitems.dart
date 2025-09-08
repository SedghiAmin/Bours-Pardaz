class AEEitems {
  final String symbol;
  final String ema3;
  final String ema9;
  final String diPlus;
  final String diMinus;
  final String adx;
  final String dt;

  AEEitems(
      {required this.symbol,
      required this.ema3,
      required this.ema9,
      required this.diPlus,
      required this.diMinus,
      required this.adx,
      required this.dt});

  factory AEEitems.fromJson(Map<String, dynamic> json) {
    return AEEitems(
      symbol: json['symbol'],
      ema3: json['ema3'],
      ema9: json['ema9'],
      diPlus: json['diPlus'],
      diMinus: json['diMinus'],
      adx: json['adx'],
      dt: json['dt'],
    );
  }
}

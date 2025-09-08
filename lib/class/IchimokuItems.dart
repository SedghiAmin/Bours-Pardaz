class IchimokuItems {
  final String symbol;
  final String tSen;
  final String kSen;
  final String spanA;
  final String spanB;
  final String chikou;
  final String strategy;
  final String high;
  final String low;
  final String close;
  final String dt;

  IchimokuItems(
      {required this.symbol,
      required this.tSen,
      required this.kSen,
      required this.spanA,
      required this.spanB,
      required this.chikou,
      required this.strategy,
      required this.high,
      required this.low,
      required this.close,
      required this.dt});

  factory IchimokuItems.fromJson(Map<String, dynamic> json) {
    return IchimokuItems(
      symbol: json['symbol'],
      tSen: json['tenkenSen'],
      kSen: json['kijunSen'],
      spanA: json['spanA'],
      spanB: json['spanB'],
      chikou: json['chikou'],
      strategy: json['strategy'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      dt: json['dt'],
    );
  }
}

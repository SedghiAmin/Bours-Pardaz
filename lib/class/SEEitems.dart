class SEEitems {
  final String symbol;
  final String enter;
  final String stop;
  final String target;
  final String dt;

  SEEitems(
      {required this.symbol,
      required this.enter,
      required this.stop,
      required this.target,
      required this.dt});

  factory SEEitems.fromJson(Map<String, dynamic> json) {
    return SEEitems(
      symbol: json['symbol'],
      enter: json['enter'],
      stop: json['stop'],
      target: json['target'],
      dt: json['dt'],
    );
  }
}

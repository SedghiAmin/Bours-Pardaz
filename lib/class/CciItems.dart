class CciItems {
  final String symbol;
  final String cciFast;
  final String cci;
  final String dt;

  CciItems({required this.symbol, required this.cciFast, required this.cci, required this.dt});

  factory CciItems.fromJson(Map<String, dynamic> json) {
    return CciItems(
      symbol: json['symbol'],
      cciFast: json['cciFast'],
      cci: json['cci'],
      dt: json['dt'],
    );
  }
}

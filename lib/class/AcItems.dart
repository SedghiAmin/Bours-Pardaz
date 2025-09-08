class AcItems {
  final String symbol;
  final String ac;
  final String dt;

  AcItems({required this.symbol, required this.ac, required this.dt});

  factory AcItems.fromJson(Map<String, dynamic> json) {
    return AcItems(
      symbol: json['symbol'],
      ac: json['ac'],
      dt: json['dt'],
    );
  }
}

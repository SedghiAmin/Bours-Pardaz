class MfiItems {
  final String symbol;
  final String mfi;
  final String dt;

  MfiItems({required this.symbol, required this.mfi, required this.dt});

  factory MfiItems.fromJson(Map<String, dynamic> json) {
    return MfiItems(
      symbol: json['symbol'],
      mfi: json['mfi'],
      dt: json['dt'],
    );
  }
}

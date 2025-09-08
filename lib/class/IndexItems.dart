class IndexItems {
  final String symbol;
  final String value;
  final String dif;
  final String prc;

  IndexItems({required this.symbol, required this.value, required this.dif, required this.prc});

  factory IndexItems.fromJson(Map<String, dynamic> json) {
    return IndexItems(
      symbol: json['Symbol'],
      value: json['value'],
      dif: json['different'],
      prc: json['percentage'],
    );
  }
}

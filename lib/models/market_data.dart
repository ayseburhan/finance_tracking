class MarketData {
  final String symbol;
  final double price;
  final double changePercent;
  final DateTime updateTime;

  MarketData({
    required this.symbol,
    required this.price,
    this.changePercent = 0.0, 
    required this.updateTime,
  });
  
  factory MarketData.fromJson(String symbol, dynamic value) {
    return MarketData(
      symbol: symbol,
      price: (value as num).toDouble(),
      changePercent: 0.0,
      updateTime: DateTime.now(),
    );
  }
}

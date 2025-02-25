class TickerEntity {
  final String symbol;
  final String name;
  final String logo;
  final String price;
  final String change;
  final String changePercent;
  final String volume;
  final String marketCap;
  final String circulatingSupply;
  final String totalSupply;
  final String maxSupply;
  final String ath;
  final String athChangePercent;
  final String athDate;
  final String atl;
  final String atlChangePercent;
  final String atlDate;
  final String roi;
  final String lastUpdated;

  TickerEntity({
    required this.symbol,
    required this.name,
    required this.logo,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.volume,
    required this.marketCap,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercent,
    required this.athDate,
    required this.atl,
    required this.atlChangePercent,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
  });
}

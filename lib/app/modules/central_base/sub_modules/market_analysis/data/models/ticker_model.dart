class TickerModel {
  TickerModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final int? marketCap;
  final int? marketCapRank;
  final int? fullyDilutedValuation;
  final int? totalVolume;
  final double? high24H;
  final double? low24H;
  final double? priceChange24H;
  final double? priceChangePercentage24H;
  final double? marketCapChange24H;
  final double? marketCapChangePercentage24H;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final dynamic roi;
  final DateTime? lastUpdated;
}

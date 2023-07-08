import '../models/ticker_model.dart';

abstract interface class GetTickersDatasource {
  Future<List<TickerModel>> getTickers();
}

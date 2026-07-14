import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/home/data/models/offer_model.dart';

class OffersRepository {
  OffersRepository(this._apiService);

  final ApiService _apiService;
  Future<List<OfferModel>>? _offersFuture;

  Future<List<OfferModel>> getOffers() {
    return _offersFuture ??= _fetchOffers();
  }

  Future<List<OfferModel>> _fetchOffers() async {
    try {
      final response = await _apiService.get(EndPoints.offers);
      final offers = (response as Map<String, dynamic>)['offers']
          as Map<String, dynamic>;
      final items = offers['items'] as List;
      return items
          .map((item) => OfferModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      _offersFuture = null;
      rethrow;
    }
  }
}

import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/features/home/data/models/offer_model.dart';
import 'package:trendiva/features/home/domain/entities/offer_entity.dart';
import 'package:trendiva/features/home/domain/repos/offers_repository.dart';

class OffersRepositoryImpl implements OffersRepository {
  OffersRepositoryImpl(this._apiService);

  final ApiService _apiService;
  Future<List<OfferEntity>>? _offersFuture;

  @override
  Future<List<OfferEntity>> getOffers() {
    return _offersFuture ??= _fetchOffers();
  }

  Future<List<OfferEntity>> _fetchOffers() async {
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

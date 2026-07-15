import 'package:trendiva/features/home/domain/entities/offer_entity.dart';

abstract class OffersRepository {
  Future<List<OfferEntity>> getOffers();
}

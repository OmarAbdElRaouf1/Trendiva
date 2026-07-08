import 'package:trendiva/features/home/data/models/product_model.dart';

class ProductsRepository {
  Future<List<ProductModel>> getProducts() async {
    return _products;
  }

  static const _products = [
    ProductModel(
      brand: 'Luxe Watch Co.',
      name: 'Emerald Heritage Watch',
      price: 249.00,
      oldPrice: 320.00,
      image: 'assets/images/watch.png',
      rating: 4.9,
      reviewCount: 124,
      description:
          'The Emerald Heritage Watch is a masterclass in effortless '
          'sophistication. Crafted from our signature heavy-weight movement, '
          'it features a fluid silhouette that contours gracefully to the '
          'wrist. Perfect for both high-end social gatherings and refined '
          'evening wear, this piece embodies the Trendiva ethos of luxury and '
          'modern utility.',
      reviews: [
        Review(
          author: 'Sarah J.',
          timeAgo: '2 days ago',
          rating: 5,
          comment:
              'The quality is exceptional. It fits perfectly and the emerald '
              'tone is even more stunning in person. I wore it to a wedding '
              'and received so many compliments!',
          helpfulCount: 12,
        ),
        Review(
          author: 'Michael R.',
          timeAgo: '1 week ago',
          rating: 5,
          comment:
              'Bought this for my wife and she absolutely loves it. The '
              'craftsmanship of the piece is very high-end. Worth every penny.',
          helpfulCount: 8,
        ),
      ],
    ),
    ProductModel(
      brand: 'Maison Paris',
      name: 'Minimalist Satchel',
      price: 420.00,
      oldPrice: 490.00,
      image: 'assets/images/bag.png',
      rating: 4.8,
      reviewCount: 96,
      description:
          'The Minimalist Satchel blends timeless design with everyday '
          'practicality. Handcrafted from premium full-grain leather, it '
          'offers generous storage without compromising its clean, elegant '
          'silhouette. A refined companion for work and travel alike.',
      reviews: [
        Review(
          author: 'Emma L.',
          timeAgo: '3 days ago',
          rating: 5,
          comment:
              'Absolutely beautiful bag. The leather feels premium and it '
              'holds so much more than it looks. My new everyday carry.',
          helpfulCount: 15,
        ),
        Review(
          author: 'Daniel K.',
          timeAgo: '2 weeks ago',
          rating: 4,
          comment:
              'Great quality and design. Slightly heavier than expected but '
              'the build feels like it will last for years.',
          helpfulCount: 5,
        ),
      ],
    ),
    ProductModel(
      brand: 'Urban Step',
      name: 'City Drift Sneakers',
      price: 185.00,
      oldPrice: 210.00,
      image: 'assets/images/shoes.png',
      rating: 4.7,
      reviewCount: 210,
      description:
          'City Drift Sneakers are engineered for all-day comfort with a '
          'lightweight cushioned sole and breathable knit upper. A versatile '
          'silhouette that transitions effortlessly from the morning commute '
          'to the evening out.',
      reviews: [
        Review(
          author: 'Jason M.',
          timeAgo: '1 day ago',
          rating: 5,
          comment:
              'Most comfortable sneakers I have owned. True to size and the '
              'cushioning is incredible for long walks.',
          helpfulCount: 20,
        ),
        Review(
          author: 'Olivia P.',
          timeAgo: '5 days ago',
          rating: 4,
          comment:
              'Stylish and comfortable. They go with everything in my '
              'wardrobe. Took a day to break in.',
          helpfulCount: 7,
        ),
      ],
    ),
    ProductModel(
      brand: 'Botanica',
      name: 'Glow Serum Complex',
      price: 88.00,
      oldPrice: 110.00,
      image: 'assets/images/medical.png',
      rating: 4.9,
      reviewCount: 158,
      description:
          'The Glow Serum Complex is a lightweight, fast-absorbing formula '
          'powered by botanical actives and vitamin C. It brightens, hydrates '
          'and restores radiance for a smooth, luminous complexion with '
          'consistent daily use.',
      reviews: [
        Review(
          author: 'Nadia H.',
          timeAgo: '4 days ago',
          rating: 5,
          comment:
              'My skin has never looked better. Noticed a visible glow within '
              'the first week. A little goes a long way.',
          helpfulCount: 18,
        ),
        Review(
          author: 'Chris T.',
          timeAgo: '3 weeks ago',
          rating: 5,
          comment:
              'Lightweight and non-greasy. Absorbs quickly and pairs well '
              'under moisturizer. Highly recommend.',
          helpfulCount: 9,
        ),
      ],
    ),
  ];
}

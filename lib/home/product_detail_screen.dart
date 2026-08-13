import 'package:flutter/material.dart';

/// Product Detail screen matching the provided mockup.
/// Drop this file into your Flutter project (e.g. lib/features/product/presentation/screens/)
/// and adapt the model/fields to your existing product entity.
class ProductDetailScreen extends StatefulWidget {
  final ProductDetailArgs product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? _selectedSize;
  int _selectedColorIndex = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ---- Top bar ----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  const Expanded(
                    child: Text(
                      'Product Detail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => _isFavorite = !_isFavorite),
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.redAccent : Colors.black87,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: navigate to cart
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            ),

            // ---- Scrollable content ----
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AspectRatio(
                        aspectRatio: 272 / 362,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: product.imageUrl != null
                              ? Image.network(
                                  product.imageUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      _imagePlaceholder(),
                                )
                              : _imagePlaceholder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand + rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.brand,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    product.rating.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Title
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Price row
                          Row(
                            children: [
                              Text(
                                '\$${product.originalPrice.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '\$${product.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (product.discountPercent != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${product.discountPercent}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              const Spacer(),
                              Text(
                                '${product.soldCount}+ Sold',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Size + Color row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Size selector
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Size',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      children: product.sizes.map((size) {
                                        final selected = _selectedSize == size;
                                        return GestureDetector(
                                          onTap: () => setState(
                                            () => _selectedSize = size,
                                          ),
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: selected
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              border: Border.all(
                                                color: selected
                                                    ? Colors.black
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            child: Text(
                                              size,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: selected
                                                    ? Colors.white
                                                    : Colors.black87,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),

                              // Color selector
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Color',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: product.colors
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                            final index = entry.key;
                                            final color = entry.value;
                                            final selected =
                                                _selectedColorIndex == index;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              child: GestureDetector(
                                                onTap: () => setState(
                                                  () => _selectedColorIndex =
                                                      index,
                                                ),
                                                child: Container(
                                                  width: 22,
                                                  height: 22,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: color,
                                                    border: Border.all(
                                                      color: selected
                                                          ? Colors.black
                                                          : Colors.transparent,
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Description
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product.description,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---- Bottom action bar ----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: add to cart
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'Add Cart',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: buy now flow
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C83FD),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: Colors.grey.shade100,
      child: const Center(
        child: Icon(Icons.image_outlined, size: 48, color: Colors.grey),
      ),
    );
  }
}

/// Simple data holder for this screen's preview/demo.
/// Replace with your existing product entity from the domain layer.
class ProductDetailArgs {
  final String brand;
  final String name;
  final double rating;
  final double price;
  final double originalPrice;
  final int? discountPercent;
  final int soldCount;
  final List<String> sizes;
  final List<Color> colors;
  final String description;
  final String? imageUrl;

  const ProductDetailArgs({
    required this.brand,
    required this.name,
    required this.rating,
    required this.price,
    required this.originalPrice,
    this.discountPercent,
    required this.soldCount,
    required this.sizes,
    required this.colors,
    required this.description,
    this.imageUrl,
  });
}

// ---- Example usage / preview ----
class ProductDetailPreviewApp extends StatelessWidget {
  const ProductDetailPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailScreen(
        product: ProductDetailArgs(
          brand: 'H&M',
          name: 'T-Shirt Tomorrow',
          rating: 4.3,
          price: 90,
          originalPrice: 100,
          discountPercent: 10,
          soldCount: 100,
          sizes: const ['S', 'M', 'L', 'XL'],
          colors: const [
            Colors.black,
            Colors.indigo,
            Colors.brown,
            Colors.grey,
          ],
          description:
              'Stay stylish and comfortable with this modern jacket, designed '
              'for everyday wear and all season versatility. Made from '
              'high-quality materials, it offers a comfortable fit while '
              'providing warmth and durability. The jacket features a sleek '
              'design with a front zipper closure, practical pockets for '
              'convenience, and a fashionable look that pairs perfectly with '
              'jeans, trousers, or casual outfits.',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  
  static const double _discount = 10.99;
  static const double _delivery = 1.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                itemCount:6,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return _CartItemCard(
                  
                    onIncrement: () => "",
                    onDecrement: () => "",
                    onRemove: () =>"",
                  );
                },
              ),
            ),
            _buildSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 28),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          const Text(
            'Product Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SummaryRow(label: 'Total', value: 100),
          const SizedBox(height: 8),
          _SummaryRow(label: 'Discount', value: _discount),
          const SizedBox(height: 8),
          _SummaryRow(label: 'Delivery', value: _delivery),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, color: Color(0xFFE5E5E5)),
          ),
          _SummaryRow(
            label: 'Sub Total',
            value: 100,
            bold: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B8FE8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Check Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  final String label;
  final double value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 15,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
      color: Colors.black,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text('\$${value.toStringAsFixed(2)}', style: style),
      ],
    );
  }
}

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFEFEF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildThumbnail(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                       "Name",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFDECEC),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          size: 16,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${"Price"}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Size : ${"Size"}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                
                  Text(
                    'Color : ${"Color"}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: _QuantityStepper(
                    quantity: 1,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child:
      //  item.imageUrl != null
      //     ? Image.network(
      //         item.imageUrl!,
      //         fit: BoxFit.cover,
      //         errorBuilder: (_, __, ___) =>
      //             const Icon(Icons.image_outlined, color: Colors.grey),
      //       )
      //     : const 
          Icon(Icons.checkroom_outlined, color: Colors.grey),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperButton(icon: Icons.remove, onTap: onDecrement),
          SizedBox(
            width: 24,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _StepperButton(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: 14, color: Colors.black87),
      ),
    );
  }
}
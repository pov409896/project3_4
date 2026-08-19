import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project3_5/bloc/product_bloc.dart';
import 'package:project3_5/bloc/product_event.dart';
import 'package:project3_5/bloc/product_state.dart';
import 'package:project3_5/home/product_cart.dart';
import 'package:project3_5/model/product_model.dart';
import 'package:project3_5/util/app_text.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = "";
  String _selectColore = "";
  bool _isFavorite = false;

  void addToCart() {
    final quantity = context.read<ProductBloc>().state.quantity;
    if (_selectedSize.isEmpty) {
      Get.snackbar("Message", "Please Select Size");
      return;
    }
    if (_selectColore.isEmpty) {
      Get.snackbar("Message", "Please Select Color");
      return;
    }
    context.read<ProductBloc>().add(
      AddCartEvent(
        product: widget.product,
        color: _selectColore,
        quantity: quantity,
        size: _selectedSize,
      ),
    );
    log(
      "Name : ${widget.product.name}\nColors : ${_selectColore}\nSize : ${_selectedSize}\nQuantity : ${quantity}",
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(ProductCart());
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          return Positioned(
                            right: 10,
                            top: 5,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                state.cartModel.length.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: widget.product.image != null
                              ? Image.network(
                                  widget.product.image!,
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
                                widget.product.category,
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
                                    widget.product.rate,
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
                          BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  Text(
                                    widget.product.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<ProductBloc>().add(
                                          IncrementEvent(),
                                        );
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  AppText(text: state.quantity.toString()),
                                  SizedBox(width: 5),
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<ProductBloc>().add(
                                          DescrementEvent(),
                                        );
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 8),

                          // Price row
                          Row(
                            children: [
                              Text(
                                '\$${widget.product.oldprice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '\$${widget.product.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (widget.product.discount != null)
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
                                    '${widget.product.discount}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              const Spacer(),
                              Text(
                                '${widget.product.price}+ Sold',
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
                                      children: widget.product.size.map((size) {
                                        final selected = _selectedSize == size;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedSize = size;
                                            });
                                          },
                                          child: Container(
                                            width: 32,
                                            height: 32,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: selected
                                                  ? Colors.black
                                                  : Colors.white,
                                              border: Border.all(
                                                color: selected
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ),
                                            child: Text(
                                              size,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: selected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              // Spacer(),
                              // Color selector
                              Column(
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
                                    children: widget.product.color.map((value) {
                                      final selectColor =
                                          _selectColore == value;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectColore = value;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: selectColor
                                                    ? Colors.yellowAccent
                                                    : Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: _CustomeColor(value),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
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
                            widget.product.description,
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
                          addToCart();
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
                          Get.to(ProductCart());
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

  _CustomeColor(String text) {
    final white = text.toLowerCase();
    switch (text) {
      case "white":
      case "White":
        return Colors.white;
      case "blue":
      case "Blue":
        return Colors.blue;
      case "black":
      case "Black":
        return Colors.black;
    }
  }
}

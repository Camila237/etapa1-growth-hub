import 'package:flutter/material.dart';
import 'package:etapa1/data/entities/product_model.dart';
import 'package:etapa1/domain/constants/app_constants.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';

/// * Class that represents a custom card to display a product.
class CustomCard extends StatelessWidget {
  /// * Element that will be displayed in the card.
  final ProductModel? element;
  const CustomCard({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    /// * Height of the card.
    final double cardHeight = MediaQuery.of(context).size.width * 0.3;
    final double imageHeight = cardHeight * 0.6;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSize24),
      ),
      color: kWhite,
      elevation: kSize2,
      child: Column(
        children: [
          Expanded(
            /// * Image of the card.
            child: SizedBox(
              height: imageHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kSize24),
                child: Image.network(
                  element?.image ?? urlPlaceholder,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          /// * Information of the card.
          Padding(
            padding: const EdgeInsets.all(kSize10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        element?.title ?? '',
                        style: const TextStyle(
                          fontSize: kSize16,
                          color: kBlack,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: kSize10),
                    Text(
                      "\$ ${element?.price ?? 0}",
                      style: const TextStyle(
                        fontSize: kSize14,
                        color: kBlack,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: kSize4),
                Row(
                  children: [
                    const Icon(Icons.star, color: kYellow, size: kSize20),
                    const SizedBox(width: kSize6),
                    Text(
                      element?.rating.rate.toString() ?? '0',
                      style: const TextStyle(
                        fontSize: kSize14,
                        color: kBlack,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
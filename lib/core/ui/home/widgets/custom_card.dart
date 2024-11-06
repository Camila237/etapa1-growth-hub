import 'package:flutter/material.dart';
import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';

class CustomCard extends StatelessWidget {
  final ProductModel element;
  const CustomCard({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
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
            child: SizedBox(
              height: imageHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kSize24),
                child: Image.network(
                  element.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kSize10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        element.title,
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
                      "\$ ${element.price}",
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
                      element.rating.rate.toString(),
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
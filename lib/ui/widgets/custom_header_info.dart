part of '../screens/detail_screen.dart';

/// * Class that represents the header information of the detail screen.
class CustomHeaderInfo extends StatelessWidget {
  /// * Product that will be displayed.
  final ProductModel product;
  const CustomHeaderInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSize20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: kBlack,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: kSize10),
                Row(
                  children: [
                    const Icon(Icons.star, color: kYellow),
                    Text(
                      product.rating.rate.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: kBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: kSize20),
          Text(
            "\$ ${product.price}",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: kYellow,
              fontWeight: FontWeight.w700,
              fontSize: kSize16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
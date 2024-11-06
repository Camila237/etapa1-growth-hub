import 'package:etapa1/share/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel? product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        body: product == null
            ? const CustomErrorNavigation()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 450,
                        child: Center(
                          child: Image.network(
                            product!.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: kCrayola,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Flexible(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: _headerInfo(context, product),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(kSize20),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              _otherInfo(context, product),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
Widget _headerInfo(BuildContext context, ProductModel? product) => Padding(
      padding: const EdgeInsets.all(kSize20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product!.title,
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
List<Widget> _otherInfo(BuildContext context, ProductModel? product) => [
  Row(
    children: [
      Text(
        'Category: ',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: kTan),
      ),
      const SizedBox(
        width: kSize6,
      ),
      Text(
        product!.category,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: kBlack),
      )
    ],
  ),
  const SizedBox(
    height: kSize10,
  ),
  Text(
    product.description,
    style: Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: kBlack),
  ),
  const SizedBox(
    height: kSize20,
  ),
  _footerButton(context, product),
];
Widget _footerButton(BuildContext context, ProductModel? product) => Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    CustomElevatedButton(
      onPressed:() => Navigator.pushNamed(
        context,
        kEditScreen,
        arguments: product,
      ),
      styleBtn: AppStyles.basicRoundedButton(
        radius: kSize20,
        colorBg: kTan,
        elevation: kSize2,
        colorBorder: kTan,
        colorText: kWhite,
      ),
      text: 'Edit',
      icon: const Icon(Icons.edit,
          color: kWhite, size: kSize16),
      styleText: Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(
      color: kWhite,
      fontWeight: FontWeight.w600,
    ),
    ),
    /*ElevatedButton(
      onPressed: () => Navigator.pushNamed(
        context,
        kEditScreen,
        arguments: product,
      ),
      style: AppStyles.basicRoundedButton(
        radius: kSize20,
        colorBg: kTan,
        elevation: kSize2,
        colorBorder: kTan,
        colorText: kWhite,
      ),
      child: Row(
        children: [
          const Icon(Icons.edit,
              color: kWhite, size: kSize16),
          const SizedBox(width: kSize4),
          Text(
            'Edit',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(
              color: kWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),*/
    const SizedBox(width: kSize20),
    _deleteButton(context, product),
  ],
);
Widget _deleteButton(BuildContext context, ProductModel? product) => CustomElevatedButton(
  onPressed: () async {
    final bool? confirm = await _showConfirmationDialog(context);
    if (confirm == true) {
      final updateProducts = Provider.of<GlobalAppProvider>(
        context,
        listen: false,
      ).deleteProduct(product!.id);
      Navigator.pushNamed(context, kHomeScreen, arguments: updateProducts);
    }
  },
  styleBtn: AppStyles.basicRoundedButton(
    colorBg: kWhite,
    radius: kSize20,
    widthSide: kSize2,
    colorBorder: kTan,
    colorText: kTan,
  ),
  text: 'Delete',
  icon: const Icon(Icons.delete, color: kTan, size: kSize16),
  styleText: Theme.of(context).textTheme.labelLarge!.copyWith(
    color: kTan,
    fontWeight: FontWeight.bold,
  ),
);
Future<bool?> _showConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Center(
        child: Text(
          'Confirm Delete',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: kTan,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Text(
        'Are you sure you want to delete this product?',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: kBlack,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        _dialogButton(context, 'Cancel', kGrey, false),
        _dialogButton(context, 'Delete', kBrown, true),
      ],
    ),
  );
}
Widget _dialogButton(BuildContext context, String text, Color color, bool result) {
  return TextButton(
    onPressed: () => Navigator.pop(context, result),
    child: Text(
      text,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
        color: color,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

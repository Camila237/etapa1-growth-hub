import 'package:flutter/material.dart';

import 'package:etapa1/share/exports.dart';
import 'package:etapa1/share/helpers/custom_dialogs.dart';
import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';
import 'package:provider/provider.dart';

part '../../../share/widgets/custom_header_info.dart';
part '../../../share/widgets/custom_footer_buttons.dart';
class DetailScreen extends StatefulWidget {
  final ProductModel? product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late ProductModel? product;

  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  void updateProduct(ProductModel updatedProduct) {
    setState(() {
      product = updatedProduct;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        body: widget.product == null
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
                          child: CustomHeaderInfo(product: product!,),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(kSize20),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                                [
                                  Row(
                                    children: [
                                      Text(
                                        'Categoría: ',
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
                                    product!.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: kBlack),
                                  ),
                                  const SizedBox(
                                    height: kSize20,
                                  ),
                                  CustomFooterButtons(
                                    product: product!,
                                    onProductUpdated: updateProduct,
                                  ),
                                ]
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

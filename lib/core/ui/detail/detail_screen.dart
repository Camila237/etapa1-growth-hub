import 'package:etapa1/share/exports.dart';
import 'package:etapa1/share/helpers/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';

part 'widgets/header_info.dart';
part 'widgets/footer_buttons.dart';
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
                          child: HeaderInfo(product: product!,),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(kSize20),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                                [
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
                                    product!.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: kBlack),
                                  ),
                                  const SizedBox(
                                    height: kSize20,
                                  ),
                                  FooterButtons(product: product!),
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

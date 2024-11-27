import 'package:etapa1/data/entities/product_model.dart';
import 'package:etapa1/domain/helpers/custom_dialogs.dart';
import 'package:etapa1/domain/router/router_constants.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';
import 'package:etapa1/domain/themes/app_styles.dart';
import 'package:etapa1/ui/provider/products_provider.dart';
import 'package:etapa1/ui/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


part '../../widgets/data/custom_header_info.dart';
part '../../widgets/data/custom_footer_buttons.dart';

/// * Screen to display the details of a product.
/// * This screen displays detailed information about a product and allows you to perform specific actions such as refreshing or navigating back.
class DetailScreen extends StatefulWidget {
  /// * The product whose details will be displayed.
  final ProductModel? product;

  /// * Constructor for [DetailScreen].
  /// * [product] is the product model. It can be `null` to handle cases where there is no product available.
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late ProductModel? product;

  @override
  void initState() {
    /// * Initializes the [product] variable with the product received from the widget.
    product = widget.product;
    super.initState();
  }

  /// * Updates the product displayed on the screen.
  /// * [updatedProduct] is the updated product that will replace the current one.
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
                  /// * Displays a product image with a back button.
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
                  /// * Displays detailed information and buttons related to the product.
                  Flexible(
                    child: CustomScrollView(
                      slivers: [
                        /// * Header with main product information.
                        SliverToBoxAdapter(
                          child: CustomHeaderInfo(
                            product: product ?? ProductModel.dataDefault,
                          ),
                        ),
                        /// * Additional product information and action buttons.
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
                                    Flexible(
                                      child: Text(
                                        product!.category,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: kBlack),
                                      ),
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
                                /// * Action buttons (update, delete).
                                CustomFooterButtons(
                                  product: product!,
                                  onProductUpdated: updateProduct,
                                ),
                              ],
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

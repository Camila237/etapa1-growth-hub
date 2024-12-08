part of '../screens/detail_screen.dart';

/// * Class that represents the footer buttons of the detail screen.
class CustomFooterButtons extends StatelessWidget {
  /// * Product that will be updated.
  final ProductModel product;
  /// * Function that will be executed when the product is updated.
  final Function(ProductModel) onProductUpdated;
  const CustomFooterButtons({super.key, required this.product, required this.onProductUpdated});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onPressed: () async {
            List<ProductModel>? listUpdated = await Navigator.pushNamed(
              context,
              kEditScreen,
              arguments: product,
            ) as List<ProductModel>?;

            if (listUpdated != null) {
              for (ProductModel updatedProduct in listUpdated) {
                if (updatedProduct.id == product.id) {
                  onProductUpdated(updatedProduct);
                  break;
                }
              }
            }
          },
          styleBtn: AppStyles.basicRoundedButton(
            radius: kSize20,
            colorBg: kTan,
            elevation: kSize2,
            colorBorder: kTan,
            colorText: kWhite,
          ),
          text: 'Editar',
          icon: const Icon(Icons.edit, color: kWhite, size: kSize16),
          styleText: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kWhite,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(width: kSize20),
        CustomElevatedButton(
          onPressed: () async {
            final bool? confirm = await _showConfirmationDialog(context);
            if (confirm == true) {
              final provider = Provider.of<ProductsProvider>(context, listen: false);
              provider.deleteProduct(product.id);
              Navigator.pop(context);
            }
          },
          styleBtn: AppStyles.basicRoundedButton(
            colorBg: kWhite,
            radius: kSize20,
            widthSide: kSize2,
            colorBorder: kTan,
            colorText: kTan,
          ),
          text: 'Eliminar',
          icon: const Icon(Icons.delete, color: kTan, size: kSize16),
          styleText: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kTan,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

Future<bool?> _showConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => CustomDialogs.basic(
      context,
      'Eliminar un producto',
      '¿Estás seguro que quieres eliminar este producto?',
      [
        CustomTextButton(onPressed: () => Navigator.pop(context, false), text:  'Cancelar', colorText: kGrey),
        CustomTextButton(onPressed: () => Navigator.pop(context, true), text:  'Eliminar', colorText: kBrown),
      ],
    ),
  );
}

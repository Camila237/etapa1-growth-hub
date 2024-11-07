part of '../detail_screen.dart';

class FooterButtons extends StatelessWidget {
  final ProductModel product;

  const FooterButtons({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onPressed: () => Navigator.pushNamed(
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
              final updateProducts = Provider.of<GlobalAppProvider>(
                context,
                listen: false,
              ).deleteProduct(product.id);
              Navigator.pushNamed(context, kHomeScreen,
                  arguments: updateProducts);
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
      'Confirm Delete',
      'Are you sure you want to delete this product?',
      [
        CustomTextButton(onPressed: () => Navigator.pop(context, false), text:  'Cancel', colorText: kGrey),
        CustomTextButton(onPressed: () => Navigator.pop(context, true), text:  'Delete', colorText: kBrown),
        // _dialogButton(context, 'Delete', kBrown, true),
      ],
    ),
  );
}

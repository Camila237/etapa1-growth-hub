import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/data/entities/product_model.dart';
import 'package:etapa1/domain/router/router_constants.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';
import 'package:etapa1/ui/provider/products_provider.dart';
import 'package:etapa1/ui/widgets/exports.dart';

/// * Screen to display the list of products.
/// * This screen displays a list of products in a grid view and allows you to navigate to the details of each product.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    /// * Loads the products when the screen is initialized.
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    provider.loadProducts();
  }

  /// * Determines the number of cards to display based on the screen width.
  int _numberCards(double width) {
    if (width < 600) {
      return 2;
    } else if (width < 900) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// * Provider to manage products logic.
    final provider = Provider.of<ProductsProvider>(context);
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          /// * Displays a loading indicator while the products are being loaded.
          if (provider.isLoading) const Center(child: CircularProgressIndicator(color: kBrown,)),
          /// * Displays an error message if there is an error loading the products.
          if (provider.error.isNotEmpty) Center(child: Text('Error: ${provider.error}')),
          /// * Displays a message if there are no products available.
          if (provider.products != null && provider.products!.isEmpty && !provider.isLoading) const Center(child: Text('No hay información por el momento.')),
          /// * Displays the list of products.
          if (provider.products != null && provider.products!.isNotEmpty) ...[
            Expanded(
              child: GridView.builder(
                itemCount: provider.products!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _numberCards(sizeWidth),
                  crossAxisSpacing: kSize10,
                  mainAxisSpacing: kSize10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  ProductModel? element = provider.products?[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(context, kDetailScreen,
                        arguments: element),
                    child: Padding(
                      padding: const EdgeInsets.only(top: kSize20),
                      child: CustomCard(element: element),
                    ),
                  );
                },
              ),
            )
          ],
        ],
      ),
      /// * Floating action button to navigate to the create screen.
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          List<ProductModel>? dataNavigation = await Navigator.pushNamed(context, kCreateScreen) as List<ProductModel>?;
          if(dataNavigation != null){
            setState(() {
              provider.products = dataNavigation;
            });
          }
        },
        backgroundColor: kTan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSize50),
        ),
        elevation: 2,
        child: const Icon(
          Icons.add,
          color: kBrown,
          size: kSize30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
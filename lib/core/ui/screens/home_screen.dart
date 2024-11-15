import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';
import 'package:etapa1/share/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    provider.loadProducts();
  }
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
    final provider = Provider.of<ProductsProvider>(context);
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          if (provider.isLoading) const Center(child: CircularProgressIndicator(color: kBrown,)),
          if (provider.error.isNotEmpty) Center(child: Text('Error: ${provider.error}')),
          if (provider.products != null && provider.products!.isEmpty && !provider.isLoading) const Center(child: Text('No hay información por el momento.')),
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
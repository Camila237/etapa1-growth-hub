import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';
import 'package:etapa1/share/exports.dart';
import 'widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<ProductModel>>? data;
  const HomeScreen({super.key, this.data});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> _dataFuture;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    _dataFuture = widget.data ?? provider.loadProducts();
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
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: const CustomAppBar(),
      body: FutureBuilder<List<ProductModel>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: kBrown,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final _data = snapshot.data!;
            return GridView.builder(
              itemCount: _data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _numberCards(sizeWidth),
                crossAxisSpacing: kSize10,
                mainAxisSpacing: kSize10,
              ),
              itemBuilder: (BuildContext context, int index) {
                ProductModel element = _data[index];
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, kDetailScreen,
                      arguments: element),
                  child: Padding(
                    padding: const EdgeInsets.only(top: kSize20),
                    child: CustomCard(element: element),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, kCreateScreen),
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
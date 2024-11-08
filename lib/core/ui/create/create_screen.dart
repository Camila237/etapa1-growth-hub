import 'package:etapa1/share/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  final _ratingController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: kCrayola,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSize10),
                  ),
                ),
                validator:  (value) => Validations.title(value: value, message: 'Please enter a title'),
              ),
              const SizedBox(height: kSize20),
              TextFormField(
                controller: _descriptionController,
                decoration:InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSize10),
                  ),
                ),
                validator: (value) => Validations.description(value: value, message: 'Please enter a description'),
              ),
              const SizedBox(height: kSize20),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSize10),
                  ),
                ),
                validator: (value) => Validations.category(value: value, message: 'Please enter a category'),
              ),
              const SizedBox(height: kSize20),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSize10),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => Validations.number(value: value, message: 'Please enter a price', messageRegex: 'Is not a valid number.'),
              ),
              const SizedBox(height: kSize20),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSize10),
                  ),
                ),
                validator: (value) =>
                  Validations.imageUrl(value: value, message: 'Please enter a URL', messageRegex: 'Enter a valid image URL (png, jpg, jpeg, gif, bmp)'),
              ),
              const SizedBox(height: kSize20),
              TextFormField(
                controller: _ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kSize10),
                  ),
                ),
                validator: (value) => Validations.number(value: value, message: 'Please enter an rating', messageRegex: 'Is not a valid number.'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    styleBtn: AppStyles.basicRoundedButton(
                      colorBg: kTan,
                      colorText: kWhite,
                      radius: kSize20,
                      widthSide: kSize2,
                      colorBorder: kTan,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newProduct = ProductModel(
                          id: 0,
                          title: _titleController.text,
                          description: _descriptionController.text,
                          price: double.parse(_priceController.text),
                          image: _imageController.text,
                          rating: RatingModel(rate: double.parse(_ratingController.text), count: 0),
                          category: _categoryController.text,
                        );
                        Future<List<ProductModel>> updateProducts = Provider.of<ProductsProvider>(context, listen: false)
                            .createProduct(newProduct);
                        Navigator.pushNamed(context, kHomeScreen, arguments: updateProducts);
                      }
                    },
                    text: 'Create',
                    styleText: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
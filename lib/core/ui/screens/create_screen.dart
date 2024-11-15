import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/share/exports.dart';
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
   final provider = Provider.of<ProductsProvider>(context);

   return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: kCrayola,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSize10),
                    ),
                  ),
                  validator:  (value) => Validations.title(value: value, message: 'Por favor ingresa el título'),
                ),
                const SizedBox(height: kSize20),
                TextFormField(
                  controller: _descriptionController,
                  decoration:InputDecoration(
                    labelText: 'Descripción',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSize10),
                    ),
                  ),
                  validator: (value) => Validations.description(value: value, message: 'Por favor ingresa la descripción'),
                ),
                const SizedBox(height: kSize20),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    labelText: 'Categoría',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSize10),
                    ),
                  ),
                  validator: (value) => Validations.category(value: value, message: 'Por favor ingresa la categoría'),
                ),
                const SizedBox(height: kSize20),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSize10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => Validations.price(value: value, message: 'Por favor ingresa el precio', messageRegex: 'No es un número válido.'),
                ),
                const SizedBox(height: kSize20),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    labelText: 'URL de la imagen',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSize10),
                    ),
                  ),
                  validator: (value) =>
                    Validations.imageUrl(value: value, message: 'Por favor ingresa la URL de la imagen', messageRegex: 'Ingrasa una URL de la imagen válida (png, jpg, jpeg, gif, bmp)'),
                ),
                const SizedBox(height: kSize20),
                TextFormField(
                  controller: _ratingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Calificación',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSize10),
                    ),
                  ),
                  validator: (value) => Validations.rate(value: value, message: 'Por favor ingresa una calificación', messageRegex: 'No es un número válido.'),
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
                          List<ProductModel> productsWithNewProduct = provider.createProduct(newProduct);
                          Navigator.of(context).pop(productsWithNewProduct);
                        }
                      },
                      text: 'Crear',
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
      ),
    );
  }
}
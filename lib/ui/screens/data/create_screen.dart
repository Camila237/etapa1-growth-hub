import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/data/entities/product_model.dart';
import 'package:etapa1/data/entities/rating_model.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';
import 'package:etapa1/domain/themes/app_styles.dart';
import 'package:etapa1/domain/validations/validations.dart';
import 'package:etapa1/ui/provider/products_provider.dart';
import 'package:etapa1/ui/widgets/exports.dart';

/// * Screen to create a new product.
/// * This screen allows you to create a new product by entering the necessary information such as title, description, price, image, rating, and category.
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateScreen> {

  /// * Global key to manage the form state.
  final _formKey = GlobalKey<FormState>();

  /// * Controller to manage the title input.
  final _titleController = TextEditingController();

  /// * Controller to manage the description input.
  final _descriptionController = TextEditingController();

  /// * Controller to manage the category input.
  final _categoryController = TextEditingController();

  /// * Controller to manage the price input.
  final _priceController = TextEditingController();

  /// * Controller to manage the image input.
  final _imageController = TextEditingController();

  /// * Controller to manage the rating input.
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
    /// * Provider to manage products logic.
    final provider = Provider.of<ProductsProvider>(context);
    /// * filter only allow digits
    final filterDigits  = [FilteringTextInputFormatter.digitsOnly];

    return Scaffold(
      appBar: AppBar(
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
                /// * Text field for the product title.
                CustomTextFormField(
                  controller: _titleController,
                  validateInput: (value) => Validations.title(
                      value: value, message: 'Por favor ingresa el título'),
                  hint: 'Nombre',
                ),
                const SizedBox(height: kSize20),
                /// * Text field for the product description.
                CustomTextFormField(
                  controller: _descriptionController,
                  validateInput: (value) => Validations.description(
                      value: value,
                      message: 'Por favor ingresa la descripción'),
                  hint: 'Descripción',
                ),
                const SizedBox(height: kSize20),
                /// * Text field for the product category.
                CustomTextFormField(
                  controller: _categoryController,
                  hint: 'Categoría',
                  validateInput: (value) => Validations.category(
                      value: value, message: 'Por favor ingresa la categoría'),
                ),
                const SizedBox(height: kSize20),
                /// * Text field for the product price.
                CustomTextFormField(
                  controller: _priceController,
                  hint: 'Precio',
                  inputFormatters: filterDigits,
                  validateInput: (value) => Validations.price(
                      value: value,
                      message: 'Por favor ingresa el precio',
                      messageRegex: 'No es un número válido.'),
                ),
                const SizedBox(height: kSize20),
                /// * Text field for the product image.
                CustomTextFormField(
                  controller: _imageController,
                  hint: 'URL de la imagen',
                  validateInput:  (value) => Validations.imageUrl(
                      value: value,
                      message: 'Por favor ingresa la URL de la imagen',
                      messageRegex:
                          'Ingrasa una URL de la imagen válida (png, jpg, jpeg, gif, bmp)'),
                ),
                const SizedBox(height: kSize20),
                /// * Text field for the product rating.
                CustomTextFormField(
                  controller: _ratingController,
                  hint: 'Calificación',
                  inputFormatters: filterDigits,
                  helperText: 'Ingresa solo números del 1 al 5.',
                  validateInput:  (value) => Validations.rate(
                      value: value,
                      message: 'Por favor ingresa una calificación',
                      messageRegex:
                          'No es un número válido. Debe ser un número del 1 al 5.'),
                ),
                const SizedBox(height: 20),
                /// * Button to create a new product.
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
                          /// * Create a new product with form information.
                          final newProduct = ProductModel(
                            id: 0,
                            title: _titleController.text,
                            description: _descriptionController.text,
                            price: double.parse(_priceController.text),
                            image: _imageController.text,
                            rating: RatingModel(
                                rate: double.parse(_ratingController.text),
                                count: 0),
                            category: _categoryController.text,
                          );
                          /// * Add the new product to the list of products and close the current screen.
                          List<ProductModel> productsWithNewProduct =
                              provider.createProduct(newProduct);
                          Navigator.of(context).pop(productsWithNewProduct);
                        }
                      },
                      text: 'Crear',
                      styleText:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/share/exports.dart';
import 'package:etapa1/core/exports.dart';
import 'package:etapa1/config/exports.dart';

class EditScreen extends StatefulWidget {
  final ProductModel? product;

  const EditScreen({super.key, required this.product});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController categoryController;
  late TextEditingController priceController;
  late TextEditingController ratingController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      titleController = TextEditingController(text: widget.product!.title);
      descriptionController = TextEditingController(text: widget.product!.description);
      categoryController = TextEditingController(text: widget.product!.category);
      priceController = TextEditingController(text: widget.product!.price.toString());
      ratingController = TextEditingController(text: widget.product!.rating.rate.toString());
      imageController = TextEditingController(text: widget.product!.image);
    }else{
      titleController = TextEditingController();
      descriptionController = TextEditingController();
      categoryController = TextEditingController();
      priceController = TextEditingController();
      ratingController = TextEditingController();
      imageController = TextEditingController();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    priceController.dispose();
    ratingController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);

    return widget.product == null
        ? const CustomErrorNavigation()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: kCrayola,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kSize20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Editar un producto',
                            style:
                                Theme.of(context).textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: kBrown,
                                    ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(height: kSize20),
                        TextFormField(
                          controller: titleController,
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
                          controller: descriptionController,
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
                          controller: categoryController,
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
                          controller: priceController,
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
                          controller: imageController,
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
                          controller: ratingController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Calificación',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kSize10),
                            ),
                          ),
                          validator: (value) => Validations.rate(value: value, message: 'Por favor ingresa una calificación', messageRegex: 'No es un número válido.'),
                        ),
                        const SizedBox(height: kSize20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: AppStyles.basicRoundedButton(
                                radius: kSize20,
                                elevation: kSize2,
                                colorBg: kTan,
                                colorBorder: kTan,
                                colorText: kWhite,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  List<ProductModel> editedProducts =
                                      provider.updateProduct(
                                    ProductModel(
                                      id: widget.product!.id,
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      category: categoryController.text,
                                      price: double.parse(priceController.text),
                                      image: imageController.text,
                                      rating: RatingModel(
                                          rate:
                                              double.parse(ratingController.text),
                                          count: widget.product!.rating.count),
                                    ),
                                  );
                                  Navigator.of(context).pop(editedProducts);
                                }
                              },
                              child: const Text('Update'),
                            ),
                            const SizedBox(width: kSize50),
                            ElevatedButton(
                              style: AppStyles.basicRoundedButton(
                                radius: kSize20,
                                elevation: kSize2,
                                colorBg: kWhite,
                                colorBorder: kTan,
                                colorText: kTan,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

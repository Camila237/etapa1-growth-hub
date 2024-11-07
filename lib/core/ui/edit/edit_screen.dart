import 'package:etapa1/share/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      titleController.text = widget.product!.title;
      descriptionController.text = widget.product!.description;
      categoryController.text = widget.product!.category;
      priceController.text = widget.product!.price.toString();
      ratingController.text = widget.product!.rating.rate.toString();
      imageController.text = widget.product!.image;
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
    final globalNotifier = Provider.of<GlobalAppProvider>(context);

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
              body: Padding(
                padding: const EdgeInsets.all(kSize20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit your product',
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
                          labelText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kSize10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kSize20),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kSize10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kSize20),
                      TextFormField(
                        controller: categoryController,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kSize10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a category';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kSize20),
                      TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kSize10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a price';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kSize20),
                      TextFormField(
                        controller: ratingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Rating',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kSize10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a rating';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kSize20),
                      TextFormField(
                        controller: imageController,
                        decoration: InputDecoration(
                          labelText: 'Image Url',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kSize10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a URL';
                          } else if (!Validators.imageUrlRegex.hasMatch(value)) {
                            return 'Enter a valid image URL (png, jpg, jpeg, gif, bmp)';
                          }
                          return null;
                        },
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Future<List<ProductModel>> updateProducts =
                                globalNotifier.updateProduct(
                                  ProductModel(
                                    id: widget.product!.id,
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    category: categoryController.text,
                                    price:
                                    double.parse(priceController.text),
                                    image: imageController.text,
                                    rating: RatingModel(
                                        rate: double.parse(
                                            ratingController.text),
                                        count:
                                        widget.product!.rating.count),
                                  ),
                                );
                                Navigator.pushNamed(context, kHomeScreen,
                                    arguments: updateProducts);
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
                                    await globalNotifier
                                        .deleteProduct(widget.product!.id);
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
          );
  }
}

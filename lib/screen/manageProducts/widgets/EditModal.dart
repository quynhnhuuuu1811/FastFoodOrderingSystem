import 'dart:io';

import 'package:fastfood_ordering_system/features/category/data/category_repository.dart';
import 'package:fastfood_ordering_system/features/category/dtos/category_dto.dart';
import 'package:fastfood_ordering_system/features/foods/dtos/food_dto.dart';
import 'package:fastfood_ordering_system/utils/FirebaseStorageService.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/http_client.dart';
import '../../../features/category/bloc/category_bloc.dart';
import '../../../features/category/data/category_api_client.dart';
import '../../../features/foods/bloc/food_bloc.dart';

class EditProductModal extends StatefulWidget {
  final FoodDto product;
  const EditProductModal({
    super.key,
    required this.product,
  });

  @override
  _EditProductModalState createState() => _EditProductModalState();
}

class _EditProductModalState extends State<EditProductModal> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  File? _selectedImage;
  String productTypeId = ''; // Use this for storing selected category ID
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _priceController = TextEditingController(text: widget.product.price.toString());

    // Initialize productTypeId with the current product's category ID
    productTypeId = widget.product.category.id.toString();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CategoryRepository(CategoryApiClient: CategoryApiClient(dio: dio)),
      child: BlocProvider(
        create: (context) => CategoryBloc(
          context.read<CategoryRepository>(),
        )..add(
          FetchCategories(),
        ),
        child: Builder(
            builder: (context) {
              final categoryState = context.watch<CategoryBloc>().state;

              return Padding(
                padding: MediaQuery.of(context).viewInsets, // This makes the modal adjust when the keyboard is shown
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Chỉnh sửa sản phẩm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Center(
                            child: _selectedImage == null
                                ? Image.network(widget.product.image, height: 100, width: 100)
                                : Image.file(_selectedImage!, height: 100, width: 100),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: ElevatedButton(
                              onPressed: _pickImage,
                              child: const Text('Chọn ảnh', style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
                          ),
                          TextField(
                            controller: _priceController,
                            decoration: const InputDecoration(labelText: 'Giá sản phẩm'),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Loại món ăn',
                              border: OutlineInputBorder(),
                            ),
                            value: productTypeId.isNotEmpty ? productTypeId : null,
                            items: categoryState.categories.map((CategoryDto type) {
                              return DropdownMenuItem<String>(
                                value: type.id.toString(),
                                child: Text(type.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                productTypeId = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select product type';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                String imageUrl = widget.product.image;

                                if (_selectedImage != null) {
                                  // If a new image is selected, upload it and get the new URL
                                  imageUrl = await FirebaseStorageService().uploadImage(_selectedImage!);
                                }
                                // Trigger the Bloc event to update the product
                                context.read<FoodBloc>().add(
                                  UpdateFood(
                                    id: widget.product.id,
                                    name: _nameController.text,
                                    price: int.parse(_priceController.text),
                                    category: int.parse(productTypeId),
                                    image: imageUrl,
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                              child: const Text('Lưu', style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}

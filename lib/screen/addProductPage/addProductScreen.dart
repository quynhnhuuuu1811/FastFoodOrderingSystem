import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/http_client.dart';
import '../../features/category/bloc/category_bloc.dart';
import '../../features/category/data/category_api_client.dart';
import '../../features/category/data/category_repository.dart';
import '../../features/category/dtos/category_dto.dart';
import '../../features/foods/bloc/food_bloc.dart';
import '../../utils/FirebaseStorageService.dart';
import '../widget/RoundedButton.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  final nameController = TextEditingController();
  final priceController = TextEditingController();


  String productTypeId = '';

  @override
  dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }
  Future<void> _handleClick(BuildContext context) async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an image.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      try {
        String imageUrl = await FirebaseStorageService().uploadImage(_image!);

        context.read<FoodBloc>().add(AddFood(
          nameController.text,
          int.parse(priceController.text),
          imageUrl,
          int.parse(productTypeId),
        ));

        // Thông báo thành công
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thêm sản phẩm thành công!'),
            backgroundColor: Colors.green,
          ),
        );

        // Đặt lại trạng thái
        setState(() {
          nameController.clear();
          priceController.clear();
          _image = null;
          productTypeId = '';
        });
      } catch (e) {
        // Thông báo lỗi nếu có lỗi xảy ra
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Có lỗi xảy ra: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RepositoryProvider(
          create: (context) => CategoryRepository(CategoryApiClient: CategoryApiClient(dio: dio)),
          child: BlocProvider(
            create: (context) => CategoryBloc( context.read<CategoryRepository>())..add(FetchCategories()),

            child: Builder(
              builder: (context) {
                final categoryState = context.watch<CategoryBloc>().state;
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: _image == null
                            ? Container(
                               height: 150,
                              color: Colors.grey[300],
                              child: const Icon(Icons.add_a_photo, size: 50),
                        )
                            : Image.file(_image!, height: 150, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Tên món ăn',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter product name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: priceController,
                        decoration: const InputDecoration(
                          labelText: 'Giá',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter product price';
                          }
                          return null;
                        },

                      ),
                      const SizedBox(height: 20),

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
                      const SizedBox(height: 30),
                      RoundedButton(
                        onpressed: (){
                          _handleClick(context);
                        },
                        textColor: Colors.white,
                        buttonColor: Colors.black,
                        fontSize: 18,
                        buttonText: 'Thêm món ăn',
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

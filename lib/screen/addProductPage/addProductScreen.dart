import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/RoundedButton.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();

  String _productName = '';
  String _productPrice = '';
  String _productType = '';

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.add_a_photo, size: 50),
                )
                    : Image.file(_image!, height: 150, fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tên món ăn',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _productName = value!;
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
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
                onSaved: (value) {
                  _productPrice = value!;
                },
              ),
              SizedBox(height: 20),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Loại món ăn',
                  border: OutlineInputBorder(),
                ),
                value: _productType.isNotEmpty ? _productType : null,
                items: ['Burger', 'Pizza', 'Fried Chicken','Fried Potatoes','Hotdog','Pasta' ,'Drink'].map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _productType = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select product type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              RoundedButton(
                onpressed: (){},
                textColor: Colors.white,
                buttonColor: Colors.black,
                fontSize: 18,
                buttonText: 'Thêm món ăn',
              )
            ],
          ),
        ),
      ),
    );
  }
}

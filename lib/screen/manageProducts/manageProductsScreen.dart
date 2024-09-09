import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For handling image files
import 'package:go_router/go_router.dart';

import '../../core/constant/app_color.dart';

class ManageProductsScreen extends StatefulWidget {
  const ManageProductsScreen({super.key});

  @override
  State<ManageProductsScreen> createState() => _ManageProductsScreenState();
}

class _ManageProductsScreenState extends State<ManageProductsScreen> {
  final List<Map<String, dynamic>> products = [
    {'image': 'assets/images/demo.png', 'name': 'Burger x2 Gà', 'price': 30000, 'category': 'Burger', 'checked': false},
    {'image': 'assets/images/demo.png', 'name': 'Pizza xúc xích', 'price': 15000, 'category': 'Pizza', 'checked': false},
    {'image': 'assets/images/demo.png', 'name': 'Coca-Cola', 'price': 30000, 'category': 'Drinks', 'checked': false},
    {'image': 'assets/images/demo.png', 'name': 'Mì cua', 'price': 28000, 'category': 'Pasta', 'checked': false},
  ];

  void _editProduct(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return EditProductModal(
          product: products[index],
          onSave: (updatedProduct) {
            setState(() {
              products[index] = updatedProduct;
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  Future<void> _showDeleteConfirmDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Cannot dismiss the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Bạn có chắc chắn muốn xóa sản phẩm này?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Xóa', style: TextStyle(color: Colors.black)),
              onPressed: () {
                _deleteProduct(index); // Delete the product
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Danh sách sản phẩm',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Shopee_Bold',
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ProductTable(
            products: products,
            onEdit: _editProduct,
            onDelete: (index) => _showDeleteConfirmDialog(index),
          ),
        ),
      ),
    );
  }
}

class ProductTable extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function(int) onEdit;
  final Function(int) onDelete;

  const ProductTable({
    super.key,
    required this.products,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FixedColumnWidth(70.0),
        1: FlexColumnWidth(2.2),
        2: FixedColumnWidth(90.0),
        3: FlexColumnWidth(2.1),
        4: FixedColumnWidth(100.0),
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: const [
            TableCell(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Image', textAlign: TextAlign.center),
            )),
            TableCell(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Name', textAlign: TextAlign.center),
            )),
            TableCell(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Price', textAlign: TextAlign.center),
            )),
            TableCell(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Category', textAlign: TextAlign.center),
            )),
            TableCell(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Actions', textAlign: TextAlign.center),
            )),
          ],
        ),
        ...products.asMap().entries.map((entry) {
          final index = entry.key;
          final product = entry.value;
          return TableRow(
            children: [
              TableCell(
                child: product['image'].toString().startsWith('assets/')
                    ? Image.asset(
                  product['image'],
                  height: 50,
                  width: 50,
                )
                    : Image.file(
                  File(product['image']),
                  height: 50,
                  width: 50,
                ),
              ),
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product['name']),
              )),
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${product['price']} VND'),
              )),
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product['category']),
              )),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => onEdit(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => onDelete(index),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}

class EditProductModal extends StatefulWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>) onSave;

  const EditProductModal({
    super.key,
    required this.product,
    required this.onSave,
  });

  @override
  _EditProductModalState createState() => _EditProductModalState();
}

class _EditProductModalState extends State<EditProductModal> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _categoryController;
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product['name']);
    _priceController = TextEditingController(text: widget.product['price'].toString());
    _categoryController = TextEditingController(text: widget.product['category']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    super.dispose();
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
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // This makes the modal adjust when the keyboard is shown
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Chỉnh sửa sản phẩm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Center(
                  child: _selectedImage == null
                      ? Image.asset(widget.product['image'], height: 100, width: 100)
                      : Image.file(_selectedImage!, height: 100, width: 100),
                ),
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                    ),
                    onPressed: _pickImage,
                    child: const Text('Chọn ảnh',
                    style:TextStyle(
                      color: Colors.black
                    )),
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
                TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Danh mục sản phẩm'),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final updatedProduct = {
                        'image': _selectedImage != null ? _selectedImage!.path : widget.product['image'],
                        'name': _nameController.text,
                        'price': int.parse(_priceController.text),
                        'category': _categoryController.text,
                      };
                      widget.onSave(updatedProduct);
                    },
                    child: const Text('Lưu',
                    style: TextStyle(
                      color: Colors.black
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

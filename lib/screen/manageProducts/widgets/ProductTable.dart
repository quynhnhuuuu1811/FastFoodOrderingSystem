import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/foods/bloc/food_bloc.dart';
import '../../../features/foods/dtos/food_dto.dart';
import 'EditModal.dart';

class ProductTable extends StatefulWidget {
  const ProductTable({super.key});

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  @override
  void initState() {
    super.initState();
    // Dispatch the FetchAllFoods event when the widget is initialized
    context.read<FoodBloc>().add(FetchAllFoods());
  }

  void _editProduct(FoodDto products) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return EditProductModal(
          product: products,
        );
      },
    );
  }

  Future<void> _showDeleteConfirmDialog(int id, BuildContext thisContext) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
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
                thisContext.read<FoodBloc>().add(DeleteFood(id));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodBloc, FoodState>(
      listener: (context, state) {
        if (state.status == FoodStatus.updateSuccess) {
          // Khi cập nhật thành công, lấy lại danh sách
          context.read<FoodBloc>().add(FetchAllFoods());
        }
      },
      child: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state.status == FoodStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == FoodStatus.failure) {
            return const Center(child: Text('Failed to load foods'));
          } else {
            return Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FixedColumnWidth(80.0),
                1: FlexColumnWidth(2.1),
                2: FixedColumnWidth(100.0),
                3: FlexColumnWidth(1.8),
                4: FixedColumnWidth(100.0),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Image', textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Name', textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Price', textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Category', textAlign: TextAlign.center),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Actions', textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
                ...state.foods.map((product) {
                  return TableRow(
                    children: [
                      TableCell(
                        child: Image.network(
                          product.image,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(product.name),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${product.price} VND'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${product.category.name}'),
                        ),
                      ),
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _editProduct(product);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _showDeleteConfirmDialog(product.id, context),
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
        },
      ),
    );
  }

}


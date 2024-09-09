import 'package:flutter/material.dart';

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
        0: FixedColumnWidth(80.0),
        1: FlexColumnWidth(2.1),
        2: FixedColumnWidth(100.0),
        3: FlexColumnWidth(1.8),
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
                child: Image.asset(
                  product['image'],
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

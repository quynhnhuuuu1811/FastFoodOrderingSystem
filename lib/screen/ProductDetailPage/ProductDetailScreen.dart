import 'package:fastfood_ordering_system/screen/ProductDetailPage/widgets/CustomeBottomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../core/constant/app_color.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController _amountController = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close,
              color: Colors.black,
              size: 35),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Column(
        children:[
          Image(image: AssetImage('assets/images/demo.png'),
          height: 400),
          Divider(color: AppColors.grayColor, thickness: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Tên sản phẩm',
              style:TextStyle(
                fontSize: 30,
                fontFamily: 'Shopee_Bold'
              )),
              Text('123000VND',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Shopee_Medium'
              ),)
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomeBottomAppBar(amountController: _amountController),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../core/constant/app_color.dart';
import '../widget/IconInContainer.dart';
import '../widget/ProductItem.dart';

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
      bottomNavigationBar: BottomAppBar(
        color: AppColors.grayColor,
        height: 120,
        child: Row(
          children:[
            IconInContainer(
              icon:Icons.add,
              color: Colors.white,
              colorIcon: Colors.black,
            ),

            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2),
              ),
              child: Center(
                child: TextField(
                  controller: _amountController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconInContainer(
              icon:Icons.remove,
              color: Colors.white,
              colorIcon: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  const Text(
                    'Tổng cộng: 123000 VND',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21
                      )
                    ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                      onPressed:(){},
                      child: const Text('Thêm vào giỏ hàng',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),
                      ))

                ],
              ),
            )
          ]
        )
      ),
    );
  }
}

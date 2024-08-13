import 'package:fastfood_ordering_system/screen/OrderPage/widgets/OrderItem.dart';
import 'package:fastfood_ordering_system/screen/widget/RoundedTextField.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../widget/RoundedButton.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Map<String, dynamic>> OrderList = [
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 1', 'price': 123000, 'quantity': 1},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 2', 'price': 123000, 'quantity': 2},
    {'image_url': 'assets/images/demo.png', 'productName': 'Tên món 3', 'price': 123000, 'quantity': 3},
  ];

  final int totalAmount = 0;
  TextEditingController _addressController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )),
          content: const SizedBox(
            height: 330,
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/deliver.gif'),),
                SizedBox(height: 20),
                Text('Đơn hàng đang giao tới bạn. Vui lòng kiểm tra điện thoại để nhận được cuộc gọi của shipper',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic
                )),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17
              ),),
              onPressed: () {
                context.pop() ;// Close the dialog
                context.go(RouteName.cart); // Navigate back to the cart
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Chi tiết đơn hàng',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              RoundedTextField(
                  controller:_addressController,
                  hintText: 'Nhập địa chỉ giao hàng',
                  icon: Icons.location_on,
                  isPassword: false,
                  selectColor: Colors.black,
                  keyboardType: TextInputType.text,
                  hintTextColor: AppColors.grayColor,
                  textInputAction: TextInputAction.done,
                  validator:null),
              RoundedTextField(
                  controller:_addressController,
                  hintText: 'Nhập ghi chú',
                  icon: Icons.note_alt_sharp,
                  isPassword: false,
                  selectColor: Colors.black,
                  keyboardType: TextInputType.text,
                  hintTextColor: AppColors.grayColor,
                  textInputAction: TextInputAction.done,
                  validator:null),
              const Divider(),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: OrderList.length,
                    itemBuilder: (context, index) {
                      final item = OrderList[index];
                      return OrderItem(
                        productname: item['productName'],
                        price: item['price'],
                        quantity: item['quantity'],
                        image_url: item['image_url'],
                      );
                    },
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$totalAmount VND',
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  RoundedButton(
                    textColor: Colors.white,
                    onpressed: _showPaymentDialog, // Show the dialog
                    buttonColor: Colors.black,
                    fontSize: 25,
                    buttonText: 'Thanh toán ngay',
                    icon: null,
                    font: 'Shopee_Bold',
                    iconColor: null,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

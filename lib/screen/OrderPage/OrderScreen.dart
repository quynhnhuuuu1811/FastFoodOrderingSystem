import 'package:fastfood_ordering_system/screen/OrderPage/widgets/OrderItem.dart';
import 'package:fastfood_ordering_system/screen/widget/RoundedTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../../features/order/bloc/order_bloc.dart';
import '../../features/order/dtos/select_Items_dto.dart';
import '../../utils/token.dart';
import '../../utils/validate.dart';
import '../widget/RoundedButton.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int userId = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int totalAmount = 0;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    if (token != null) {
      setState(() {
        userId = int.parse(getUserIdFromToken(token));
      });
    }
  }

  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          content: const SizedBox(
            height: 330,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/deliver.gif'),
                ),
                SizedBox(height: 20),
                Text(
                  'Đơn hàng đang giao tới bạn. Vui lòng kiểm tra điện thoại để nhận được cuộc gọi của shipper',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onPressed: () {
                context.pop(); // Close the dialog
                context.go(RouteName.home); // Navigate back to the cart
              },
            ),
          ],
        );
      },
    );
  }

  void _handleOrderState(OrderState orderState) {
    if (orderState.status == OrderStatus.success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPaymentDialog();
        context.read<OrderBloc>().add(OrderReset());
      });
    } else if (orderState.status == OrderStatus.failure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thông báo',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              content: const SizedBox(
                height: 330,
                child: Column(
                  children: [
                    Text(
                      'Đã xảy ra lỗi trong quá trình đặt hàng. Vui lòng thử lại sau',
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17),
                  ),
                  onPressed: () {
                    context.pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
        context.read<OrderBloc>().add(OrderReset());
      }
      );
    }
  }

  void calculateTotalAmount(List<SelectItemsDto> items) {
    totalAmount = items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void onCheckOut() {
    if (_formKey.currentState!.validate()) {
      final orderState = context.read<OrderBloc>().state;
      final userId = this.userId;
      final address = _addressController.text;
      final note = _noteController.text;
      context.read<OrderBloc>().add(OrderCreate(
        address: address,
        selectItems: orderState.selectItems,
        userId: userId,
        note: note,
      ));
    }

  }

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  @override
  Widget build(BuildContext context) {
    final orderState = context.watch<OrderBloc>().state;
    _handleOrderState(orderState);
    // Reset totalAmount before recalculating
   calculateTotalAmount(orderState.selectItems);


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
              Form(
                key: _formKey,
                child: Column(
                children: [
                  RoundedTextField(
                      controller:_addressController,
                      hintText: 'Nhập địa chỉ giao hàng',
                      icon: Icons.location_on,
                      isPassword: false,
                      selectColor: Colors.black,
                      keyboardType: TextInputType.text,
                      hintTextColor: AppColors.grayColor,
                      textInputAction: TextInputAction.next,
                      validator: validateAddress),
                  RoundedTextField(
                      controller:_noteController,
                      hintText: 'Nhập ghi chú',
                      icon: Icons.note_alt_sharp,
                      isPassword: false,
                      selectColor: Colors.black,
                      keyboardType: TextInputType.text,
                      hintTextColor: AppColors.grayColor,
                      textInputAction: TextInputAction.done,
                      validator:null),
                ]
                )
              ),
              const Divider(),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderState.selectItems.length,
                    itemBuilder: (context, index) {
                      final item = orderState.selectItems[index];
                      totalAmount += item.price * item.quantity;
                      return OrderItem(
                        productname: item.name,
                        price: item.price,
                        quantity: item.quantity,
                        image_url: item.image,
                      );
                    },
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng tiền',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$totalAmount VND',
                        style: const TextStyle(
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  RoundedButton(
                    textColor: Colors.white,
                    onpressed: onCheckOut,
                    buttonColor: Colors.black,
                    fontSize: 25,
                    buttonText: 'Thanh toán ngay',
                    icon: null,
                    font: 'Shopee_Bold',
                    iconColor: null,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

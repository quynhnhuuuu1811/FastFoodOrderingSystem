import 'package:fastfood_ordering_system/features/foods/dtos/food_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/routes.dart';
import '../../features/cart/bloc/cart_bloc.dart';
import '../../utils/token.dart';
import 'IconInContainer.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.food,
  });
  final FoodDto food;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late int _userId;
  @override
  void initState() {
    super.initState();
    _getUserId().then((onValue) {
      _userId = int.parse(onValue);
      setState(() {

      });
    });
  }
  Future<String> _getUserId() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final jwt = sf.getString('accessToken');
    if (jwt == null) {
      throw Exception("JWT token not found");
    }
    return getUserIdFromToken(jwt);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(RouteName.productDetail,extra: widget.food);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image(
                image: NetworkImage(widget.food.image),
                height: 100, // Giảm chiều cao hình ảnh để tránh overflow
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Expanded( // Sử dụng Expanded để phân bổ không gian
              child: Row(
                children: [
                   Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.food.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Shopee_Bold',
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${widget.food.price} VND',
                            style: const TextStyle(
                              fontFamily: 'Shopee_Medium',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconInContainer(
                    onPressed: () async {
                      context.read<CartBloc>().add(AddFoodToCart(userId: _userId, foodId: widget.food.id, quantity: 1));
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Thêm vào giỏ hàng thành công'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                    },
                    icon: Icons.add,
                    color: Colors.black,
                    colorIcon: Colors.white,
                    containerSize: 40,
                    iconSize: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

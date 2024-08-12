import 'package:flutter/material.dart';
import 'IconInContainer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: '1');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: 2),
        ),
        child: Column(
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image(
                image: AssetImage('assets/images/demo.png'),
                height: 120,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên sản phẩm',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Shopee_Bold',
                        ),
                      ),
                      Text(
                        '123000 VND',
                        style: TextStyle(
                          fontFamily: 'Shopee_Medium',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                IconInContainer(
                  icon: Icons.add,
                  color: Colors.black,
                  colorIcon: Colors.white,
                  containerSize: 40,
                  iconSize: 20,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

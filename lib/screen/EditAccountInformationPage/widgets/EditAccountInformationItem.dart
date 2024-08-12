import 'package:flutter/material.dart';

class EditAccountInformationItem extends StatelessWidget {
  EditAccountInformationItem({
    super.key,
    required this.title,
    required TextEditingController controller
  }): _controller = controller;

  late String title;
  final TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Shopee_Bold',
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
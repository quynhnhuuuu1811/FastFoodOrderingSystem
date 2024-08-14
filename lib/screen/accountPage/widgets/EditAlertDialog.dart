import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes.dart';

class EditAlertDialog extends StatelessWidget {
  const EditAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close,
                  size: 20),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top:30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Chỉnh sửa thông tin',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Đổi mật khẩu',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54
              )),
          onPressed: () {
            context.push(RouteName.editPassword);
          },
        ),
        TextButton(
          child: const Text('Thông tin cá nhân',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54
              )),
          onPressed: () {
            context.push(RouteName.editAccountInformation);
          },
        ),
      ],
    );
  }
}
import 'package:fastfood_ordering_system/screen/editPasswordPage/widgets/EditPasswordItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../widget/RoundedButton.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  TextEditingController _oldPassController = TextEditingController();
  TextEditingController _newPassController = TextEditingController();
  TextEditingController _checknewPassController = TextEditingController();

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _checknewPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Shopee_Bold',
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go(RouteName.account);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Form(
          child: Column(
            children: [
              EditPasswordItem(
                title: 'Nhập mật khẩu cũ',
                controller: _oldPassController,
              ),
              EditPasswordItem(
                title: 'Nhập mật khẩu mới',
                controller: _newPassController,
              ),
              EditPasswordItem(
                title: 'Nhập lại mật khẩu mới',
                controller: _checknewPassController,
              ),
              SizedBox(height: 30),
              RoundedButton(
                onpressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đổi mật khẩu thành công'),
                      backgroundColor: Colors.black,
                    ),
                  );
                },
                textColor: Colors.white,
                buttonText: 'Thay đổi',
                fontSize: 25,
                buttonColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
